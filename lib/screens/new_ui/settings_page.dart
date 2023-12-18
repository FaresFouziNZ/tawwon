import 'package:flutter/material.dart';
import 'package:tawwon/widgets/new_ui/custom_divider_horizontal.dart';
import 'package:tawwon/widgets/new_ui/profile_page_list_tile.dart';

import '../../widgets/new_ui/custom_title.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const TitleText(text: 'إعدادات'),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Image.asset('assets/images/settings.png'),
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
              ProfilePageListTile(title: 'الوضع الليلي', image: 'assets/images/settings.png', onTap: () {}),
              const CustomHorizontalDivider(height: 2.5),
            ],
          ),
        ));
  }
}
