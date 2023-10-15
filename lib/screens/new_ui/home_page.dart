import 'package:flutter/material.dart';
import 'package:tawwon/cloud_functions/database.dart';
import 'package:tawwon/screens/new_ui/new_donate.dart';
import 'package:tawwon/widgets/new_ui/item_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
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
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 12, right: 20),
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
            Row(
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
                    onTap: () {},
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
                    onTap: () {},
                  ),
                ),
              ],
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
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: 200,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0484D9),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.fromLTRB(270, 0, 4, 4),
              child: Text('مشاهد سابقا', style: TextStyle(fontSize: 20, fontFamily: 'ReadexPro')),
            ),
            FutureBuilder(
              future: DatabaseService().getDonations(),
              builder: (context, snapshot) {
                print('Im rich');
                if (snapshot.hasData) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: snapshot.data
                            ?.map((e) => ItemCard(
                                  donation: e,
                                ))
                            .toList() ??
                        [],
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            )
          ],
        ),
      ),
    );
  }
}
