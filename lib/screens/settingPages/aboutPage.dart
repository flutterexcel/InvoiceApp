// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:invoice_maker/appcolors.dart';
import 'package:invoice_maker/customWidgets/customText.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(224, 224, 224, 1),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: blueColor,
        title: const Text(
          "About",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          Card(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 30,
                  padding: EdgeInsets.only(left: 5, top: 4, right: 5),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5)),
                  child: InkWell(
                    child: customText(
                      text: 'App Version',
                    ),
                    onTap: () {},
                  ),
                ),
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    padding: EdgeInsets.only(left: 5, top: 4, right: 5),
                    child: customText(
                        text: '3.4.126', textColor: Colors.grey.shade400),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Card(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 30,
                  padding: EdgeInsets.only(left: 5, top: 4, right: 5),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5)),
                  child: InkWell(
                    child: customText(
                      text: 'Sync Info',
                    ),
                    onTap: () {},
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 43,
                  padding: EdgeInsets.only(left: 5, top: 4, right: 5),
                  child: Row(
                    children: [
                      customText(text: 'INVOICE', textColor: Colors.black),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          customText(text: '2', textColor: Colors.black),
                          customText(
                              text: '1695632893743',
                              textColor: Colors.grey.shade400),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey.shade300,
                  height: 1,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 43,
                  padding: EdgeInsets.only(left: 5, top: 4, right: 5),
                  child: Row(
                    children: [
                      customText(text: 'SETTING', textColor: Colors.black),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          customText(text: '19', textColor: Colors.black),
                          customText(
                              text: '1695641564618',
                              textColor: Colors.grey.shade400),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey.shade300,
                  height: 1,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 43,
                  padding: EdgeInsets.only(left: 5, top: 4, right: 5),
                  child: Row(
                    children: [
                      customText(text: 'CLIENT', textColor: Colors.black),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          customText(text: '0', textColor: Colors.black),
                          customText(text: '', textColor: Colors.grey.shade400),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey.shade300,
                  height: 1,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 43,
                  padding: EdgeInsets.only(left: 5, top: 4, right: 5),
                  child: Row(
                    children: [
                      customText(text: 'PHOTO', textColor: Colors.black),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          customText(text: '0', textColor: Colors.black),
                          customText(text: '', textColor: Colors.grey.shade400),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey.shade300,
                  height: 1,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 43,
                  padding: EdgeInsets.only(left: 5, top: 4, right: 5),
                  child: Row(
                    children: [
                      customText(text: 'ITEM', textColor: Colors.black),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          customText(text: '0', textColor: Colors.black),
                          customText(text: '', textColor: Colors.grey.shade400),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey.shade300,
                  height: 1,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 43,
                  padding: EdgeInsets.only(left: 5, top: 4, right: 5),
                  child: Row(
                    children: [
                      customText(text: 'MSG', textColor: Colors.black),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          customText(text: '1', textColor: Colors.black),
                          customText(
                              text: '1695632602900',
                              textColor: Colors.grey.shade400),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey.shade300,
                  height: 1,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 43,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.only(left: 5, top: 4, right: 5),
                  child: Row(
                    children: [
                      customText(text: 'EXPENSE', textColor: Colors.black),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          customText(text: '0', textColor: Colors.black),
                          customText(text: '', textColor: Colors.grey.shade400),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
