import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tawwon/cloud_functions/database.dart';
import 'package:tawwon/models/local_user.dart';
import 'package:tawwon/widgets/request_card.dart';

class RequestsView extends StatelessWidget {
  const RequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LocalUser?>(context);
    return Scaffold(
      backgroundColor: const Color(0xFFDAE5EA),
      appBar: AppBar(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        elevation: 0,
        title: const Text(
          'الطلبات',
          style: TextStyle(fontSize: 28, fontFamily: 'ReadexPro'),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: DatabaseService().getRequestsByUid(uid: user?.uid),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(children: const <Widget>[
                        Expanded(
                            child: Divider(
                          color: Colors.black,
                          thickness: 2,
                          indent: 10,
                          endIndent: 5,
                        )),
                        Text("الطلبات"),
                        Expanded(
                            child: Divider(
                          color: Colors.black,
                          thickness: 2,
                          indent: 5,
                          endIndent: 10,
                        )),
                      ]),
                    ),
                    Column(
                      children: snapshot.data!.map((e) {
                        return Column(
                          children: [
                            RequestCard(request: e),
                            const Divider(
                              color: Colors.black,
                              thickness: 1,
                              indent: 10,
                              endIndent: 10,
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }
}
