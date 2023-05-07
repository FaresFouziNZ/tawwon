import 'package:flutter/material.dart';
import 'package:tawwon/models/organization.dart';
import 'package:tawwon/screens/homePage.dart';
import 'package:tawwon/screens/organization_work_time.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class organ_desc extends StatelessWidget {
  const organ_desc({super.key, required this.newOrganization});
  final Organization newOrganization;
  @override
  Widget build(BuildContext context) {
    final TextEditingController description = TextEditingController();
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
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  // Text label

                  // Profile picture
                  Stack(children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/profile.jpeg'),
                    ),
                    Positioned(
                      bottom: 0,
                      child: FloatingActionButton(
                        mini: true,
                        onPressed: () {
                          // Handle the button press
                        },
                        backgroundColor: const Color.fromARGB(255, 19, 75, 121),
                        child: const Icon(Icons.add),
                      ),
                    ),
                  ]),
                  // Plus sign button
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: description,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      contentPadding: EdgeInsets.all(100),
                      hintText: 'وصف المنظمة',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    minimumSize: MaterialStateProperty.all<Size>(const Size(175, 40)),
                  ),
                  child: const Text(
                    'تخطي',
                    style: TextStyle(
                      color: Color(0xFF213753),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    // Organization newOrganization = Organization();
                    newOrganization.description = description.text;
                    // final String text = description.text;
                    // await docRef.update({'description': text});
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  SelectWorkHoursView(
                            newOrganization: newOrganization,
                      )),
                    );
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
