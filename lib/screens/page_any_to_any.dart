import 'package:flutter/material.dart';
import 'package:forget_password/styles/colors.dart';

import '../widgets/anyToAny.dart';
import '../widgets/usdToAny.dart';
import '../functions/fetch_rates.dart';
import '../models/ratesmodel.dart';

class PageAnyToAny extends StatefulWidget {
  const PageAnyToAny({Key? key}) : super(key: key);

  @override
  _PageAnyToAnyState createState() => _PageAnyToAnyState();
}

class _PageAnyToAnyState extends State<PageAnyToAny> {
  //Initial Variables

  late Future<RatesModel> result;
  late Future<Map> allCurrencies;
  final formkey = GlobalKey<FormState>();

  //Getting RatesModel and All Currencies
  @override
  void initState() {
    super.initState();
    setState(() {
      result = fetchRates();
      allCurrencies = fetchCurrencies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Future Builder for Getting Exchange Rates
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: bgColor),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: FutureBuilder<RatesModel>(
              future: result,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Center(
                  child: FutureBuilder<Map>(
                      future: allCurrencies,
                      builder: (context, currSnapshot) {
                        if (currSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnyToAny(
                              currencies: currSnapshot.data!,
                              rates: snapshot.data!.rates,
                            ),
                          ],
                        );
                      }),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
