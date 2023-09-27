// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_declarations, use_key_in_widget_constructors, library_private_types_in_public_api, unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:invoice_maker/appcolors.dart';
import 'package:invoice_maker/customWidgets/customFunctions.dart';
import 'package:invoice_maker/customWidgets/customText.dart';
import 'package:invoice_maker/customWidgets/customTextField.dart';
import 'package:invoice_maker/customWidgets/ui_helper.dart';
import 'package:invoice_maker/models/user_model.dart';
import 'package:invoice_maker/screens/invoices.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class BusinessInfoPage extends StatefulWidget {
  @override
  _BusinessInfoPageState createState() => _BusinessInfoPageState();
}

class _BusinessInfoPageState extends State<BusinessInfoPage> {
  late int selectedPage;
  late final PageController _pageController;
  TextEditingController businessNameController =
      TextEditingController(text: 'IT');
  TextEditingController emailController =
      TextEditingController(text: 'ritikrg007@gmail.com');
  TextEditingController phoneController =
      TextEditingController(text: '+918077849802');
  TextEditingController addressLine1Controller =
      TextEditingController(text: 'Noida');
  TextEditingController addressLine2Controller =
      TextEditingController(text: 'Sector-8');
  TextEditingController addressLine3Controller =
      TextEditingController(text: 'C-86B');
  String? businessLogoUrl;
  @override
  void initState() {
    selectedPage = 0;
    _pageController = PageController(initialPage: selectedPage);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pageCount = 3;

    void saveTask(
        {String? businessName,
        String? email,
        String? phone,
        String? addressLine1,
        String? addressLine2,
        String? addressLine3,
        String? businessLogoUrl}) {
      FirebaseFirestore.instance.collection('profile').add({
        "businessName": businessName,
        "email": email,
        "phone": phone,
        "addressLine1": addressLine1,
        "addressLine2": addressLine2,
        "addressLine3": addressLine3,
        "businessLogoUrl": businessLogoUrl,
        "date": DateTime.now(),
      });
    }

    return Scaffold(
      backgroundColor: orangeColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: PageViewDotIndicator(
          currentItem: selectedPage,
          count: pageCount,
          unselectedColor: Colors.grey.shade300,
          selectedColor: Colors.white,
          duration: Duration(milliseconds: 200),
          boxShape: BoxShape.circle,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 14.0, right: 5),
            child: InkWell(
              child: customText(
                  text: selectedPage == 2 ? 'Finish' : 'Next', fontsize: 17),
              onTap: () {
                if (selectedPage < 2) {
                  selectedPage++;
                  _pageController.animateToPage(selectedPage,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut);

                  setState(() {});
                } else if (selectedPage == 2) {
                  saveTask(
                      addressLine1: addressLine1Controller.text,
                      addressLine2: addressLine2Controller.text,
                      addressLine3: addressLine3Controller.text,
                      businessLogoUrl: businessLogoUrl,
                      businessName: businessNameController.text,
                      email: emailController.text,
                      phone: phoneController.text);
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, a, b) => InvoicePage()));
                }
              },
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (page) {
                  print("ihugy");
                  setState(() {
                    selectedPage = page;
                  });
                },
                children: List.generate(pageCount, (index) {
                  return selectedPage == 0
                      ? Column(
                          children: [
                            Icon(
                              Icons.unsubscribe_outlined,
                              color: Colors.white,
                              size: 40,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            customText(text: 'Business Info', fontsize: 28),
                            SizedBox(
                              height: 10,
                            ),
                            customText(
                                text: '(All fields are optional)',
                                fontsize: 13),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 10),
                                    child: CustomTextField(
                                      controller: businessNameController,
                                      labelText: 'Business Name',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: 75,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 9,
                                      right: 5,
                                      left: 5,
                                    ),
                                    child: CustomTextField(
                                      controller: emailController,
                                      labelText: 'Email',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: Colors.grey,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      bottom: 2,
                                      right: 5,
                                      left: 5,
                                    ),
                                    child: CustomTextField(
                                      controller: phoneController,
                                      labelText: 'Phone',
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: 118,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 7,
                                      right: 5,
                                      left: 5,
                                    ),
                                    child: CustomTextField(
                                      controller: addressLine1Controller,
                                      labelText: 'Address Line 1',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: Colors.grey,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 3,
                                      right: 5,
                                      left: 5,
                                    ),
                                    child: CustomTextField(
                                      controller: addressLine2Controller,
                                      labelText: 'Address Line 2',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: Colors.grey,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 3,
                                      right: 5,
                                      left: 5,
                                    ),
                                    child: CustomTextField(
                                      controller: addressLine3Controller,
                                      labelText: 'Address Line 3',
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      : selectedPage == 1
                          ? Column(
                              children: [
                                Icon(
                                  Icons.image_outlined,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                customText(text: 'Business Logo', fontsize: 28),
                                SizedBox(
                                  height: 5,
                                ),
                                customText(
                                    text:
                                        'Appears on all invoices. Can be edited any time',
                                    fontsize: 13),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 50,
                                  width: 145,
                                  child: TextButton(
                                      child: Text("CHOOSE IMAGE".toUpperCase(),
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: orangeColor)),
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.zero,
                                                  side: BorderSide(
                                                      color: Colors.red)))),
                                      onPressed: () async {
                                        businessLogoUrl =
                                            await uploadData(context: context);
                                      }),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                Icon(
                                  Icons.check_circle_outlined,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                customText(text: 'All Set!', fontsize: 28),
                                SizedBox(
                                  height: 5,
                                ),
                                customText(
                                    text:
                                        "You're ready to create your first invoice",
                                    fontsize: 13),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 50,
                                  width: 145,
                                  child: TextButton(
                                      child: Text("CREATE INVOICE",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: orangeColor)),
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.zero,
                                                  side: BorderSide(
                                                      color: Colors.red)))),
                                      onPressed: () {
                                        // Navigator.push(
                                        //     context,
                                        //     PageRouteBuilder(
                                        //         pageBuilder: (context, a, b) =>
                                        //             BusinessInfoPage()));
                                      }),
                                ),
                              ],
                            );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
