import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tawwon/cloud_functions/database.dart';
import 'package:tawwon/models/local_user.dart';
import 'package:tawwon/screens/new_ui/new_donate.dart';
import 'package:tawwon/screens/new_ui/news.dart';
import 'package:tawwon/screens/new_ui/sugeestions_page.dart';
import 'package:tawwon/widgets/new_ui/item_card.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LocalUser>(context);
    return Scaffold(
      appBar: AppBar(
          title: const Center(
            child: Text(
              'الرئيسية',
              style: TextStyle(fontFamily: 'ReadexPro', color: Color.fromARGB(255, 33, 55, 83)),
            ),
          ),
          //elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [Color(0xFF039C8A), Color(0xFF0484D9), Color(0xFFEE3985), Color(0xFF039C8A), Color(0xFF0484D9)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
              height: 2.0,
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 12, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text('مرحبا بك', style: TextStyle(fontSize: 24, fontFamily: 'ReadexPro')),
                  ),
                  Image.asset(
                    'assets/images/ICON_NEW.png',
                    width: 75,
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: Container(
                        width: 120,
                        height: 90,
                        decoration: BoxDecoration(
                          color: const Color(0xFF039C8A),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('إقتراحاتنا', style: TextStyle(color: Colors.white, fontSize: 18)),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => const SuggestedDonationsPage()));
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: Container(
                        width: 120,
                        height: 90,
                        decoration: BoxDecoration(
                          color: const Color(0xFF0484D9),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('أضيف غرض', style: TextStyle(color: Colors.white, fontSize: 18)),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        if (user.uid == null) {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                      title: const Text('يجب تسجيل الدخول اولاً'),
                                      content: const Text('يجب تسجيل الدخول اولاً لاضافة اعلان '),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('حسناً'))
                                      ]));
                          return;
                        }
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const NewDonatePage()));
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: Container(
                        width: 120,
                        height: 90,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEE3985),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('جديد', style: TextStyle(color: Colors.white, fontSize: 18)),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const NewDonationsPage()));
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.fromLTRB(270, 0, 4, 4),
              child: Text('عروض ترويجية', style: TextStyle(fontSize: 20, fontFamily: 'ReadexPro')),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 200,
                      decoration: BoxDecoration(
                        // color: const Color(0xFF0484D9),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/ad.jpeg'),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onTap: () {
                      launchUrl(Uri.parse('https://t.co/hEAyMdunC4'));
                    },
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.fromLTRB(270, 0, 4, 4),
              child: Text('نظرة سريعة', style: TextStyle(fontSize: 20, fontFamily: 'ReadexPro')),
            ),
            FutureBuilder(
              future: DatabaseService().getDonations(uid: user.uid),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: snapshot.data
                              ?.map((e) => ItemCard(
                                    donation: e,
                                  ))
                              .toList() ??
                          [],
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }
}
