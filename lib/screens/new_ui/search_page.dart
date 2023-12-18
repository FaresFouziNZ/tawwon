import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tawwon/cloud_functions/database.dart';
import 'package:tawwon/models/local_user.dart';
import 'package:tawwon/widgets/new_ui/item_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  // final String title;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> allCategories = ['phone', 'laptop', 'plastic', 'paper', 'other'];
  String selectedFilter = "";
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LocalUser>(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0,
        title: const Text(
          'شسي',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  controller: searchController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                    focusedBorder:
                        OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 201, 151, 151))),
                    hintText: 'بحث',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Colors.black,
                  ),
                ),
              ),
            ),
            searchController.text == ""
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SingleChildScrollView(
                        reverse: true,
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: allCategories
                              .map(
                                (e) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: selectedFilter == e ? Colors.amber : Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(9),
                                        child: Text(
                                          e,
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        if (selectedFilter == e) {
                                          selectedFilter = "";
                                        } else {
                                          selectedFilter = e;
                                        }
                                      });
                                    },
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      selectedFilter == ""
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                FutureBuilder(
                                  future: DatabaseService()
                                      .getDonationsFilteredByCategory(filter: 'phone', userId: user.uid),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return const Center(
                                          child: CircularProgressIndicator(
                                        color: Color(0xFF213753),
                                      ));
                                    }
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text('Phone'),
                                        ),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          reverse: true,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: snapshot.data?.map((e) {
                                                  return ItemCard(donation: e);
                                                }).toList() ??
                                                [],
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                FutureBuilder(
                                  future: DatabaseService()
                                      .getDonationsFilteredByCategory(filter: 'television', userId: user.uid),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return const Center(
                                          child: CircularProgressIndicator(
                                        color: Color(0xFF213753),
                                      ));
                                    }
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    } else {
                                      return Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text('Television'),
                                          ),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            reverse: true,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: snapshot.data?.map((e) {
                                                    return ItemCard(donation: e);
                                                  }).toList() ??
                                                  [],
                                            ),
                                          ),
                                        ],
                                      );
                                    }
                                  },
                                ),
                                FutureBuilder(
                                  future: DatabaseService()
                                      .getDonationsFilteredByCategory(filter: 'other', userId: user.uid),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState != ConnectionState.done) {
                                      return const Center(
                                          child: CircularProgressIndicator(
                                        color: Color(0xFF213753),
                                      ));
                                    }
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text('Other'),
                                        ),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          reverse: true,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: snapshot.data?.map((e) {
                                                  return ItemCard(donation: e);
                                                }).toList() ??
                                                [],
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            )
                          : FutureBuilder(
                              future: DatabaseService()
                                  .getDonationsFilteredByCategory(filter: selectedFilter, userId: user.uid),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator(
                                    color: Color(0xFF213753),
                                  ));
                                }
                                return Wrap(
                                  children: snapshot.data?.map((e) => ItemCard(donation: e)).toList() ??
                                      [const Text('No data found')],
                                );
                              }),
                    ],
                  )
                : FutureBuilder(
                    future: DatabaseService().getDonationsSearch(searchQuery: searchController.text, uid: user.uid),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                            child: CircularProgressIndicator(
                          color: Color(0xFF213753),
                        ));
                      }
                      return Wrap(
                        children:
                            snapshot.data?.map((e) => ItemCard(donation: e)).toList() ?? [const Text('No data found')],
                      );
                    }),
          ],
        ),
      ),
    );
  }
}
