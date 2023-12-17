import 'package:flutter/material.dart';
import 'package:forget_password/styles/colors.dart';

import '../styles/style.dart';

class LocalTime extends StatelessWidget {
  const LocalTime({super.key, required this.time, required this.title, });
  final String time;
 final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: blue,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: CustomText.myStyle,
          ),
          Text(time, style: CustomText.myStyle),
        ],
      ),
    );
  }
}
