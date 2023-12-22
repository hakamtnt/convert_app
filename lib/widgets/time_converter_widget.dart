import 'dart:async';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import '../functions/time_converter.dart';
import '../models/time_zone_modal.dart';
import 'local_time.dart';

class TimeConverterWidget extends StatefulWidget {
  final List<String> allCity;
  const TimeConverterWidget({Key? key, required this.allCity})
      : super(key: key);

  @override
  _TimeConverterWidgetState createState() => _TimeConverterWidgetState();
}

class _TimeConverterWidgetState extends State<TimeConverterWidget> {
  String dropdownValue1 = 'Asia/Kolkata';
  String dropdownValue2 = 'Africa/Accra';

  String answer = 'Converted Time will be shown here.';

  String formattedTime = (formatDate(DateTime.now(), [HH, ':', nn, ':', ss]));
  String formattedYear = (formatDate(DateTime.now(), [HH, ':', nn, ':', ss]));

  String formattedTime1 = '1';
  String formattedYear1 = '1';
  DateTime convertedVal = DateTime.now();

  String hour = (formatDate(DateTime.now(), ['a']));
  Timer? _timer;

  Future<TimeZoneModel>? _futureTimepicker;

  Future<void> _converterTimeUpdate() async {
    setState(() {
      convertedVal = convertedVal.add(const Duration(seconds: 1));
      formattedTime1 = (formatDate(convertedVal, [HH, ':', nn, ':', ss]));
      formattedYear1 = (formatDate(convertedVal, [m, '/', d, '/', yyyy]));
    });
  }

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LocalTime(
          title: 'Local Time',
          time: " $formattedYear / $formattedTime",
        ),
        const SizedBox(
          height: 10,
        ),
        FutureBuilder<TimeZoneModel>(
          future: _futureTimepicker,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              String dateTimeVal = snapshot.data!.conversionResult.dateTime;
              convertedVal = DateTime.parse(dateTimeVal);
              _converterTimeUpdate();
              _timer = Timer.periodic(
                  const Duration(seconds: 1), (timer) => _converterTimeUpdate);
              return LocalTime(
                  time: '${formattedYear1} ${formattedTime1}',
                  title: dropdownValue2);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Text('Convert Time');
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
                        value: dropdownValue1,
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
                            dropdownValue1 = newValue!;
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
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text('To')),
                    Expanded(
                      child: DropdownButton<String>(
                        value: dropdownValue2,
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
                            dropdownValue2 = newValue!;
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
                        _futureTimepicker = pickTime(dropdownValue1,
                            DateTime.now().toString(), dropdownValue2, '');
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
