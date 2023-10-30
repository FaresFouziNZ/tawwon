import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isLoading = false;
  String? _selectedLocation;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  

 void _handleSubmit() async {
  setState(() {
    _isLoading = true;
  });

  // Create a reference to the collection where you want to store the data
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  // Send data to Firestore
  await users.add({
    'name': _nameController.text,
    'phone': _phoneController.text,
    'location': _selectedLocation,
  });

  setState(() {
    _isLoading = false;
  });

 
}

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
                }
              ),
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
              ElevatedButton(
                onPressed: _isLoading ? null : _handleSubmit,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                child: _isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
