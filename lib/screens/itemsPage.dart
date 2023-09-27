// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:invoice_maker/appcolors.dart';
import 'package:invoice_maker/customWidgets/appBar.dart';
import 'package:invoice_maker/customWidgets/bottombar.dart';
import 'package:invoice_maker/customWidgets/customText.dart';
import 'package:invoice_maker/screens/settingPages/settingPage.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({Key? key}) : super(key: key);

  @override
  _ItemsPageState createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarr(centerTitle: 'Items'),
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
            color: Colors.grey.shade200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.folder_open,
                  size: 55,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(
                  height: 10,
                ),
                customText(
                    text:
                        'Here you can manage a list of products or services that you repeatedly invoice for',
                    textColor: Colors.black,
                    fontsize: 16)
              ],
            ),
          ),
        ),
        floatingActionButton: Container(
          decoration: BoxDecoration(
            color: blueColor,
            border: Border.all(color: blueColor, width: 2.0),
            shape: BoxShape.circle,
          ),
          // padding: EdgeInsets.all(2.0),

          child: IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
        bottomNavigationBar: BottomBar(
          currentIndex: 3,
        ));
  }
}
