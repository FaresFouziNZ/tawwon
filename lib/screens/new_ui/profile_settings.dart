import 'package:flutter/material.dart';
import 'package:tawwon/widgets/new_ui/custom_divider_horizontal.dart';
import 'package:tawwon/widgets/new_ui/custom_small_button.dart';

import '../../widgets/new_ui/profile_page_list_tile.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.all(15)),
            Container(
              width: MediaQuery.of(context).size.width - 20,
              height: 100,
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF213753),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Image.asset('assets/images/back_arrow_white.png')),
                    Image.asset(
                      'assets/images/profile_white.png',
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "حساب",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: ProfilePageListTile(
                  title: "تغيير الإيميل",
                  image: 'assets/images/edit.png',
                  onTap: () {
                    //TODO change email and send data to firebase (See figma)
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomHorizontalDivider(height: 2),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: ProfilePageListTile(
                  title: "تغيير كلمة السر",
                  image: 'assets/images/edit.png',
                  onTap: () {
                    //TODO change password and send data to firebase (See figma)
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomHorizontalDivider(height: 2),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: ProfilePageListTile(
                  title: "تعديل معلومات الحساب",
                  image: 'assets/images/edit.png',
                  onTap: () {
                    //TODO user should be able to change name and phone number and then send data to firebase (See figma)
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomHorizontalDivider(height: 2),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: ProfilePageListTile(
                  title: "حذف الحساب",
                  image: 'assets/images/delete.png',
                  onTap: () {
                    //TODO delete account from firebase and logout (See figma and use the custom small button widget)
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomHorizontalDivider(height: 2),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 340),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: CustomSmallButton(text: "تطبيق", onTap: (){
                  //TODO commit changes
                }, color: Color(0xFF213753),)),
            )
          ],
        ),
      ),
    );
  }
}
