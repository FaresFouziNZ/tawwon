import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tawwon/models/donation.dart';
import 'package:tawwon/widgets/new_ui/custom_search_bar.dart';
import 'package:tawwon/widgets/new_ui/item_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Map<String, dynamic>> filteredItemsData = [];
  final TextEditingController _searchController = TextEditingController();

  void _onSearchTextChanged(String searchText) async {
    try {
      // Get a reference to the Firestore collection
      CollectionReference items =
          FirebaseFirestore.instance.collection('donates');

      // Perform a query to get documents where any of the fields match the search text
      QuerySnapshot searchResults = await items
          .where('location', isGreaterThanOrEqualTo: searchText)
          .where('location', isLessThan: searchText + 'z')
          .get();

      // Access the documents and update the state to trigger a UI update
      List<Map<String, dynamic>> searchResultsData = [];
      searchResults.docs.forEach((DocumentSnapshot document) {
        searchResultsData.add({
          'name': document['name'],
          'description': document['description'],
          'location': document['location'],
          'category': document['category'],
        });
      });

      // Update the state with the search results
      setState(() {
        filteredItemsData = searchResultsData;
      });
    } catch (e) {
      print('Error searching items: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFF213753),
        title: const Text(
          '',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          _buildCategorySection(),
          if (_searchController.text.isEmpty)
            Column(
              children: [
                _buildFutureItemSection('Phone'),
                _buildFutureItemSection('Plastic'),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildCategorySection() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
        color: Color.fromARGB(255, 33, 55, 83),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CustomSearchBar(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 3, 5, 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  _buildCategoryContainer('Phones', onCategoryClicked: () {
                    _filterItemsByCategory('Phone');
                  }),
                  const SizedBox(width: 10),
                  _buildCategoryContainer('TV\'s', onCategoryClicked: () {
                    _filterItemsByCategory('TV\'s');
                  }),
                  const SizedBox(width: 10),
                  // Add more categories here using the same pattern
                  _buildCategoryContainer('Tablet', onCategoryClicked: () {
                    _filterItemsByCategory('Tablet');
                  }),
                  const SizedBox(width: 10),
                  _buildCategoryContainer('Laptops', onCategoryClicked: () {
                    _filterItemsByCategory('Laptops');
                  }),
                  const SizedBox(width: 10),
                  _buildCategoryContainer('Paper', onCategoryClicked: () {
                    _filterItemsByCategory('Paper');
                  }),
                  const SizedBox(width: 10),
                  _buildCategoryContainer('Plastic', onCategoryClicked: () {
                    _filterItemsByCategory('Plastic');
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryContainer(String categoryName,
      {VoidCallback? onCategoryClicked}) {
    return ElevatedButton(
      onPressed: onCategoryClicked,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        backgroundColor: const Color.fromARGB(255, 99, 115, 134),
      ),
      child: Padding(
        padding: const EdgeInsets.all(9),
        child: Text(
          categoryName,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void _filterItemsByCategory(String category) async {
    try {
      // Get a reference to the Firestore collection
      CollectionReference items =
          FirebaseFirestore.instance.collection('donates');

      // Perform a query to get documents where category matches the selected category
      QuerySnapshot categoryItems =
          await items.where('category', isEqualTo: category).get();

      // Access the documents and update the state to trigger a UI update
      List<Map<String, dynamic>> itemsData = [];
      categoryItems.docs.forEach((DocumentSnapshot document) {
        itemsData.add({
          'name': document['name'],
          'description': document['description'],
        });
      });

      // Update the state with the filtered items data
      setState(() {
        filteredItemsData = itemsData;
      });
    } catch (e) {
      print('Error retrieving $category items: $e');
    }
  }

  Widget _buildFutureItemSection(String category) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance
          .collection('donates')
          .where('category', isEqualTo: category)
          .get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _buildItemSection(category, snapshot.data!.docs);
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildItemSection<T>(String category, List<T> data) {
    print('Number of items for $category: ${data.length}');
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 15, 8, 0),
          child: Text(
            category,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _buildItemWidgets<T>(data),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildItemWidgets<T>(List<T> items) {
    return items.map((item) {
      if (item is QueryDocumentSnapshot) {
        var donation = Donation.fromMap(item.data() as Map<String, dynamic>);
        return ItemCard(donation: donation);
      } else {
        // Handle the case where item is not a QueryDocumentSnapshot
        return const SizedBox.shrink();
      }
    }).toList();
  }
}
