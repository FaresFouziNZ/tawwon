import 'package:flutter/material.dart';
import 'package:tawwon/screens/old_ui/create_organization_page2.dart';
import 'package:tawwon/screens/old_ui/homePage.dart';

class CreateOrganizationPageView1 extends StatelessWidget {
  const CreateOrganizationPageView1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'تفاصيل المنظمة',
                  style: TextStyle(fontSize: 28, fontFamily: 'ReadexPro', color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(14.0),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/ICON.png'),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 28.0, 16.0, 0.0),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    minLines: 6,
                    maxLines: 8,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      labelText: 'اوقات العمل',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color(0xFFFFFFFF),
                  backgroundColor: const Color(0xFF1B2430),
                ),
                child: const Text('تخطي')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => const HomePage())); //change to create org page 2 later this is tr8ee3
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color(0xFF213753),
                  backgroundColor: const Color.fromARGB(255, 218, 229, 234),
                ),
                child: const Text('موافق')),
          ],
        ),
      ),
    );
  }
}
