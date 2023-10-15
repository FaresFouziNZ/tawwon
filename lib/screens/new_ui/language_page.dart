import 'package:flutter/material.dart';
import 'package:tawwon/widgets/new_ui/custom_divider_horizontal.dart';
import 'package:tawwon/widgets/new_ui/custom_title.dart';
import 'package:tawwon/widgets/new_ui/profile_page_list_tile.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

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
                    const TitleText(text: 'لغة'),
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
              ProfilePageListTile(title: 'تغيير البريد الالكتروني', image: 'assets/images/settings.png', onTap: () {}),
              CustomHorizontalDivider(height: 2.5),
              ProfilePageListTile(title: 'حذف الحساب', image: 'assets/images/settings.png', onTap: () {}),
              CustomHorizontalDivider(height: 2.5),
            ],
          ),
        ));
  }
}
