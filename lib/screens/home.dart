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
  final formkey = GlobalKey<FormState>();
  late Future<Map> futureCurrencies;
  late Future<RateList> futureRatesList;
  late Future<RatesModel> futureRateModel;

  @override
  void initState() {
    futureCurrencies = fetchCurrencies();
    futureRatesList = fetchRatesList();
    futureRateModel = fetchRates();
    super.initState();
  }

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
          child: FutureBuilder<RatesModel>(
            future: futureRateModel,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return Center(
                child: FutureBuilder<Map>(
                    future: futureCurrencies,
                    builder: (context, currSnapshot) {
                      if (currSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FutureBuilder<RateList>(
                            future: futureRatesList,
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
                                    price: priceList.data!.rate.inr
                                        .toStringAsFixed(2),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TopCurrency(
                                    currency: 'British Pound',
                                    price: priceList.data!.rate.gbp
                                        .toStringAsFixed(2),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TopCurrency(
                                    currency: 'Australia Dollar',
                                    price: priceList.data!.rate.aud
                                        .toStringAsFixed(2),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TopCurrency(
                                    currency: 'Omani Rial',
                                    price: priceList.data!.rate.omr
                                        .toStringAsFixed(2),
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
