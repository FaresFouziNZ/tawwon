import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tawwon/models/donation.dart';
import 'package:tawwon/models/favorite_provider.dart';
import 'package:tawwon/screens/new_ui/donation_details.dart';

class ItemCard extends StatelessWidget {
  final Donation donation;
  final bool isOwner;
  const ItemCard({super.key, required this.donation, this.isOwner = false});

  @override
  Widget build(BuildContext context) {
    final fav = Provider.of<FavoriteProvider>(context);
    return GestureDetector(
      child: SizedBox(
        width: 180,
        child: Card(
          elevation: 4.0,
          margin: const EdgeInsets.all(10.0),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              // Item Photo (50% of the card)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100.0,
                  width: 165,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    image: DecorationImage(
                      image: NetworkImage(donation.imageUrl ?? ''), // Replace with your image URL
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // Item Name
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Text(
                  donation.name ?? 'No name found',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Color(0xFF213753)),
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
                        padding: const EdgeInsets.all(2.0),
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
                        padding: const EdgeInsets.all(2),
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
              const SizedBox(
                height: 5,
              )
            ],
          ),
        ),
      ),
      onTap: () {
        bool isFavorite = false;
        for (var i = 0; i < fav.favoriteList.length; i++) {
          if (fav.favoriteList[i].id == donation.id) {
            isFavorite = true;
            break;
          }
        }
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DonationDetailsPage(
                      donation: donation,
                      isOwner: isOwner,
                      isFavorite: isFavorite,
                    )));
      },
    );
  }
}
