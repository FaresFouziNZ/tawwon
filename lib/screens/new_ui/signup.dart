import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tawwon/screens/new_ui/home_page.dart';
import 'package:tawwon/widgets/new_ui/custom_small_button.dart';
import 'package:provider/provider.dart';
import 'package:tawwon/cloud_functions/Auth.dart';
import 'package:tawwon/models/local_user.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? _selectedLocation;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();


    // Create a reference to the collection where you want to store the data

    

 

  @override
  Widget build(BuildContext context) {
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
              const SizedBox(
                height: 20,
              ),
              FutureBuilder<Object>(
                  future: null,
                  builder: (context, snapshot) {
                    return DropdownButtonFormField<String>(
                      iconSize: 0,
                      decoration: const InputDecoration(
                        hintText: 'موقعك',
                        hintTextDirection: TextDirection.rtl,
                        //border: _circularBorder(),
                        prefixIcon: Icon(Icons.arrow_drop_down),
                      ),
                      value: _selectedLocation,
                      items: <String>['Location 1', 'Location 2', 'Location 3']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedLocation = value;
                        });
                      },
                    );
                  }),
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
              CustomSmallButton(text: "التالي", onTap:  Navigator.pushReplacement(
                                          context, MaterialPageRoute(builder: (context) => const HomePage()))
                                    , color: Colors.blue,)
            ],
          ),
        ),
      ),
    );
  }
}
