import 'package:flutter/material.dart';
import 'package:tawwon/screens/old_ui/new_account.dart';
import 'package:tawwon/screens/old_ui/login_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Image(
                image: AssetImage('assets/images/ICON.png'),
                width: 360,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('مساهمتك في الحفاظ على كوكبنا تبدأ من هنا',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'ReadexPro',
                    color: Colors.white,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 64.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewAccountView()));
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  minimumSize:
                      MaterialStateProperty.all<Size>(const Size(175, 40)),
                ),
                child: const Text(
                  'إبدأ',
                  style: TextStyle(
                    color: Color(0xFF213753),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginView()));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(0xff, 0x1B, 0x24, 0x30)),
                  minimumSize:
                      MaterialStateProperty.all<Size>(const Size(175, 40)),
                ),
                child: const Text(
                  'تسجيل الدخول',
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
