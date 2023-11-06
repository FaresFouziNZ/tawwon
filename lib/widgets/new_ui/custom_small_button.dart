import 'package:flutter/material.dart';

class CustomSmallButton extends StatelessWidget {
  CustomSmallButton({super.key, required this.text, required this.page});
  String text;
  var page;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 114,
        height: 40,
        decoration: ShapeDecoration(
          color: const Color(0xFF213753),
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
         Navigator.push(
           context,
           MaterialPageRoute(builder: (context) => page),
           
         );
      },
    );
  }
}
