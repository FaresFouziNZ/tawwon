import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:provider/provider.dart';
import 'package:tawwon/cloud_functions/Auth.dart';
import 'package:tawwon/models/local_user.dart';
import 'package:tawwon/screens/old_ui/homePage.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    final auth = Auth();
    final user = Provider.of<LocalUser?>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          ' تسجيل دخول',
          style: TextStyle(fontSize: 28, fontFamily: 'ReadexPro'),
        ),
        centerTitle: true,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back_ios_new),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Image(
                  image: AssetImage('assets/images/ICON.png'),
                  width: 140,
                ),
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: email,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        labelText: 'بريدك الالكتروني',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      obscureText: true,
                      autocorrect: false,
                      controller: password,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        labelText: 'كلمة المرور',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var result = await auth.signInWithEmailAndPassword(email.text, password.text);
                if (result == "") {
                  Navigator.popUntil(context, (route) => route.isFirst);

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                } else {
                  MotionToast.warning(
                    title: const Text("خطأ"),
                    description: const Text("البريد الالكتروني او كلمة المرور خطأ"),
                    layoutOrientation: ToastOrientation.rtl,
                    animationType: AnimationType.fromRight,
                    animationDuration: const Duration(milliseconds: 500),
                    animationCurve: Curves.fastOutSlowIn,
                    displayBorder: true,
                    position: MotionToastPosition.bottom,
                  ).show(context);
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: const Text(
                'تسجيل الدخول',
                style: TextStyle(
                  color: Color(0xFF213753),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
