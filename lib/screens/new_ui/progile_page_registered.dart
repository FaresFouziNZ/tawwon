import 'package:flutter/material.dart';

import '../../widgets/new_ui/custom_divider_horizontal.dart';
import '../../widgets/new_ui/custom_title.dart';
import '../../widgets/new_ui/profile_page_list_tile.dart';


class ProfilePageRegistered extends StatelessWidget {
  const ProfilePageRegistered({super.key});
  final String name = "طارق";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 70, left: 25, right: 25),
          child: Column(
            children: [
              TitleText(text: 'مرحباً بك, $name'),
              const SizedBox(
                height: 10,
              ),
              ProfilePageListTile(
                image: 'assets/images/settings.png',
                title: 'إعدادات',
                onTap: () {},
              ),
              CustomHorizontalDivider(height: 2.5),
              ProfilePageListTile(
                image: 'assets/images/language.png',
                title: 'لغة',
                onTap: () {},
              ),
              CustomHorizontalDivider(height: 2.5),
              const SizedBox(
                height: 45,
              ),
              const TitleText(text: 'إعدادات الحساب'),
              ProfilePageListTile(
                title: 'الموقع المفضل',
                image: 'assets/images/location.png',
                onTap: () {},
              ),
              CustomHorizontalDivider(height: 2.5),
              ProfilePageListTile(
                title: 'الإشعارات',
                image: 'assets/images/notifications.png',
                onTap: () {},
              ),
              CustomHorizontalDivider(height: 2.5),
              ProfilePageListTile(
                title: 'الحساب',
                image: 'assets/images/account_icon.png',
                onTap: () {},
              ),
              CustomHorizontalDivider(height: 2.5),
              ProfilePageListTile(
                title: 'اغراضي',
                image: 'assets/images/items_icon.png',
                onTap: () {},
              ),
              CustomHorizontalDivider(height: 2.5),
              const SizedBox(
                height: 25,
              ),
              const TitleText(text: 'معلومات ودعم تعاون'),
              ProfilePageListTile(
                image: 'assets/images/faq.png',
                title: 'أشهر الأسئلة',
                onTap: () {},
              ),
              CustomHorizontalDivider(height: 2.5),
              ProfilePageListTile(
                image: 'assets/images/contact_us.png',
                title: 'تواصل معنا',
                onTap: () {},
              ),
              CustomHorizontalDivider(height: 2.5),
            ],
          ),
        ),
      ),
    );
  }
}
