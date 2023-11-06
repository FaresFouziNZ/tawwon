import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:tawwon/cloud_functions/Auth.dart';
import 'package:tawwon/models/local_user.dart';
import 'package:provider/provider.dart';
import 'package:tawwon/screens/new_ui/home_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Auth();
    final user = Provider.of<LocalUser?>(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'مرحباً بك في تعاون',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'سجل معنا لتبدأ بعرض اغراضك للبيع و المساهمة في الحفاظ على البيئة',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'البريد الإلكتروني',
                //border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'كلمة المرور',
                //border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 16.0),
            ElevatedButton(
                onPressed: () async {
                  final String email = emailController.text.trim();
                  final String password = passwordController.text.trim();
                  // login logic
                  var result = await auth.signInWithEmailAndPassword(email, password);
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
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF213753)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.5),
                      side: const BorderSide(color: Color(0xFF213753)),
                    ),
                  ),
                ),
                child: const Text('التالي')),
          ],
        ),
      ),
    );
  }
}
