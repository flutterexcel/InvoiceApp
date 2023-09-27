// ignore_for_file: prefer_const_constructors, prefer_if_null_operators

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:invoice_maker/appcolors.dart';
import 'package:invoice_maker/createInvoice/additionalDetailsPage.dart';
import 'package:invoice_maker/createInvoice/clientPage.dart';
import 'package:invoice_maker/createInvoice/discountPage.dart';
import 'package:invoice_maker/createInvoice/emailInvoicePage.dart';
import 'package:invoice_maker/createInvoice/invoiceNumber.dart';
import 'package:invoice_maker/createInvoice/itemPage.dart';
import 'package:invoice_maker/createInvoice/paymentInfoPage.dart';
import 'package:invoice_maker/createInvoice/paymentsPage.dart';
import 'package:invoice_maker/createInvoice/photoPage.dart';
import 'package:invoice_maker/createInvoice/signaturePage.dart';
import 'package:invoice_maker/createInvoice/taxPage.dart';
import 'package:invoice_maker/customWidgets/bottombar.dart';
import 'package:invoice_maker/customWidgets/customFunctions.dart';
import 'package:invoice_maker/customWidgets/customText.dart';
import 'package:invoice_maker/models/createInvoiceModel.dart';
import 'package:invoice_maker/provider/invoiceProvider.dart';
import 'package:invoice_maker/screens/settingPages/settingPage.dart';
import 'package:provider/provider.dart';

class CreateInvoicePage extends StatefulWidget {
  const CreateInvoicePage({Key? key}) : super(key: key);

  @override
  _CreateInvoicePageState createState() => _CreateInvoicePageState();
}

