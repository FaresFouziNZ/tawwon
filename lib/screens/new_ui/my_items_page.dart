import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tawwon/models/local_user.dart';
import 'package:tawwon/screens/new_ui/new_donate.dart';
import 'package:tawwon/widgets/new_ui/custom_title.dart';
import 'package:tawwon/widgets/new_ui/item_card.dart';

import '../../cloud_functions/database.dart';

class MyItemsPage extends StatelessWidget {
  const MyItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LocalUser>(context);
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              height: 0.4,
            ),
          )),
      body: Container(
        margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const TitleText(text: 'اغراضي'),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: Image.asset(
                        'assets/images/items_icon.png',
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 32,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                  future: DatabaseService().getUserItems(uid: user.uid),
                  builder: (context, snapshot) {
                    return SingleChildScrollView(
                      child: Wrap(
                        children: snapshot.data
                                ?.map((e) => ItemCard(
                                      donation: e,
                                      isOwner: true,
                                    ))
                                .toList() ??
                            [],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const NewDonatePage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
