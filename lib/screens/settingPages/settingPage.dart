// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:invoice_maker/appcolors.dart';
import 'package:invoice_maker/customWidgets/customText.dart';
import 'package:invoice_maker/provider/themeProvider.dart';
import 'package:invoice_maker/screens/settingPages/aboutPage.dart';
import 'package:invoice_maker/screens/settingPages/regionPage.dart';
import 'package:invoice_maker/splashScreen.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool switched = false;
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: blueColor,
        title: customText(text: 'Settings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 5),
              child: Card(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      padding: EdgeInsets.only(left: 5, top: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5)),
                        color: Colors.grey,
                      ),
                      child: customText(text: 'Support'),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      padding: EdgeInsets.only(left: 5, top: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: customText(
                          text: 'Contact us', textColor: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 5),
              child: Card(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      padding: EdgeInsets.only(left: 5, top: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5)),
                        color: Colors.grey,
                      ),
                      child: customText(text: 'Invoice'),
                    ),
                    InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 48,
                        padding: EdgeInsets.only(left: 5, top: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText(
                                text: 'Business Details',
                                textColor: Colors.black),
                            customText(
                                text: 'Logo, Name and Contact Information',
                                textColor: Colors.grey),
                            SizedBox(
                              height: 4,
                            )
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey.shade300,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 48,
                      padding: EdgeInsets.only(left: 5, top: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customText(
                              text: 'Payment Info', textColor: Colors.black),
                          customText(
                              text: 'Do not enter sensitive information',
                              textColor: Colors.grey),
                          SizedBox(
                            height: 4,
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey.shade300,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      padding: EdgeInsets.only(left: 5, top: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: customText(text: 'Tax', textColor: Colors.black),
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey.shade300,
                    ),
                    InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 30,
                        padding: EdgeInsets.only(left: 5, top: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: customText(
                            text: 'Default Notes', textColor: Colors.black),
                      ),
                      onTap: () {},
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey.shade300,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      padding: EdgeInsets.only(left: 5, top: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: customText(
                          text: 'Invoice Number', textColor: Colors.black),
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey.shade300,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      padding: EdgeInsets.only(left: 5, top: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: customText(
                          text: 'Export as Spreadsheet',
                          textColor: Colors.black),
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey.shade300,
                    ),
                    InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 30,
                        padding: EdgeInsets.only(left: 5, top: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: customText(
                            text: 'Customize', textColor: Colors.black),
                      ),
                      onTap: () {},
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey.shade300,
                    ),
                    InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 30,
                        padding: EdgeInsets.only(left: 5, top: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: customText(
                            text: 'Default Email Message',
                            textColor: Colors.black),
                      ),
                      onTap: () {},
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey.shade300,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      padding: EdgeInsets.only(left: 5, top: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customText(
                                text: 'Send me a copy of emails',
                                textColor: Colors.black),
                            Switch(
                                // thumb color (round icon)
                                activeColor: Colors.amber,
                                activeTrackColor: Colors.cyan,
                                inactiveThumbColor: Colors.blueGrey.shade600,
                                inactiveTrackColor: Colors.grey.shade400,
                                splashRadius: 50.0,
                                value: switched,
                                // changes the state of the switch
                                onChanged: (value) {
                                  themeProvider.toggleTheme();
                                  switched = !switched;
                                })
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 5),
              child: Card(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      padding: EdgeInsets.only(left: 5, top: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5)),
                        color: Colors.grey,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customText(text: 'Account'),
                          Padding(
                            padding: const EdgeInsets.only(right: 3.0),
                            child: customText(text: 'Guest'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      padding: EdgeInsets.only(left: 5, top: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customText(text: 'Sync', textColor: Colors.black),
                          Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: customText(
                                text: 'last synced 0 seconds ago',
                                textColor: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey.shade300,
                    ),
                    InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 48,
                        padding: EdgeInsets.only(left: 5, top: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText(text: 'Region', textColor: Colors.black),
                            customText(
                                text:
                                    'Language, Currency, Tax year and Date Format',
                                textColor: Colors.grey),
                            SizedBox(
                              height: 4,
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegionPage()),
                        );
                      },
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey.shade300,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      padding: EdgeInsets.only(left: 5, top: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child:
                          customText(text: 'Upgrade', textColor: Colors.black),
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey.shade300,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      padding: EdgeInsets.only(left: 5, top: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child:
                          customText(text: 'Backup', textColor: Colors.black),
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey.shade300,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      padding: EdgeInsets.only(left: 5, top: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: customText(
                          text: 'Restore Purchases', textColor: Colors.black),
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey.shade300,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      padding: EdgeInsets.only(left: 5, top: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: customText(
                          text: 'Check Subscriptions', textColor: Colors.black),
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey.shade300,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      padding: EdgeInsets.only(left: 5, top: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: customText(
                          text: 'Switch Account', textColor: Colors.black),
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey.shade300,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      padding: EdgeInsets.only(left: 5, top: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child:
                          customText(text: 'Sign Up', textColor: Colors.black),
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey.shade300,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      padding: EdgeInsets.only(left: 5, top: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: customText(
                          text: 'Delete Account', textColor: Colors.black),
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey.shade300,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      padding: EdgeInsets.only(left: 5, top: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: InkWell(
                        child:
                            customText(text: 'Logout', textColor: Colors.black),
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (context, a, b) =>
                                      SplashScreen()),
                              (route) => false);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 5),
              child: Card(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      padding: EdgeInsets.only(left: 5, top: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5)),
                        color: Colors.grey,
                      ),
                      child: customText(text: 'Information'),
                    ),
                    InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 30,
                        padding: EdgeInsets.only(left: 5, top: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customText(text: 'About', textColor: Colors.black),
                            Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: customText(
                                  text: 'v3.3.966', textColor: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AboutPage()),
                        );
                      },
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey.shade300,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      padding: EdgeInsets.only(left: 5, top: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: customText(
                          text: 'Terms of Use', textColor: Colors.black),
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey.shade300,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      padding: EdgeInsets.only(left: 5, top: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: customText(
                          text: 'Privacy Policy', textColor: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
