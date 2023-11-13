import 'package:flutter/material.dart';
import 'package:tawwon/screens/new_ui/signup.dart';
import 'package:provider/provider.dart';
import 'package:tawwon/cloud_functions/Auth.dart';
import 'package:tawwon/models/local_user.dart';

class PreSignup extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  PreSignup({super.key});

  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    final password = TextEditingController();
    final passwordConfirm = TextEditingController();
    final user = Provider.of<LocalUser?>(context);
    final auth = Auth();
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
              controller: email,
              decoration: const InputDecoration(
                labelText: 'البريد الإلكتروني',

                //border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: password,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'كلمة المرور',
                //border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // if(){}
                final result = await auth.registerWithEmailAndPassword(email.text, password.text);
                if (result == null) {
                  if (auth.uid().isEmpty) {
                    showDialog(
                        context: context,
                        builder: (context) =>
                            const AlertDialog(title: Text('خطأ'), content: Text('البريد الإلكتروني مستخدم مسبقاً')));
                  } else {
                    await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text(
                                'تم',
                              ),
                              content: const Text('تم إنشاء الحساب بنجاح'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context, MaterialPageRoute(builder: (context) => const SignUp()));
                                    },
                                    child: const Text('التالي'))
                              ],
                            ));
                  }
                } else {}
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                minimumSize: MaterialStateProperty.all<Size>(const Size(175, 40)),
              ),
              child: const Text(
                'التالي',
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
