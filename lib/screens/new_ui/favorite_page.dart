import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tawwon/models/favorite_provider.dart';
import 'package:tawwon/models/local_user.dart';
import 'package:tawwon/widgets/new_ui/item_card.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LocalUser>(context);
    final fav = Provider.of<FavoriteProvider>(context);
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            const Padding(
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
            const SizedBox(
              height: 10,
            ),
            user.uid == null
                ? const Text('لم تسجل دخولك بعد')
                : Wrap(
                    children: fav.favoriteList
                        .map((e) => ItemCard(
                              donation: e,
                            ))
                        .toList()),
            // Spacer(),
            // Padding(
            //   padding: EdgeInsets.fromLTRB(270, 0, 20, 10),
            //   child: Text('مشاهد سابقا', style: TextStyle(fontSize: 20, fontFamily: 'ReadexPro')),
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [],
            // )
          ],
        ));
  }
}
