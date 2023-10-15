import 'package:flutter/material.dart';
import 'package:tawwon/widgets/new_ui/item_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.title});
  final String title;
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFF213753),
        title: const Text(
          'Search',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0), // Adjust the radius as needed
                  bottomRight: Radius.circular(10.0), // Adjust the radius as needed
                ),
                color: Color.fromARGB(255, 33, 55, 83),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          fillColor: Colors.white54,
                          labelText: "Search",
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: "Search...",
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.all(Radius.circular(10)))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 3, 5, 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7), color: const Color.fromARGB(255, 99, 115, 134)),
                          child: const Padding(
                            padding: EdgeInsets.all(9),
                            child: Text(
                              'Phones',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7), color: const Color.fromARGB(255, 99, 115, 134)),
                          child: const Padding(
                            padding: EdgeInsets.all(9),
                            child: Text(
                              'Television',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7), color: const Color.fromARGB(255, 99, 115, 134)),
                          child: const Padding(
                            padding: EdgeInsets.all(9),
                            child: Text(
                              'TV\'s',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7), color: const Color.fromARGB(255, 99, 115, 134)),
                          child: const Padding(
                            padding: EdgeInsets.all(9),
                            child: Text(
                              'Tablet',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7), color: const Color.fromARGB(255, 99, 115, 134)),
                          child: const Padding(
                            padding: EdgeInsets.all(9),
                            child: Text(
                              'Laptops',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7), color: const Color.fromARGB(255, 99, 115, 134)),
                          child: const Padding(
                            padding: EdgeInsets.all(9),
                            child: Text(
                              'Paper',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7), color: const Color.fromARGB(255, 99, 115, 134)),
                          child: const Padding(
                            padding: EdgeInsets.all(9),
                            child: Text(
                              'Plastic',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(15.0, 15, 8, 0),
              child:
                  Text('Plastic', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black)),
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  // Add more items as needed
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(15.0, 15, 8, 0),
              child: Text('Phones', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black)),
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  // Add more items as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
