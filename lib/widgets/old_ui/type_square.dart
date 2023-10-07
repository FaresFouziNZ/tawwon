import 'package:flutter/material.dart';

class TypeSquare extends StatelessWidget {
  const TypeSquare({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        ));
  }
}
