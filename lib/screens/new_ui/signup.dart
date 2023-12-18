import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tawwon/cloud_functions/database.dart';
import 'package:tawwon/models/local_user.dart';
import 'package:tawwon/screens/new_ui/page_holder.dart';
import 'package:tawwon/widgets/new_ui/custom_small_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  // Create a reference to the collection where you want to store the data
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LocalUser>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 70, left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Align(
                alignment: Alignment.topRight,
                child: Text(
                  'مرحباً بك في تعاون',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Amaranth',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: 'اسمك',
                  hintTextDirection: TextDirection.rtl,
                  //order: _circularBorder(),
                ),
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              // FutureBuilder<Object>(
              //     future: null,
              //     builder: (context, snapshot) {
              //       return DropdownButtonFormField<String>(
              //         iconSize: 0,
              //         decoration: const InputDecoration(
              //           hintText: 'موقعك',
              //           hintTextDirection: TextDirection.rtl,
              //           //border: _circularBorder(),
              //           prefixIcon: Icon(Icons.arrow_drop_down),
              //         ),
              //         value: _selectedLocation,
              //         items: <String>['Location 1', 'Location 2', 'Location 3']
              //             .map<DropdownMenuItem<String>>((String value) {
              //           return DropdownMenuItem<String>(
              //             value: value,
              //             child: Text(value),
              //           );
              //         }).toList(),
              //         onChanged: (String? value) {
              //           setState(() {
              //             _selectedLocation = value;
              //           });
              //         },
              //       );
              //     }),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: 'رقم جوالك',
                  hintTextDirection: TextDirection.rtl,
                  //  border: _circularBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomSmallButton(
                text: "التالي",
                onTap: () async {
                  final regrex = RegExp(r'05(\d{8})');
                  if (_nameController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('الرجاء ادخال اسمك'),
                    ));
                    return;
                  }
                  if (_phoneController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('الرجاء ادخال رقم جوالك'),
                    ));
                    return;
                  }
                  if (!regrex.hasMatch(_phoneController.text)) {
                    print(_phoneController.text);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('الرجاء ادخال رقم جوالك بشكل صحيح'),
                    ));
                    return;
                  }
                  final newUser =
                      LocalUser(uid: user.uid, number: _phoneController.text, displayName: _nameController.text);
                  await DatabaseService().updateUser(user: newUser);
                  if (mounted) {
                    Navigator.popUntil(context, (route) => route.isFirst);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PageHolder(),
                        ),
                      );
                  }
                },
                color: const Color(0xFF213753),
              )
            ],
          ),
        ),
      ),
    );
  }
}
