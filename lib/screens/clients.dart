// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:invoice_maker/appcolors.dart';
import 'package:invoice_maker/customWidgets/appBar.dart';
import 'package:invoice_maker/customWidgets/bottombar.dart';
import 'package:invoice_maker/customWidgets/customText.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({Key? key}) : super(key: key);

  @override
  _ClientsPageState createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarr(centerTitle: 'Clients'),
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
                  Icons.person,
                  size: 55,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(
                  height: 10,
                ),
                customText(
                    text: 'Your clients will show up here',
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
          currentIndex: 2,
        ));
  }
}
