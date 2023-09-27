// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:invoice_maker/appcolors.dart';
import 'package:invoice_maker/customWidgets/customLoader.dart';
import 'package:invoice_maker/customWidgets/customText.dart';
import 'package:invoice_maker/getStarted/businessInfo.dart';
import 'package:invoice_maker/loginScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: orangeColor,
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/app_logo.jpg",
              width: 150,
              height: 150,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Invoice Simple",
            style: TextStyle(fontSize: 19, color: Colors.white),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Create professional invoices in seconds!",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 50,
            width: 135,
            child: TextButton(
                child: Text("GET STARTED".toUpperCase(),
                    style: TextStyle(fontSize: 14, color: orangeColor)),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                            side: BorderSide(color: Colors.red)))),
                onPressed: () {
                  // showLoadingDialog(context);

                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, a, b) => BusinessInfoPage()));
                }),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customText(text: 'Already have an account?'),
                customText(text: 'Login', underline: true, isBold: true)
              ],
            ),
            onTap: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, a, b) => LoginScreen()));
            },
          )
        ]));
  }
}
