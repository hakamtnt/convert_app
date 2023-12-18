import 'package:flutter/material.dart';

import '../Styles/colors.dart';
import '../styles/style.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.maxFinite,
      width: double.maxFinite,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: bgColor),
      child: Center(
        child: Text('TOP N TECH', style: CustomText.textValue),
      ),
    ));
  }
}
