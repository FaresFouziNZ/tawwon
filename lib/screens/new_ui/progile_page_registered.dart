import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tawwon/cloud_functions/Auth.dart';
import 'package:tawwon/screens/new_ui/language_page.dart';
import 'package:tawwon/screens/new_ui/location_page.dart';
import 'package:tawwon/screens/new_ui/my_items_page.dart';
import 'package:tawwon/screens/new_ui/notification_page.dart';
import 'package:tawwon/screens/new_ui/profile_settings.dart';
import 'package:tawwon/screens/new_ui/settings_page.dart';

import '../../widgets/new_ui/custom_divider_horizontal.dart';
import '../../widgets/new_ui/custom_title.dart';
import '../../widgets/new_ui/profile_page_list_tile.dart';
import 'home_page.dart';

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
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
                },
              ),
              CustomHorizontalDivider(height: 2.5),
              ProfilePageListTile(
                image: 'assets/images/language.png',
                title: 'لغة',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LanguagePage()));
                },
              ),
              CustomHorizontalDivider(height: 2.5),
              const SizedBox(
                height: 45,
              ),
              const TitleText(text: 'إعدادات الحساب'),
              ProfilePageListTile(
                title: 'الموقع المفضل',
                image: 'assets/images/location.png',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LocationPage()));
                },
              ),
              CustomHorizontalDivider(height: 2.5),
              ProfilePageListTile(
                title: 'الإشعارات',
                image: 'assets/images/notifications.png',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationPage()));
                },
              ),
              CustomHorizontalDivider(height: 2.5),
              ProfilePageListTile(
                title: 'الحساب',
                image: 'assets/images/account_icon.png',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileSettings()));
                },
              ),
              CustomHorizontalDivider(height: 2.5),
              ProfilePageListTile(
                title: 'اغراضي',
                image: 'assets/images/items_icon.png',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MyItemsPage()));
                },
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
              ProfilePageListTile(
                image: 'assets/images/contact_us.png',
                title: 'تسجيل الخروج',
                onTap: () {
                  Auth().signOut();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
