import 'package:flutter/material.dart';

class ProfilePageListTile extends StatelessWidget {
  const ProfilePageListTile({super.key, required this.title, required this.image, required this.onTap});
  final String title;
  final String image;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      }
      ,
      child: ListTile(
        trailing: Image.asset(
          image,
          scale: 2,
        ),
        title: Text(
          title,
          textAlign: TextAlign.right,
          style: const TextStyle(color: Colors.black),
        ),
        contentPadding: const EdgeInsets.all(0),
      ),
    );
  }
}
