import 'package:flutter/material.dart';
import 'package:forget_password/widgets/time_converter_widget.dart';

import '../functions/fetch_rates.dart';
import '../styles/colors.dart';

class MyTimeConverter extends StatefulWidget {
  MyTimeConverter({super.key});

  @override
  State<MyTimeConverter> createState() => _MyTimeConverterState();
}

class _MyTimeConverterState extends State<MyTimeConverter> {
  final formkey = GlobalKey<FormState>();
  late Future<List<String>> futureAllCity;

  @override
  void initState() {
    futureAllCity = fetchAllCity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        title: Text('Time Converter'),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: bgColor),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: FutureBuilder<List<String>>(
              future: futureAllCity,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Column(
                  children: [
                    TimeConverterWidget(allCity: snapshot.data!.toList()),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
