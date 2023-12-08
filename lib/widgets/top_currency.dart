import 'package:flutter/material.dart';
import 'package:forget_password/styles/colors.dart';

import '../styles/style.dart';

class TopCurrency extends StatelessWidget {
  const TopCurrency({super.key, required this.currency, required this.price});
  final String currency;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: 70,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: blue,

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            currency,
            style: CustomText.myStyle,
          ),
          Text(price, style: CustomText.myStyle),

        ],
      ),
    );
  }
}
