// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:invoice_maker/appcolors.dart';
import 'package:invoice_maker/createInvoice/createInvoice.dart';
import 'package:invoice_maker/customWidgets/bottombar.dart';
import 'package:invoice_maker/customWidgets/customText.dart';
import 'package:invoice_maker/screens/settingPages/settingPage.dart';

class InvoicePage extends StatefulWidget {
  const InvoicePage({Key? key}) : super(key: key);

  @override
  _InvoicePageState createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage>
    with TickerProviderStateMixin {
  late TabController viewController;
  bool searchTapped = false;
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    viewController = TabController(length: 3, vsync: this);

    // Initialize HomePage Banner
  }

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
            "Invoices",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            searchTapped
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        color: Colors.white,
                        child: TextFormField(
                          controller: searchController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 8),
                            hintText: 'Search',
                            prefixIcon: Icon(Icons.search),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Icon(
                                    Icons.clear,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    searchTapped = false;
                                  });
                                },
                              ),
                            ),
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: blueColor,
                              fontFamily: "RobotoThin",
                            ),
                          ),
                        )),
                  )
                : InkWell(
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onTap: () {
                      setState(() {
                        searchTapped = true;
                      });
                    },
                  ),
            SizedBox(
              width: 5,
            )
          ],
          bottom: TabBar(
            controller: viewController,
            indicatorColor: Colors.white,
            tabs: [
              Tab(child: customText(text: 'ALL', fontsize: 11)),
              Tab(child: customText(text: 'OUTSTANDING', fontsize: 11)),
              Tab(child: customText(text: 'PAID', fontsize: 11)),
            ],
          ),
        ),
        body: SafeArea(
          child: Container(
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
            color: Colors.grey.shade200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: TabBarView(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    controller: viewController,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.assignment_late,
                            size: 45,
                            color: Colors.grey.shade600,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          customText(
                              text:
                                  'Your invoices will show up here. Click the plus button below to create your first invoice!',
                              textColor: Colors.black,
                              fontsize: 16)
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.assignment_late,
                            size: 45,
                            color: Colors.grey.shade600,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          customText(
                              text:
                                  'Invoices that are not yet paid show up here.',
                              textColor: Colors.black,
                              fontsize: 16)
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.assignment_late,
                            size: 45,
                            color: Colors.grey.shade600,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          customText(
                              text:
                                  'Invoices that you mark paid will show up here.',
                              textColor: Colors.black,
                              fontsize: 16)
                        ],
                      ),
                    ],
                  ),
                ),
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
            onPressed: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, a, b) => CreateInvoicePage()));
            },
          ),
        ),
        bottomNavigationBar: BottomBar(
          currentIndex: 0,
        ));
  }
}
