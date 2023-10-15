import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tawwon/cloud_functions/database.dart';
import 'package:tawwon/models/donation.dart';
import 'package:tawwon/models/local_user.dart';

class NewDonatePage extends StatefulWidget {
  const NewDonatePage({super.key});

  @override
  State<NewDonatePage> createState() => _NewDonatePageState();
}

class _NewDonatePageState extends State<NewDonatePage> {
  File? _image;
  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final descriptionController = TextEditingController();
  final phoneController = TextEditingController(text: '0547116316');
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LocalUser?>(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(4.0),
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Color(0xFF039C8A),
                    Color(0xFF0484D9),
                    Color(0xFFEE3985),
                    Color(0xFF039C8A),
                    Color(0xFF0484D9),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )),
                // color: Colors.orange,
                height: 2.0,
              ),
            )),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 24,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Text(
                      'إضافة غرض جديد',
                      style: TextStyle(fontSize: 24),
                    ),
                    const SizedBox()
                  ],
                ),
              ),
              GestureDetector(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: 200,
                  decoration: BoxDecoration(
                    image: _image != null
                        ? DecorationImage(
                            image: FileImage(_image!),
                            fit: BoxFit.cover,
                          )
                        : null,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                  child: _image == null ? const Icon(Icons.photo_size_select_actual_rounded) : null,
                ),
                onTap: () {
                  _pickImageFormGallery();
                },
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: 'اسم الغرض',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: TextField(
                    controller: categoryController,
                    decoration: const InputDecoration(
                      hintText: 'نوع الغرض',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: TextField(
                    controller: descriptionController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 8,
                    decoration: const InputDecoration(
                      hintText: 'وصف الغرض',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: TextField(
                    enabled: false,
                    controller: phoneController,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 8, bottom: 36),
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Color(0xFF213753)),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                          )),
                      onPressed: () async {
                        Donation newDonation = Donation(
                          name: nameController.text,
                          category: categoryController.text,
                          phoneNumber: phoneController.text,
                          description: descriptionController.text,
                          donorID: user!.uid,
                        );
                        await DatabaseService().createDonation(donation: newDonation, file: _image!);
                        if (mounted) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('تم رفع الغرض'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  child: const Text('حسناً', style: TextStyle(color: Colors.black)),
                                )
                              ],
                            ),
                          );
                        } else {}
                      },
                      child: const Text('رفع الغرض'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  _pickImageFormGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
}
