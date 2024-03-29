import 'package:flutter/material.dart';
import 'package:tawwon/widgets/new_ui/custom_title.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const TitleText(text: 'الاشعارات'),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Image.asset('assets/images/notifications.png'),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 32,
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
