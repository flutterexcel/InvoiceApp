// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:invoice_maker/appcolors.dart';
import 'package:invoice_maker/customWidgets/bottombar.dart';
import 'package:invoice_maker/customWidgets/customText.dart';
import 'package:invoice_maker/screens/settingPages/settingPage.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({Key? key}) : super(key: key);

  @override
  _ReportsPageState createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  List<String> reportsList = ['Paid', 'Clients', 'Items'];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: blueColor,
          leading: InkWell(
            child: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, a, b) => const SettingPage()));
            },
          ),
          title: const Text(
            "Reports",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            const Icon(
              Icons.refresh_outlined,
              color: Colors.white,
            ),
            SizedBox(
              width: 5,
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                height: 35.0,
                width: MediaQuery.of(context).size.width / 1.3,
                child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return Container(
                        color: Colors.black,
                        height: 40,
                        width: 1,
                      );
                    },
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: ((context, index) {
                      return InkWell(
                        child: Container(
                            width: MediaQuery.of(context).size.width / 1.3 / 3,
                            color: index == selectedIndex
                                ? blueColor
                                : Colors.white,
                            child: Center(
                                child: customText(
                                    text: reportsList[index],
                                    textColor: index == selectedIndex
                                        ? Colors.white
                                        : blueColor))),
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      );
                    })),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: Colors.grey,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  SizedBox(
                    width: 30,
                  ),
                  customText(
                      text: 'Clients', textColor: Colors.black, isBold: true),
                  SizedBox(
                    width: 15,
                  ),
                  customText(
                      text: 'Invoices', textColor: Colors.black, isBold: true),
                  Spacer(),
                  customText(
                      text: 'Paid', textColor: Colors.black, isBold: true),
                  SizedBox(
                    width: 5,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: Colors.grey,
              ),
              customText(text: 'Nothing to show yet', textColor: Colors.black),
              SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomBar(
          currentIndex: 4,
        ));
  }
}
