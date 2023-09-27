// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unnecessary_new

import 'package:flutter/material.dart';
import 'package:invoice_maker/appcolors.dart';
import 'package:invoice_maker/customWidgets/customText.dart';
import 'package:invoice_maker/splashScreen.dart';

class FirstLoadingScreen extends StatefulWidget {
  const FirstLoadingScreen({super.key});

  @override
  State<FirstLoadingScreen> createState() => _FirstLoadingScreenState();
}

class _FirstLoadingScreenState extends State<FirstLoadingScreen> {
  bool showLoadingText = false;
  @override
  void initState() {
    super.initState();
    new Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        showLoadingText = true;
      });
    }).then((value) {
      new Future.delayed(
          const Duration(seconds: 3),
          () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SplashScreen()),
              ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: orangeColor,
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/app_logo.jpg",
              width: 200,
              height: 200,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          customText(text: showLoadingText ? 'Loading...' : '')
        ]));
  }
}
