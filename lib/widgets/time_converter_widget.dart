import 'package:flutter/material.dart';
import '../styles/style.dart';

class TimeConverterWidget extends StatefulWidget {
  final List<String> allCity;
  const TimeConverterWidget({Key? key, required this.allCity})
      : super(key: key);

  @override
  _TimeConverterWidgetState createState() => _TimeConverterWidgetState();
}

class _TimeConverterWidgetState extends State<TimeConverterWidget> {
  String dropdownValue1 = 'Africa/Abidjan';
  String dropdownValue2 = 'Africa/Abidjan';
  String answer = 'Converted Time will be shown here.';

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Convert Time',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 20),
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
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  answer,
                  style: CustomText.textValue,
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
