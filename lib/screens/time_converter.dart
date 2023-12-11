import 'package:flutter/material.dart';
import 'package:forget_password/widgets/time_converter_widget.dart';

import '../functions/fetch_rates.dart';
import '../styles/colors.dart';

class TimeConverter extends StatefulWidget {
  const TimeConverter({super.key});

  @override
  State<TimeConverter> createState() => _TimeConverterState();
}

class _TimeConverterState extends State<TimeConverter> {
  late List<String> allCity = [];
  final formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: bgColor),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: FutureBuilder<List<String>>(
              future: fetchAllCity(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Column(children: [
                  TimeConverterWidget(allCity: snapshot.data!.toList() ),

                ],);
              },
            ),
          ),
        ),
      ),
    );
  }
}
