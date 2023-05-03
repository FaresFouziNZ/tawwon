import 'package:flutter/material.dart';
import 'package:tawwon/models/organization.dart';
import 'package:tawwon/screens/orderdet1.dart';

import 'type_square.dart';

class OrganizationCard extends StatelessWidget {
  const OrganizationCard({
    super.key,
    required this.organization,
  });
  final Organization organization;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderDetails()));
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.height * 0.22,
          decoration: BoxDecoration(
            color: const Color(0xFF213753),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.175,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Image(image: NetworkImage(organization.logoUrl as String)),
              ),
              const VerticalDivider(
                indent: 5,
                endIndent: 5,
                thickness: 2,
                color: Colors.black,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    organization.name ?? 'Organization Name',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: 'ReadexPro',
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 25,
                    decoration: const BoxDecoration(
                      color: Color(0xFF1B2430),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.watch_later,
                          color: Colors.white,
                          size: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(organization.time ?? 'Time',
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.white,
                                fontFamily: 'ReadexPro',
                              )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 45,
                    decoration: const BoxDecoration(
                      color: Color(0xFF1B2430),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [TypeSquare()],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
