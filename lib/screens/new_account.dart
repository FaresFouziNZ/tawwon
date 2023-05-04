import 'package:flutter/material.dart';
import 'package:motion_toast/resources/extensions.dart';
import 'client_register_view.dart';
import 'org_register.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class NewAccountView extends StatefulWidget {
  const NewAccountView({Key? key}) : super(key: key);

  @override
  State createState() => _NewAccountViewState();
}

class _NewAccountViewState extends State<NewAccountView> {
  int decision = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'حساب جديد',
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
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Image(
                  image: AssetImage('assets/images/ICON.png'),
                  width: 120,
                ),
              ),
            ),
            Wrap(spacing: 60, children: <ElevatedButton>[
              ElevatedButton(
                  onPressed: () {
                    decision = 1;
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                      maximumSize: const Size(150, 150),
                      alignment: Alignment.center,
                      backgroundColor: const Color.fromARGB(255, 27, 36, 48),
                      side: decision == 1
                          ? const BorderSide(color: Colors.white, width: 2)
                          : const BorderSide(color: Colors.transparent),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Column(
                        children: [
                          Image.asset('assets/images/one.png'),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: Text("فرد"),
                          ),
                        ],
                      ),
                    ],
                  )),
              ElevatedButton(
                  onPressed: () {
                    decision = 2;
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                      maximumSize: const Size(150, 150),
                      alignment: Alignment.center,
                      backgroundColor: const Color.fromARGB(255, 27, 36, 48),
                      side: decision == 2
                          ? const BorderSide(color: Colors.white, width: 2)
                          : const BorderSide(color: Colors.transparent),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Column(
                        children: [
                          Image.asset('assets/images/many.png'),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: Text("مؤسسة"),
                          ),
                        ],
                      ),
                    ],
                  )),
            ]),
            ElevatedButton(
              onPressed: () {
                if (decision == 1) {
                  Navigator.popUntil(context, (route) => route.isFirst);
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => const ClientRegisterView()));
                } else if (decision == 2) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const OrgRegister()));
                } else if (decision == 0) {
                  MotionToast.warning(
                    title: const Text("خطأ"),
                    description: const Text("الرجاء اختيار نوع الحساب"),
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
            Container()
          ],
        ));
  }
}
