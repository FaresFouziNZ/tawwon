import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tawwon/cloud_functions/Auth.dart';
import 'package:tawwon/models/favorite_provider.dart';
import 'package:tawwon/screens/new_ui/my_items_page.dart';
import 'package:tawwon/screens/new_ui/page_holder.dart';
import 'package:tawwon/screens/new_ui/settings_page.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/new_ui/custom_divider_horizontal.dart';
import '../../widgets/new_ui/custom_title.dart';
import '../../widgets/new_ui/profile_page_list_tile.dart';

class ProfilePageRegistered extends StatefulWidget {
  const ProfilePageRegistered({super.key});

  @override
  State<ProfilePageRegistered> createState() => _ProfilePageRegisteredState();
}

class _ProfilePageRegisteredState extends State<ProfilePageRegistered> {
  final String name = "طارق";

  @override
  Widget build(BuildContext context) {
    final fav = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 70, left: 25, right: 25),
          child: Column(
            children: [
              TitleText(text: 'مرحباً بك, ${fav.userName}'),
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
              const CustomHorizontalDivider(height: 2.5),
              // ProfilePageListTile(
              //   image: 'assets/images/language.png',
              //   title: 'لغة',
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context) => const LanguagePage()));
              //   },
              // ),
              // const CustomHorizontalDivider(height: 2.5),
              const SizedBox(
                height: 45,
              ),
              const TitleText(text: 'إعدادات الحساب'),
              // ProfilePageListTile(
              //   title: 'الموقع المفضل',
              //   image: 'assets/images/location.png',
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context) => const LocationPage()));
              //   },
              // ),
              // const CustomHorizontalDivider(height: 2.5),
              // ProfilePageListTile(
              //   title: 'الإشعارات',
              //   image: 'assets/images/notifications.png',
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationPage()));
              //   },
              // ),
              // const CustomHorizontalDivider(height: 2.5),
              // ProfilePageListTile(
              //   title: 'الحساب',
              //   image: 'assets/images/account_icon.png',
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileSettings()));
              //   },
              // ),
              // const CustomHorizontalDivider(height: 2.5),
              ProfilePageListTile(
                title: 'اغراضي',
                image: 'assets/images/items_icon.png',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MyItemsPage()));
                },
              ),
              const CustomHorizontalDivider(height: 2.5),
              const SizedBox(
                height: 25,
              ),
              const TitleText(text: 'معلومات ودعم تعاون'),
              ProfilePageListTile(
                image: 'assets/images/faq.png',
                title: 'أشهر الأسئلة',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('قريباً'),
                  ));
                },
              ),
              const CustomHorizontalDivider(height: 2.5),
              ProfilePageListTile(
                image: 'assets/images/contact_us.png',
                title: 'تواصل معنا',
                onTap: () {
                  launchUrl(Uri.parse('https://twitter.com/TKfupm57770'));
                },
              ),
              const CustomHorizontalDivider(height: 2.5),
              ProfilePageListTile(
                image: 'assets/images/logout.png',
                title: 'تسجيل الخروج',
                onTap: () async {
                  await Auth().signOut();
                  if (mounted) {
                    Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PageHolder(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
