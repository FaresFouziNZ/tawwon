import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:provider/provider.dart';
import 'package:tawwon/cloud_functions/Auth.dart';
import 'package:tawwon/models/local_user.dart';
import 'package:tawwon/models/organization.dart';
import 'package:tawwon/screens/organization_info_desc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrganizationRegister extends StatelessWidget {
  const OrganizationRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final regex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    // final CollectionReference descStore = FirebaseFirestore.instance.collection('organizations');
    // final DocumentReference docRef = descStore.doc('c9YcUP4twZUeOFnfeKvCJRsDKgv2');
    final name = TextEditingController();
    final email = TextEditingController();
    final password = TextEditingController();
    final auth = Auth();
    final user = Provider.of<LocalUser>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'حساب مؤسسة',
          style: TextStyle(fontSize: 28, fontFamily: 'ReadexPro'),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
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
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: name,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        labelText: 'اسم المنظمة',
                      ),
                    ),
                  ),
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
                        labelText: 'ايميل المنظمة',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      obscureText: true,
                      controller: password,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        labelText: 'كلمة السر',
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  // final result = await auth.registerWithEmailAndPassword(email.text, password.text);
                  // Organization newOrganization = Organization(name: name.text);
                  // if (result == null) {
                  //   print('error');
                  // } else {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const organ_desc(),
                  //     ),
                  //   );
                  // }
                  if (regex.hasMatch(email.text)) {
                    await auth.registerWithEmailAndPassword(email.text, password.text);
                    // final String text = name.text;
                    // await docRef.set({'name': text});
                    Organization newOrganization = Organization();
                    newOrganization.name = name.text;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => organ_desc(newOrganization: newOrganization),
                      ),
                    );
                  } else {
                    MotionToast.warning(
                      title: const Text("خطأ"),
                      description: const Text("الرجاء إدخال بريد إلكتروني صحيح"),
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
      ),
    );
  }
}
