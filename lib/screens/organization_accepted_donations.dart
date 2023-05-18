import 'package:flutter/material.dart';
import 'package:tawwon/widgets/bottom_navigation.dart';

// ignore: camel_case_types
class organ_accept extends StatefulWidget {
  const organ_accept({super.key});

  @override
  State<organ_accept> createState() => _organ_acceptState();
}

class _organ_acceptState extends State<organ_accept> {
  List<IconData> section1Icons = [
    Icons.star,
    Icons.door_back_door,
    Icons.food_bank,
  ];

  List<IconData> section2Icons = [
    Icons.home,
    Icons.work,
    Icons.school,
  ];

  // Define your list of selected icons as strings
  List<String> selectedIcons = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 100,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                'تفاصيل المنظمة',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const Text(
              'التبرعات المستقبلة',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const Text(
              'الرجاء اختيار كل ما ينطبق',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => const BottomNavigation()));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    minimumSize: MaterialStateProperty.all<Size>(const Size(175, 40)),
                  ),
                  child: const Text(
                    'موافق',
                    style: TextStyle(
                      color: Color(0xFF213753),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
