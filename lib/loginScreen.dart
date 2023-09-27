// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:invoice_maker/appcolors.dart';
import 'package:invoice_maker/customWidgets/customText.dart';
import 'package:invoice_maker/customWidgets/customTextField.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: orangeColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customText(text: 'Login', fontsize: 21),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: CustomTextField(
                                controller: emailController,
                                labelText: 'Email',
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: CustomTextField(
                                controller: passwordController,
                                labelText: 'Password',
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            customText(text: 'Login', textColor: Colors.black)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customText(
                              text: 'Forgot Password?',
                              isBold: true,
                              underline: true),
                          customText(
                              text: 'Contact Support',
                              isBold: true,
                              underline: true),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ]));
  }
}
