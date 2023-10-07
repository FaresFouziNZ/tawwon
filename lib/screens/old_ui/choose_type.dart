import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tawwon/cloud_functions/database.dart';
import 'package:tawwon/models/local_user.dart';
import 'package:tawwon/models/organization.dart';
import 'package:tawwon/screens/old_ui/homePage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Choose_type extends StatefulWidget {
  const Choose_type({Key? key, required this.newOrganization}) : super(key: key);
  final Organization newOrganization;
  @override
  State createState() => _Choose_type();
}

class _Choose_type extends State<Choose_type> {
  List<bool> isSelected = [false, false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LocalUser?>(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'تفاصيل المنظمة',
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                children: const [
                  Text(
                    'التبرعات المستقبلة',
                    style: TextStyle(fontSize: 28, fontFamily: 'ReadexPro', color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  Text(
                    'الرجاء اختيار كل المنطبق',
                    style: TextStyle(fontSize: 14, fontFamily: 'ReadexPro', color: Color.fromARGB(140, 255, 255, 255)),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(64, 0, 64, 0),
                  child: Container(
                    constraints: const BoxConstraints(maxHeight: 200),
                    child: GridView(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                      ),
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            isSelected[0] = !isSelected[0];
                            setState(() {});
                          },
                          style: ElevatedButton.styleFrom(
                            maximumSize: const Size(150, 150),
                            alignment: Alignment.center,
                            backgroundColor: const Color.fromARGB(255, 4, 132, 217),
                            side: isSelected[0]
                                ? const BorderSide(color: Colors.white, width: 3)
                                : const BorderSide(color: Colors.transparent),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Icon(
                            Icons.local_drink,
                            size: 50,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            isSelected[1] = !isSelected[1];
                            setState(() {});
                          },
                          style: ElevatedButton.styleFrom(
                            maximumSize: const Size(150, 150),
                            alignment: Alignment.center,
                            backgroundColor: const Color.fromARGB(255, 225, 77, 77),
                            side: isSelected[1]
                                ? const BorderSide(color: Colors.white, width: 3)
                                : const BorderSide(color: Colors.transparent),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Icon(
                            Icons.newspaper,
                            size: 50,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            isSelected[2] = !isSelected[2];
                            setState(() {});
                          },
                          style: ElevatedButton.styleFrom(
                            maximumSize: const Size(150, 150),
                            alignment: Alignment.center,
                            backgroundColor: const Color.fromARGB(255, 3, 156, 138),
                            side: isSelected[2]
                                ? const BorderSide(color: Colors.white, width: 3)
                                : const BorderSide(color: Colors.transparent),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Icon(
                            Icons.wine_bar_outlined,
                            size: 50,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            isSelected[3] = !isSelected[3];
                            setState(() {});
                          },
                          style: ElevatedButton.styleFrom(
                            maximumSize: const Size(150, 150),
                            alignment: Alignment.center,
                            backgroundColor: const Color.fromARGB(255, 225, 103, 154),
                            side: isSelected[3]
                                ? const BorderSide(color: Colors.white, width: 3)
                                : const BorderSide(color: Colors.transparent),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Icon(
                              FontAwesomeIcons.shirt,
                              size: 40,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            isSelected[4] = !isSelected[4];
                            setState(() {});
                          },
                          style: ElevatedButton.styleFrom(
                            maximumSize: const Size(150, 150),
                            alignment: Alignment.center,
                            backgroundColor: const Color.fromARGB(255, 121, 76, 178),
                            side: isSelected[4]
                                ? const BorderSide(color: Colors.white, width: 3)
                                : const BorderSide(color: Colors.transparent),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Icon(
                            Icons.phone_android,
                            size: 50,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            isSelected[5] = !isSelected[5];
                            setState(() {});
                          },
                          style: ElevatedButton.styleFrom(
                            maximumSize: const Size(150, 150),
                            alignment: Alignment.center,
                            backgroundColor: const Color.fromARGB(255, 121, 76, 178),
                            side: isSelected[5]
                                ? const BorderSide(color: Colors.white, width: 3)
                                : const BorderSide(color: Colors.transparent),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Icon(
                            Icons.battery_charging_full_outlined,
                            size: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 0, 30),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color.fromARGB(255, 27, 36, 48),
                    ),
                    child: const Text('< < المزيد'),
                  ),
                )
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                widget.newOrganization.types = ['plastic'];
                widget.newOrganization.logoUrl = "";
                widget.newOrganization.uid = user?.uid;
                await DatabaseService().createOrganization(organization: widget.newOrganization);
                await showDialog(
                    context: context,
                    builder: (context) => const AlertDialog(
                          title: Text('تم إنشاء المنظمة بنجاح'),
                          content: Text('تم إنشاء المنظمة بنجاح'),
                        ));
                Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
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
            Container()
          ],
        ));
  }

  List<String?> getSelection() {
    List<String?> items = [
      "بلاستيك",
      "ورق",
      "زجاج",
      "ملابس",
      "أجهزة إلكترونية",
      "بطاريات",
    ].asMap().entries.map((e) => isSelected[e.key] ? e.value : null).toList();
    items.removeWhere((element) => element == null);
    return items as List<String>;
  }
}
