import 'package:flutter/material.dart';
class CustomHorizontalDivider extends StatelessWidget {
   CustomHorizontalDivider({super.key, required this.height});
  double height;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: height,
          width: MediaQuery.of(context).size.width - 50,
          color: const Color(0xFFDFDFDF),
        )
      ],
    );
  }
}