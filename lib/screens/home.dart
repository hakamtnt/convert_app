import 'package:flutter/material.dart';

import '../widgets/usdToAny.dart';
import '../functions/fetch_rates.dart';
import '../models/ratesmodel.dart';
import '../styles/colors.dart';
import '../widgets/top_currency.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Initial Variables

  late Future<RatesModel> result;
  late Future<RateList> rateListOfAll;
  late Future<Map> allCurrencies;

  final formkey = GlobalKey<FormState>();

  //Getting RatesModel and All Currencies
  @override
  void initState() {
    super.initState();
    setState(() {
      result = fetchRates();
      rateListOfAll = fetchratesList();
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
                        return const Center(child: CircularProgressIndicator());
                      }

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FutureBuilder<RateList>(
                            future: rateListOfAll,
                            builder: (context, priceList) {
                              if (currSnapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              return Column(
                                children: [
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TopCurrency(
                                    currency: 'Indian Rupee',
                                    price: priceList.data!.rate.inr.toString(),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TopCurrency(
                                    currency: 'British Pound',
                                    price: priceList.data!.rate.gbp.toString(),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TopCurrency(
                                    currency: 'Australia Dollar',
                                    price: priceList.data!.rate.aud.toString(),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TopCurrency(
                                    currency: 'Omani Rial',
                                    price: priceList.data!.rate.omr.toString(),
                                  ),
                                ],
                              );
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          UsdToAny(
                            rates: snapshot.data!.rates,
                            currencies: currSnapshot.data!,
                          ),
                        ],
                      );
                    }),
              );
            },
          ),
        ),
      ),
    ));
  }
}
