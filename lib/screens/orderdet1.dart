import 'package:flutter/material.dart';
import 'package:tawwon/models/organization.dart';
import 'package:tawwon/models/request.dart';
import 'package:tawwon/screens/order_details2.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key, required this.organization});
  final Organization organization;
  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  TimeOfDay startTime = const TimeOfDay(hour: 0, minute: 0);
  TimeOfDay endTime = const TimeOfDay(hour: 23, minute: 59);
  // Request newRequest = Request();
  Future<void> selectTime(bool isStart) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          startTime = picked;
        } else {
          endTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 50, top: 75),
              child: Text(
                'بلاستيك',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    labelText: 'ادخل حجم التبرع (مثال 5 جم)',
                  ),
                ),
              ),
            ),
            const Text(
              ':وقت الاستلام',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            // To display the start time
            Text(
              ' ${startTime.format(context)}',
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            // To show the time picker for start time
            ElevatedButton(
              onPressed: () {
                selectTime(true);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                minimumSize: MaterialStateProperty.all<Size>(const Size(175, 40)),
                foregroundColor: MaterialStateProperty.all<Color>(const Color(0xFF213753)),
              ),
              child: const Text('اختر وقت الاستلام'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OrderSummary()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF039C8A)),
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

// @override
// Widget build(BuildContext context) {
//   return const Scaffold();
// }
