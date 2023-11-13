import 'package:flutter/material.dart';

class CustomSmallButton extends StatelessWidget {
  CustomSmallButton({super.key, required this.text, required this.onTap, required this.color});
  String text;
  Function onTap;
  Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 114,
        height: 40,
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
          ),
        )),
      ),
      onTap: () {
        onTap();
      },
    );
  }
}
