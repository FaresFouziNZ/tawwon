import 'package:flutter/material.dart';
import 'package:tawwon/widgets/new_ui/item_card.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: const Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 20, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('المفضلة', style: TextStyle(fontSize: 24)),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.favorite,
                    size: 100,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

              ],
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.fromLTRB(270, 0, 20, 10),
              child: Text('مشاهد سابقا', style: TextStyle(fontSize: 20, fontFamily: 'ReadexPro')),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

              ],
            )
          ],
        ));
  }
}
