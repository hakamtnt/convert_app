import 'dart:async';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import '../models/pick_time_modal.dart';
import 'local_time.dart';

class TimeConverterWidget extends StatefulWidget {
  final List<String> allCity;
  const TimeConverterWidget({Key? key, required this.allCity})
      : super(key: key);

  @override
  _TimeConverterWidgetState createState() => _TimeConverterWidgetState();
}

class _TimeConverterWidgetState extends State<TimeConverterWidget> {
  String dropdownValue = 'Africa/Abidjan';

  String answer = 'Converted Time will be shown here.';

  String formattedTime = (formatDate(DateTime.now(), [HH, ':', nn, ':', ss]));
  String formattedYear = (formatDate(DateTime.now(), [HH, ':', nn, ':', ss]));
  String hour = (formatDate(DateTime.now(), ['a']));
  late Timer _timer;
  late Future<PickTimeModel> futureTimepicker;

  @override
  void initState() {
    super.initState();
    _timer =
        Timer.periodic(const Duration(milliseconds: 500), (timer) => _update());
    futureTimepicker = pickTime(zone: dropdownValue);
  }

  void _update() {
    setState(() {
      formattedTime = (formatDate(DateTime.now(), [HH, ':', nn, ':', ss]));
      formattedYear = (formatDate(DateTime.now(), [d, '-', M, '-', yy]));

      hour = (formatDate(DateTime.now(), ['a']));
    });
  }

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LocalTime(
          title: 'Local Time',
          time: "$formattedTime / $formattedYear",
        ),
        const SizedBox(
          height: 10,
        ),
        FutureBuilder<PickTimeModel>(
          future: futureTimepicker,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return LocalTime(
                  time: snapshot.data!.currentLocalTime, title: dropdownValue);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
        const SizedBox(height: 20),
        Card(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Convert Time By Select TimeZone',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down_rounded),
                        iconSize: 24,
                        elevation: 16,
                        isExpanded: true,
                        underline: Container(
                          height: 2,
                          color: Colors.grey.shade400,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                            futureTimepicker;
                          });
                        },
                        items: widget.allCity
                            .toSet()
                            .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        futureTimepicker;
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor)),
                    child: const Text('Convert'),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
