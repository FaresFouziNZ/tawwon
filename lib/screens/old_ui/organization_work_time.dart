import 'package:flutter/material.dart';
import 'package:tawwon/models/organization.dart';
import 'package:tawwon/screens/old_ui/choose_type.dart';

class SelectWorkHoursView extends StatefulWidget {
  const SelectWorkHoursView({super.key, required this.newOrganization});
  final Organization newOrganization;
  @override
  State<SelectWorkHoursView> createState() => _SelectWorkHoursViewState();
}

class _SelectWorkHoursViewState extends State<SelectWorkHoursView> {
  TimeOfDay startTime = const TimeOfDay(hour: 0, minute: 0);
  TimeOfDay endTime = const TimeOfDay(hour: 23, minute: 59);

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

  bool isValidTimeRange() {
    int startSeconds = startTime.hour * 3600 + startTime.minute * 60;
    int endSeconds = endTime.hour * 3600 + endTime.minute * 60;
    return endSeconds > startSeconds;
  }

  String timeToText() {
    String start = "${startTime.hour}:${startTime.minute}";
    String end = "${endTime.hour}:${endTime.minute}";
    return "$start - $end";
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      content: const Text("اختر الوقت بشكل صحيح"),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 80),
              child: Text(
                'تفاصيل المنظمة',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const Text(
              'من الساعة:',
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
              child: const Text('اختر وقت بداية العمل'),
            ),
            // To display the end time
            const SizedBox(height: 20),
            const Text(
              'الى:',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              ' ${endTime.format(context)}',
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            // To show the time picker for end time
            ElevatedButton(
                onPressed: () {
                  selectTime(false);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  minimumSize: MaterialStateProperty.all<Size>(const Size(175, 40)),
                  foregroundColor: MaterialStateProperty.all<Color>(const Color(0xFF213753)),
                ),
                child: const Text('اختر وقت نهاية العمل')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                if (isValidTimeRange()) {
                  final String text = timeToText();
                  widget.newOrganization.time = text;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Choose_type(
                              newOrganization: widget.newOrganization,
                            )),
                  );
                } else {
                  showAlertDialog(context);
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF039C8A)),
                minimumSize: MaterialStateProperty.all<Size>(const Size(175, 40)),
              ),
              child: const Text(
                'التالي',
                style: TextStyle(
                  color: Colors.white,
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
