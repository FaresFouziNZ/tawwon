import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String itemType;
  final String imageUrl;
  final String itemPlace;

  const ItemCard({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.itemType,
    required this.imageUrl,
    required this.itemPlace,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4.0,
        margin: const EdgeInsets.all(10.0),
        color: const Color.fromARGB(255, 33, 55, 83),
        child: Column(
          children: <Widget>[
            // Item Photo (50% of the card)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100.0,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl), // Replace with your image URL
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Item Name
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Text(
                itemName,
                style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            // Item Price
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                itemPrice,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: itemPrice == 'FREE' ? FontWeight.bold : FontWeight.normal,
                  color: itemPrice == 'FREE' ? Colors.red : Colors.white,
                ),
              ),
            ),
            // Item Type
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3), color: const Color.fromARGB(255, 99, 115, 134)),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text(
                        itemPlace,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3), color: const Color.fromARGB(255, 99, 115, 134)),
                    child: Padding(
                      padding: const EdgeInsets.all(1),
                      child: Text(
                        itemType,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
