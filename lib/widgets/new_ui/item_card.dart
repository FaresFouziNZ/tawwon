import 'package:flutter/material.dart';
import 'package:tawwon/models/donation.dart';

class ItemCard extends StatelessWidget {
  final Donation donation;

  const ItemCard({super.key, required this.donation});

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
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: NetworkImage(donation.imageUrl ?? ''), // Replace with your image URL
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            // Item Name
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Text(
                donation.name ?? 'No name found',
                style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            // Item Price
            const Padding(
              padding: EdgeInsets.all(3.0),
              child: Text(
                'Free',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
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
                        donation.location ?? 'No location found',
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
                        donation.category ?? 'No category found',
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
