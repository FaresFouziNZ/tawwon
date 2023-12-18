import 'package:flutter/material.dart';
import 'package:tawwon/cloud_functions/Auth.dart';
import 'package:tawwon/widgets/new_ui/custom_divider_horizontal.dart';
import 'package:tawwon/widgets/new_ui/custom_small_button.dart';

import '../../widgets/new_ui/profile_page_list_tile.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  bool showEmailTextField = false;
  bool showPasswordTextField = false;
  bool showAccountInfoTextField = false;
  bool showDeleteAccountField = false;
  final newEmailController = TextEditingController();
  final newEmailController2 = TextEditingController();
  Auth auth = Auth();

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
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Image.asset('assets/images/back_arrow_white.png'),
                    ),
                    Image.asset(
                      'assets/images/profile_white.png',
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      "حساب",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: ProfilePageListTile(
                title: "تغيير البريد الالكتروني",
                image: 'assets/images/edit.png',
                onTap: () {
                  setState(() {
                    showEmailTextField = !showEmailTextField;
                  });
                },
              ),
            ),
            if (showEmailTextField)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: TextFormField(
                        controller: newEmailController,
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          hintText: "البريد الالكتروني الجديد",
                          enabledBorder:
                              const OutlineInputBorder(borderSide: BorderSide(width: 0, color: Colors.white)),
                          filled: true,
                          fillColor: const Color(0x6645474A).withOpacity(0.07999999821186066),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      width: MediaQuery.of(context).size.width - 50,
                      child: TextFormField(
                        controller: newEmailController2,
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          hintText: "أكد البريد الالكتروني الجديد",
                          enabledBorder:
                              const OutlineInputBorder(borderSide: BorderSide(width: 0, color: Colors.white)),
                          filled: true,
                          fillColor: const Color(0x6645474A).withOpacity(0.07999999821186066),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final regrex = RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]');
                        if (newEmailController.text.isNotEmpty) {
                          if (regrex.hasMatch(newEmailController.text)) {
                            if (newEmailController.text == newEmailController2.text) {
                              //TODO commit changes
                              final result = await auth.changeEmail(newEmailController.text);
                              if (result == true) {
                                showDialog(
                                  context: context,
                                  builder: (context) => const Text("تم تغيير البريد الالكتروني بنجاح"),
                                );
                              }
                            } else {
                              //TODO show error
                            }
                          } else {
                            //TODO show error
                          }
                        } else {
                          //TODO show error
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF213753),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text("تغيير"),
                    )
                  ],
                ),
              ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomHorizontalDivider(height: 2),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: ProfilePageListTile(
                title: "تغيير كلمة السر",
                image: 'assets/images/edit.png',
                onTap: () {
                  setState(() {
                    showPasswordTextField = !showPasswordTextField;
                  });
                },
              ),
            ),
            if (showPasswordTextField)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: TextFormField(
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          hintText: "كلمة المرور القديمة",
                          enabledBorder:
                              const OutlineInputBorder(borderSide: BorderSide(width: 0, color: Colors.white)),
                          filled: true,
                          fillColor: const Color(0x6645474A).withOpacity(0.07999999821186066),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      width: MediaQuery.of(context).size.width - 50,
                      child: TextFormField(
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          hintText: "كلمة المرور الجديدة",
                          enabledBorder:
                              const OutlineInputBorder(borderSide: BorderSide(width: 0, color: Colors.white)),
                          filled: true,
                          fillColor: const Color(0x6645474A).withOpacity(0.07999999821186066),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      width: MediaQuery.of(context).size.width - 50,
                      child: TextFormField(
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          hintText: "أكد كلمة المرور الجديدة",
                          enabledBorder:
                              const OutlineInputBorder(borderSide: BorderSide(width: 0, color: Colors.white)),
                          filled: true,
                          fillColor: const Color(0x6645474A).withOpacity(0.07999999821186066),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomHorizontalDivider(height: 2),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: ProfilePageListTile(
                title: "تعديل معلومات الحساب",
                image: 'assets/images/edit.png',
                onTap: () {
                  setState(() {
                    showAccountInfoTextField = !showAccountInfoTextField;
                  });
                },
              ),
            ),
            if (showAccountInfoTextField)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: TextFormField(
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          hintText: "الاسم",
                          enabledBorder:
                              const OutlineInputBorder(borderSide: BorderSide(width: 0, color: Colors.white)),
                          filled: true,
                          fillColor: const Color(0x6645474A).withOpacity(0.07999999821186066),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      width: MediaQuery.of(context).size.width - 50,
                      child: TextFormField(
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          hintText: "رقم التواصل",
                          enabledBorder:
                              const OutlineInputBorder(borderSide: BorderSide(width: 0, color: Colors.white)),
                          filled: true,
                          fillColor: const Color(0x6645474A).withOpacity(0.07999999821186066),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomHorizontalDivider(height: 2),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: ProfilePageListTile(
                title: "حذف الحساب",
                image: 'assets/images/delete.png',
                onTap: () {
                  setState(() {
                    showDeleteAccountField = !showDeleteAccountField;
                  });
                },
              ),
            ),
            if (showDeleteAccountField)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: TextFormField(
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          hintText: "كلمة السر الحالية",
                          enabledBorder:
                              const OutlineInputBorder(borderSide: BorderSide(width: 0, color: Colors.white)),
                          filled: true,
                          fillColor: const Color(0x6645474A).withOpacity(0.07999999821186066),
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: 30, bottom: 10, right: ((MediaQuery.of(context).size.width) / 2) + 30),
                      child: CustomSmallButton(
                        text: "حذف الحساب",
                        color: const Color(0xFFE13153),
                        onTap: () {
                          //TODO show a dialog screen to confirm this option
                        },
                      ),
                    )
                  ],
                ),
              ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomHorizontalDivider(height: 2),
              ],
            ),
            // Padding(
            //   padding: EdgeInsets.only(top: 330, bottom: 15, right: ((MediaQuery.of(context).size.width) / 2) + 30),
            //   child: CustomSmallButton(
            //     text: "تطبيق",
            //     onTap: () {
            //       //TODO commit changes
            //     },
            //     color: const Color(0xFF213753),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
