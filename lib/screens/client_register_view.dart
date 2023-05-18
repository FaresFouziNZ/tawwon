import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tawwon/cloud_functions/Auth.dart';
import 'package:tawwon/models/local_user.dart';
import 'package:tawwon/screens/welcome.dart';
import 'package:tawwon/widgets/bottom_navigation.dart';

class ClientRegisterView extends StatelessWidget {
  const ClientRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    final password = TextEditingController();
    final passwordConfirm = TextEditingController();
    final user = Provider.of<LocalUser?>(context);
    final auth = Auth();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'حساب فرد',
          style: TextStyle(fontSize: 28, fontFamily: 'ReadexPro'),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const WelcomeView()));
          },
        ),
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
                  width: 120,
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
                        hintText: 'البريد الإلكتروني',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        // labelText: 'البريد الإلكتروني',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      obscureText: true,
                      controller: password,
                      decoration: const InputDecoration(
                        hintText: 'كلمة المرور',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        // labelText: 'كلمة المرور',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      obscureText: true,
                      controller: passwordConfirm,
                      decoration: const InputDecoration(
                        hintText: 'تاكيد كلمة المرور',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        // labelText: 'كلمة المرور',
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
                                      Navigator.popUntil(context, (route) => route.isFirst);
                                      Navigator.pushReplacement(
                                          context, MaterialPageRoute(builder: (context) => const BottomNavigation()));
                                    },
                                    child: const Text('التالي'))
                              ],
                            ));
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => const BottomNavigation()));
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
