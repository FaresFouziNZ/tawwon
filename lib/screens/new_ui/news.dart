import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tawwon/cloud_functions/database.dart';
import 'package:tawwon/models/local_user.dart';
import 'package:tawwon/widgets/new_ui/item_card.dart';

class NewDonationsPage extends StatelessWidget {
  const NewDonationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LocalUser>(context);
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 20, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('عروض جديدة', style: TextStyle(fontSize: 24)),
                  // SizedBox(
                  //   width: 20,
                  // ),
                  // Icon(
                  //   Icons.favorite,
                  //   size: 100,
                  // )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
                future: DatabaseService().getNewDonations(uid: user.uid),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Wrap(
                    children: snapshot.data?.map((e) => ItemCard(donation: e)).toList() ?? [const Text('لا يوجد asd')],
                  );
                }),
          ],
        ));
  }
}