class _CreateInvoicePageState extends State<CreateInvoicePage>
    with TickerProviderStateMixin {
  late TabController viewController;
  bool searchTapped = false;
  TextEditingController searchController = TextEditingController();
  bool switched = true;
  @override
  void initState() {
    super.initState();
    viewController = TabController(length: 3, vsync: this);

    // Initialize HomePage Banner
  }

  List<String> addPhotosList = [
    'Take photo',
    'Select photos',
    'Cancel',
  ];
  Uint8List? imageBytes;
  @override
  Widget build(BuildContext context) {
    var invoiceProvider = Provider.of<InvoiceProvider>(
      context,
    );
    print("invoiceProviderinvoiceProvider$invoiceProvider");
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
            PopupMenuButton(
                padding: EdgeInsets.only(left: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0.0)),
                ),
                itemBuilder: (context) {
                  return <PopupMenuItem>[
                    PopupMenuItem(
                        height: 30,
                        child: GestureDetector(
                          child:
                              Text('Open In..', style: TextStyle(fontSize: 13)),
                          onTap: () {},
                        )),
                    PopupMenuItem(
                        height: 30,
                        child: GestureDetector(
                          child: Text('Share', style: TextStyle(fontSize: 13)),
                          onTap: () {},
                        )),
                    PopupMenuItem(
                        height: 30,
                        child: GestureDetector(
                          child: Text('Print', style: TextStyle(fontSize: 13)),
                          onTap: () {},
                        )),
                    PopupMenuItem(
                        height: 30,
                        child: GestureDetector(
                          child:
                              Text('Get link', style: TextStyle(fontSize: 13)),
                          onTap: () {},
                        )),
                    PopupMenuItem(
                        height: 30,
                        child: GestureDetector(
                          child:
                              Text('Duplicate', style: TextStyle(fontSize: 13)),
                          onTap: () {},
                        )),
                  ];
                },
                child: Row(
                  children: [
                    Icon(Icons.more_vert),
                  ],
                )),
            SizedBox(
              width: 5,
            )
          ],
          bottom: TabBar(
            controller: viewController,
            indicatorColor: Colors.white,
            tabs: [
              Tab(child: customText(text: 'EDIT', fontsize: 11)),
              Tab(child: customText(text: 'PREVIEW', fontsize: 11)),
              Tab(child: customText(text: 'HISTORY', fontsize: 11)),
            ],
          ),
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top: 1, left: 1, right: 1),
            color: Colors.grey.shade400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: TabBarView(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    controller: viewController,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 5),
                                child: Column(
                                  children: [
                                    InkWell(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 30,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  topRight: Radius.circular(5)),
                                            ),
                                            child: customText(
                                                text: 'INV0001',
                                                textColor: Colors.black,
                                                fontsize: 18),
                                          ),
                                          Container(
                                            height: 30,
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                border: Border.all(
                                                    color: invoiceProvider
                                                                    .date !=
                                                                null &&
                                                            DateTime.parse(invoiceProvider
                                                                        .date!)
                                                                    .compareTo(
                                                                        DateTime
                                                                            .now()) <
                                                                0
                                                        ? orangeColor
                                                        : Colors.black)),
                                            child: customText(
                                                text: invoiceProvider.date !=
                                                            null &&
                                                        DateTime.parse(invoiceProvider.date!)
                                                                .compareTo(
                                                                    DateTime
                                                                        .now()) <
                                                            0
                                                    ? 'Overdue'
                                                    : 'Due on receipt',
                                                textColor: invoiceProvider.date !=
                                                            null &&
                                                        DateTime.parse(
                                                                    invoiceProvider
                                                                        .date!)
                                                                .compareTo(
                                                                    DateTime.now()) <
                                                            0
                                                    ? orangeColor
                                                    : Colors.grey.shade600),
                                          ),
                                        ],
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            PageRouteBuilder(
                                                pageBuilder: (context, a, b) =>
                                                    InvoiceNumberPage()));
                                      },
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          child: Container(
                                            height: 30,
                                            // padding:
                                            //     EdgeInsets.only(left: 5, top: 6),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: customText(
                                                text: 'Business Info',
                                                textColor:
                                                    Colors.grey.shade400),
                                          ),
                                          onTap: () {},
                                        ),
                                        InkWell(
                                          child: Container(
                                            height: 30,
                                            padding: EdgeInsets.only(
                                              left: 5,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: customText(
                                                text: invoiceProvider.date !=
                                                        null
                                                    ? DateFormat('dd-MM-yyyy')
                                                        .format(DateTime.parse(
                                                            invoiceProvider
                                                                .date!))
                                                    : DateFormat('dd-MM-yyyy')
                                                        .format(DateTime.now()),
                                                textColor: Colors.black),
                                          ),
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                    pageBuilder: (context, a,
                                                            b) =>
                                                        InvoiceNumberPage()));
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Card(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: InkWell(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      customText(
                                          text: 'To:', textColor: Colors.black),
                                      customText(
                                          text: invoiceProvider.clientName ??
                                              'Client',
                                          textColor: Colors.grey.shade400),
                                      SizedBox(
                                        height: 4,
                                      )
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                            pageBuilder: (context, a, b) =>
                                                ClientPage()));
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Card(
                              child: Column(
                                children: [
                                  InkWell(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 60,
                                      padding: EdgeInsets.only(
                                          left: 5, right: 5, top: 6),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            topRight: Radius.circular(5)),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          customText(
                                              text: 'Add Item',
                                              textColor: Colors.grey.shade400),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              customText(
                                                  text: '0 * \$0.00',
                                                  textColor:
                                                      Colors.grey.shade400),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              customText(
                                                  text: '\$0.00',
                                                  textColor:
                                                      Colors.grey.shade400),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                              pageBuilder: (context, a, b) =>
                                                  ItemPage()));
                                    },
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 30,
                                    padding: EdgeInsets.only(
                                      left: 5,
                                      right: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        customText(
                                          text: 'Subtotal',
                                        ),
                                        customText(text: '\$0.0'),
                                      ],
                                    ),
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
                                    height: 125,
                                    padding: EdgeInsets.only(
                                        left: 5, right: 5, top: 6),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5)),
                                    ),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              customText(
                                                  text: 'Discount',
                                                  textColor: Colors.black),
                                              customText(
                                                  text: '\$0.00',
                                                  textColor: Colors.black),
                                            ],
                                          ),
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                    pageBuilder:
                                                        (context, a, b) =>
                                                            DiscountPage()));
                                          },
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        InkWell(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              customText(
                                                  text: 'Tax',
                                                  textColor: Colors.black),
                                              customText(
                                                  text: '\$0.00',
                                                  textColor: Colors.black),
                                            ],
                                          ),
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                    pageBuilder:
                                                        (context, a, b) =>
                                                            TaxPage()));
                                          },
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            customText(
                                                text: 'Total',
                                                textColor: Colors.black),
                                            customText(
                                                text: '\$0.00',
                                                textColor: Colors.black),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        InkWell(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              customText(
                                                  text: 'Payments',
                                                  textColor: Colors.black),
                                              customText(
                                                  text: '\$0.00',
                                                  textColor: Colors.black),
                                            ],
                                          ),
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                    pageBuilder:
                                                        (context, a, b) =>
                                                            PaymentPage()));
                                          },
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 30,
                                    padding: EdgeInsets.only(left: 5, right: 6),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        customText(
                                          text: 'Balance Due',
                                        ),
                                        customText(text: '\$0.0'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Card(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: InkWell(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      customText(
                                          text: 'Add photo',
                                          textColor: Colors.grey.shade400),
                                      Icon(
                                        Icons.attach_file,
                                        color: Colors.grey.shade400,
                                        size: 22,
                                      )
                                    ],
                                  ),
                                  onTap: () {
                                    showModalBottomSheet(
                                        backgroundColor: Colors.white,
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: addPhotosList
                                                  .map((e) => Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(12.0),
                                                        child: InkWell(
                                                          child: customText(
                                                              text: e,
                                                              textColor:
                                                                  Colors.black),
                                                          onTap: () async {
                                                            if (e ==
                                                                'Take photo') {
                                                              await selectImage(
                                                                      ImageSource
                                                                          .camera)
                                                                  .then(
                                                                      (value) async {
                                                                if (value !=
                                                                    null) {
                                                                  print(
                                                                      "value.path${value.path}");
                                                                  imageBytes =
                                                                      await File(
                                                                              value.path)
                                                                          .readAsBytes();
                                                                  setState(
                                                                      () {});
                                                                }
                                                              });
                                                              print(
                                                                  "nvtgfr$imageBytes");
                                                              Navigator.pop(
                                                                  context);

                                                              Navigator.push(
                                                                  context,
                                                                  PageRouteBuilder(
                                                                      pageBuilder: (context,
                                                                              a,
                                                                              b) =>
                                                                          PhotoPage(
                                                                            imageBytes:
                                                                                imageBytes,
                                                                          )));
                                                            } else if (e ==
                                                                'Select a photo') {
                                                              selectImage(
                                                                      ImageSource
                                                                          .gallery)
                                                                  .then(
                                                                      (value) async {
                                                                if (value !=
                                                                    null) {
                                                                  imageBytes =
                                                                      await File(
                                                                              value.path)
                                                                          .readAsBytes();
                                                                  setState(
                                                                      () {});
                                                                }
                                                              });

                                                              Navigator.push(
                                                                  context,
                                                                  PageRouteBuilder(
                                                                      pageBuilder: (context,
                                                                              a,
                                                                              b) =>
                                                                          PhotoPage(
                                                                            imageBytes:
                                                                                imageBytes,
                                                                          )));
                                                            }

                                                            setState(() {});
                                                          },
                                                        ),
                                                      ))
                                                  .toList(),
                                            ),
                                          );
                                        });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Card(
                              child: Column(
                                children: [
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
                                          text: 'Payment Info',
                                          textColor: Colors.grey.shade400),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                              pageBuilder: (context, a, b) =>
                                                  PaymentInfoPage()));
                                    },
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
                                          text: 'Signature',
                                          textColor: Colors.grey.shade400),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                              pageBuilder: (context, a, b) =>
                                                  SignaturePage()));
                                    },
                                  ),
                                  Container(
                                    height: 1,
                                    color: Colors.grey.shade300,
                                  ),
                                  InkWell(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 90,
                                      padding: EdgeInsets.only(left: 5, top: 6),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: customText(
                                          text: 'Notes',
                                          textColor: Colors.grey.shade400),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                              pageBuilder: (context, a, b) =>
                                                  AdditionalDetailsPage()));
                                    },
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
                                    height: 1,
                                    color: Colors.grey.shade300,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 30,
                                    padding: EdgeInsets.only(left: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Center(
                                              child: customText(
                                                  text: 'Request Review',
                                                  textColor: Colors.black),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 8.0, left: 3),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: blueColor,
                                                    border: Border.all(
                                                        color: blueColor)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: customText(
                                                    text: 'BETA',
                                                    fontsize: 9,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Switch(
                                            // thumb color (round icon)
                                            activeColor: blueColor,
                                            activeTrackColor: Colors.cyan,
                                            inactiveThumbColor:
                                                Colors.blueGrey.shade600,
                                            inactiveTrackColor:
                                                Colors.grey.shade400,
                                            splashRadius: 50.0,
                                            value: switched,
                                            onChanged: (value) {
                                              switched = !switched;
                                              setState(() {});
                                            })
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 1,
                                    color: Colors.grey.shade300,
                                  ),
                                  switched
                                      ? Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 30,
                                          padding:
                                              EdgeInsets.only(left: 5, top: 6),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: customText(
                                              text: 'Review link',
                                              textColor: Colors.grey.shade400),
                                        )
                                      : SizedBox(),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Card(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    customText(
                                        text: 'Mark paid',
                                        textColor: Colors.black),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 100,
                            )
                          ],
                        ),
                      ),
                      Container(),
                      Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: SpeedDial(
          icon: Icons.add,
          activeIcon: Icons.close,
          spacing: 3,

          mini: true,
          childPadding: const EdgeInsets.all(5),
          spaceBetweenChildren: 4,
          dialRoot: (ctx, open, toggleChildren) {
            return Container(
              decoration: BoxDecoration(
                color: blueColor,
                border: Border.all(color: blueColor, width: 2.0),
                shape: BoxShape.circle,
              ),
              // padding: EdgeInsets.all(2.0),

              child: IconButton(
                icon: const Icon(
                  Icons.send,
                  color: Colors.white,
                ),
                onPressed: toggleChildren,
              ),
            );
          },

          label: const Text("Open"),

          overlayOpacity: 0.4,
          onOpen: () => debugPrint('OPENING DIAL'),
          onClose: () => debugPrint('DIAL CLOSED'),

          heroTag: 'speed-dial-hero-tag',

          elevation: 8.0,
          animationCurve: Curves.elasticInOut,
          isOpenOnStart: false,
          shape: const StadiumBorder(),
          // childMargin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          children: [
            SpeedDialChild(
              child: const Icon(Icons.email),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              label: 'Email',
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, a, b) => EmailInvoicePage()));
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.description),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              label: 'Text',
              onTap: () {},
            ),
          ],
        ),
        bottomNavigationBar: BottomBar(
          currentIndex: 0,
        ));
  }
}
