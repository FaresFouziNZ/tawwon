import 'package:flutter/material.dart';
class TitleText extends StatelessWidget {
  const TitleText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
     alignment: Alignment.topRight,
     child: Text(
       '$text',
       style: TextStyle(
           color: Colors.black,
           fontFamily: 'Amaranth',
           fontSize: 24,
           fontWeight: FontWeight.w700),
     ),
              );
  }
}