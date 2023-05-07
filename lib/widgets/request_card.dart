import 'package:flutter/material.dart';
import 'package:tawwon/models/request.dart';

class RequestCard extends StatelessWidget {
  const RequestCard({super.key, required this.request});
  final Request request;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: const Color.fromARGB(220, 220, 220, 220), borderRadius: BorderRadius.circular(20)),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Icon(
            Icons.arrow_back_ios_new,
            size: 35,
          ),
          const Text('حي غرب الظهران, 4579'),
          const Icon(
            Icons.location_pin,
            size: 35,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.35,
            decoration: BoxDecoration(
              color: const Color(0xFF1B2430),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                      width: 45,
                      height: 45,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'بلاستيك',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.white,
                            fontFamily: 'ReadexPro',
                          ),
                        ),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
