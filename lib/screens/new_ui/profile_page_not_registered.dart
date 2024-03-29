import 'package:flutter/material.dart';
import 'package:tawwon/screens/new_ui/login.dart';
import 'package:url_launcher/url_launcher.dart';
import 'pre_signup.dart';
import '../../widgets/new_ui/custom_divider_horizontal.dart';
import '../../widgets/new_ui/custom_small_button.dart';
import '../../widgets/new_ui/profile_page_list_tile.dart';

class ProfilePageNotRegistered extends StatelessWidget {
  const ProfilePageNotRegistered({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F6),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: const EdgeInsets.only(top: 70, left: 25, right: 25),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topRight,
                child: Text(
                  'مرحباً بك في تعاون',
                  style:
                      TextStyle(color: Colors.black, fontFamily: 'Amaranth', fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Column(
                  children: [
                    Image.asset('assets/images/ICON_NEW.png'),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'سجل معنا لتبدأ بعرض اغراضك للبيع و المساهمة في الحفاظ على البيئة',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomSmallButton(
                      text: 'سجل معنا',
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PreSignup()));
                      },
                      color: const Color(0xFF213753),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomSmallButton(
                      text: 'تسجيل دخول',
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                      },
                      color: const Color(0xFF213753),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  // ProfilePageListTile(
                  //   image: 'assets/images/location.png',
                  //   title: 'الموقع المفضل',
                  //   onTap: () {},
                  // ),
                  // const CustomHorizontalDivider(
                  //   height: 1,
                  // ),
                  // ProfilePageListTile(
                  //   image: 'assets/images/settings.png',
                  //   title: 'إعدادات',
                  //   onTap: () {},
                  // ),
                  // const CustomHorizontalDivider(
                  //   height: 1,
                  // ),
                  // ProfilePageListTile(
                  //   image: 'assets/images/language.png',
                  //   title: 'لغة',
                  //   onTap: () {},
                  // ),
                  // const CustomHorizontalDivider(
                  //   height: 1,
                  // ),
                  // ProfilePageListTile(
                  //   image: 'assets/images/notifications.png',
                  //   title: 'الإشعارات',
                  //   onTap: () {},
                  // ),
                  // const CustomHorizontalDivider(
                  //   height: 1,
                  // ),
                  ProfilePageListTile(
                    image: 'assets/images/faq.png',
                    title: 'أشهر الأسئلة',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('قريباً'),
                      ));
                    },
                  ),
                  const CustomHorizontalDivider(
                    height: 1,
                  ),
                  ProfilePageListTile(
                    image: 'assets/images/contact_us.png',
                    title: 'تواصل معنا',
                    onTap: () {
                      launchUrl(Uri.parse('https://twitter.com/TKfupm57770'));
                    },
                  ),
                  const CustomHorizontalDivider(
                    height: 1,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
