import 'package:flutter/material.dart';
import 'package:tawwon/cloud_functions/database.dart';
import 'package:tawwon/models/request.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key, required this.request, required this.organizationName});
  final Request request;
  final String organizationName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 218, 229, 234),
        appBar: AppBar(
          title: const Text(
            'تفاصيل الطلب',
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 150),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(220, 220, 220, 220), borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 12, 8.0, 40),
                    child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              ':النوع',
                              style: TextStyle(fontSize: 26, color: Color.fromARGB(255, 33, 55, 83)),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                                  child: Text('بلاستيك',
                                      style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 33, 55, 83))),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(':الوقت', style: TextStyle(fontSize: 26, color: Color.fromARGB(255, 33, 55, 83)))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                                  child: Text(request.time.toString(),
                                      style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 33, 55, 83))),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              ':المكان',
                              style: TextStyle(fontSize: 26, color: Color.fromARGB(255, 33, 55, 83)),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                                  child: Text('Academic Belt Road, Dhahran 31261',
                                      style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 33, 55, 83))),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text('اسم المنظمة', style: TextStyle(fontSize: 26, color: Color.fromARGB(255, 33, 55, 83)))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                                  child: Text(organizationName,
                                      style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 33, 55, 83))),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
                // const SizedBox(height: 90),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                        onPressed: () async {
                          //send request
                          await DatabaseService.instance!.createRequest(request: request);
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  // round edges
                                  shape:
                                      const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                                  contentPadding: const EdgeInsets.symmetric(vertical: 100),
                                  backgroundColor: const Color.fromARGB(255, 218, 229, 234),
                                  content: const Text(
                                    'تم ارسال طلبك',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 22, color: Color.fromARGB(255, 33, 55, 83)),
                                  ),
                                  actions: [
                                    Center(
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          Navigator.popUntil(context, (route) => route.isFirst);
                                        },
                                        child: const Text('عودة', style: TextStyle(fontSize: 16)),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        },
                        child: const Text('تاكيد الطلب', style: TextStyle(fontSize: 16))),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
