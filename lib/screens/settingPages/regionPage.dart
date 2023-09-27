// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invoice_maker/appcolors.dart';
import 'package:invoice_maker/customWidgets/customDateTimePicker.dart';
import 'package:invoice_maker/customWidgets/customText.dart';
import 'package:invoice_maker/customWidgets/customTextField.dart';
import 'package:invoice_maker/splashScreen.dart';

class RegionPage extends StatefulWidget {
  const RegionPage({super.key});

  @override
  State<RegionPage> createState() => _RegionPageState();
}

class _RegionPageState extends State<RegionPage> {
  String locale = 'English (US)';
  String taxYear = 'January';
  String currency = 'USD';
  String dateFormat = 'dd-MM-yyyy';
  List<String> taxYearList = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
    'Cancel'
  ];
  List<String> dateFormatList = [
    'yyyy-MM-dd (2023-09-27)',
    'dd-MM-yyyy (27-09-2023)',
    'MM-dd-yyyy (09-27-2023)',
    'yyyy/MM/dd (2023/09/27)',
    'dd/MM/yyyy (27/09/2023)',
    'MM/dd/yyyy (09/27/2023)',
    'yyyy.MM.dd (2023.09.27)',
    'dd.MM.yyyy (27.09.2023)',
    'MM.dd.yyyy (09.27.2023)',
    'MMM d, yyyy (Sep 27, 2023)',
    'd MMM yyyy (27 Sep 2023)',
    'Cancel'
  ];
  List<String> currencyLists = [
    'AUD',
    'GBP',
    'EUR',
    'JPY',
    'CHF',
    'USD',
    'AFN',
    'ALL',
    'DZD',
    'AOA',
    'ARS',
    'AMD',
    'AWG',
    'ATS(EURO)',
    'BEF(EURO)',
    'AZN',
    'BSD',
    'BHD',
    'BDT',
    'BBD',
    'BYR',
    'BZD',
    'BMD',
    'BTN',
    'BOB',
    'BAM',
    'BWP',
    'BRL',
    'GBP',
    'BND',
    'BGN',
    'BIF',
    'XOF',
    'XAF',
    'XPF',
    'KHR',
    'CAD',
    'CVE',
    'KYD',
    'CLP',
    'CNY',
    'COP',
    'KMF',
    'CDF',
    'CRC',
    'HRK',
    'CUC',
    'CUP',
    'CYP(EURO)',
    'CZK',
    'DKK',
    'DJF',
    'DCP',
    'XCD',
    'EGP',
    'SVC',
    'EEK(EURO)',
    'ETB',
    'EUR',
    'FKP',
    'FIM(EURO)',
    'FJD',
    'GMD',
    'GEL',
    'DMK(EURO)',
    'GHS',
    'GIP',
    'GRD(EURO)',
    'GTQ',
    'GNF',
    'GYD',
    'HTG',
    'HNL',
    'HKD',
    'HUF',
    'ISK',
    'INR',
    'IDR',
    'IRR',
    'IQD',
    'IED(EURO)',
    'ILS',
    'ITL(EURO)',
    'JMD',
    'JPY',
    'JOD',
    'KZT',
    'KES',
    'KWD',
    'KGS',
    'LAK',
    'LVL',
    'LBP',
    'LSL',
    'LRD',
    'LYD',
    'LTD',
    'LTL(EURO)',
    'LUF(EURO)',
    'MOP',
    'MKD',
    'MGA',
    'MWK',
    'MYR',
    'MVR',
    'MTL(EURO)',
    'MRO',
    'MUR',
    'MXN',
    'MDL',
    'MNT',
    'MAD',
    'MZN',
    'MMK',
    'ANG',
    'NAD',
    'NPR',
    'NLG(EURO)',
    'NZD',
    'NIO',
    'NGN',
    'KPW',
    'NOK',
    'OMR',
    'PKR',
    'PAB',
    'SGD',
    'SCR',
    'SLL',
    'SKK(EURO)',
    'SIT(EURO)',
    'SBD',
    'SOS',
    'ZAR',
    'KRW',
    'ESP(EURO)',
    'LKR',
    'SHP',
    'SDG',
    'SRD',
    'SZL',
    'SEK',
    'CHF',
    'SYP',
    'TWD',
    'TZS',
    'THB',
    'TOP',
    'TTD',
    'TND',
    'TRY',
    'TMM',
    'UGX',
    'UAH',
    'UYU',
    'AED',
    'VUV',
    'VEB',
    'VND',
    'YER',
    'ZMK',
    "ZWD",
  ];
  List<String> localeList = [
    'None',
    'Custom',
    'Due on receipt',
    'Next Day',
    '2 Days',
    '3 Days',
    '4 Days',
    '5 Days',
    '6 Days',
    '7 Days',
    '10 Days',
    '14 Days',
    '21 Days',
    '30 Days',
    '45 Days',
    '60 Days',
    '90 Days',
    '120 Days',
    '180 Days',
    '365 Days',
    'Cancel'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(224, 224, 224, 1),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: blueColor,
        title: const Text(
          "Region",
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
                  height: 150,
                  padding: EdgeInsets.only(left: 5, right: 5, top: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                  ),
                  child: Column(
                    children: [
                      InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText(
                                text: 'Locale:', textColor: Colors.black),
                            customText(text: locale, textColor: Colors.black),
                          ],
                        ),
                        onTap: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.white,
                              context: context,
                              isScrollControlled: true,
                              isDismissible: true,
                              builder: (BuildContext context) {
                                return DraggableScrollableSheet(
                                    initialChildSize: 1, //set this as you want
                                    // maxChildSize: 1, //set this as you want
                                    // minChildSize: 1, //set this as you want
                                    expand: true,
                                    builder: (context, scrollController) {
                                      return SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: localeList
                                              .map((e) => Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12.0),
                                                    child: InkWell(
                                                      child: customText(
                                                          text: e,
                                                          textColor:
                                                              Colors.black),
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        locale = e;
                                                        setState(() {});
                                                      },
                                                    ),
                                                  ))
                                              .toList(),
                                        ),
                                      ); //whatever you're returning, does not have to be a Container
                                    });
                              });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText(
                                text: 'Tax year begins:',
                                textColor: Colors.black),
                            customText(text: taxYear, textColor: Colors.black),
                          ],
                        ),
                        onTap: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.white,
                              context: context,
                              isScrollControlled: true,
                              isDismissible: true,
                              builder: (BuildContext context) {
                                return DraggableScrollableSheet(
                                    initialChildSize: 1, //set this as you want
                                    // maxChildSize: 1, //set this as you want
                                    // minChildSize: 1, //set this as you want
                                    expand: true,
                                    builder: (context, scrollController) {
                                      return SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: taxYearList
                                              .map((e) => Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12.0),
                                                    child: InkWell(
                                                      child: customText(
                                                          text: e,
                                                          textColor:
                                                              Colors.black),
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        taxYear = e;
                                                        setState(() {});
                                                      },
                                                    ),
                                                  ))
                                              .toList(),
                                        ),
                                      ); //whatever you're returning, does not have to be a Container
                                    });
                              });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText(
                                text: 'Currency:', textColor: Colors.black),
                            customText(text: currency, textColor: Colors.black),
                          ],
                        ),
                        onTap: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.white,
                              context: context,
                              isScrollControlled: true,
                              isDismissible: true,
                              builder: (BuildContext context) {
                                return DraggableScrollableSheet(
                                    initialChildSize: 1, //set this as you want
                                    // maxChildSize: 1, //set this as you want
                                    // minChildSize: 1, //set this as you want
                                    expand: true,
                                    builder: (context, scrollController) {
                                      return SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: currencyLists
                                              .map((e) => Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12.0),
                                                    child: InkWell(
                                                      child: customText(
                                                          text: e,
                                                          textColor:
                                                              Colors.black),
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        currency = e;

                                                        setState(() {});
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (context) =>
                                                                    AlertDialog(
                                                                      title: Text(
                                                                          "Currency Updated"),
                                                                      content: Text(
                                                                          "All your Invoices and Estimates changed to $currency"),
                                                                      actions: [
                                                                        TextButton(
                                                                          child:
                                                                              Text("CONTINUE"),
                                                                          onPressed:
                                                                              () async {
                                                                            Navigator.pop(context);
                                                                          },
                                                                        )
                                                                      ],
                                                                    ));
                                                      },
                                                    ),
                                                  ))
                                              .toList(),
                                        ),
                                      ); //whatever you're returning, does not have to be a Container
                                    });
                              });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText(
                                text: 'Date Format:', textColor: Colors.black),
                            customText(
                                text: dateFormat, textColor: Colors.black),
                          ],
                        ),
                        onTap: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.white,
                              context: context,
                              isScrollControlled: true,
                              isDismissible: true,
                              builder: (BuildContext context) {
                                return DraggableScrollableSheet(
                                    initialChildSize: 1,
                                    expand: true,
                                    builder: (context, scrollController) {
                                      return SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: dateFormatList
                                              .map((e) => Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12.0),
                                                    child: InkWell(
                                                      child: customText(
                                                          text: e,
                                                          textColor:
                                                              Colors.black),
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        dateFormat = e;

                                                        setState(() {});
                                                      },
                                                    ),
                                                  ))
                                              .toList(),
                                        ),
                                      ); //whatever you're returning, does not have to be a Container
                                    });
                              });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
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
                  child: customText(text: 'Preview'),
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
                      customText(text: 'Text:', textColor: Colors.black),
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: customText(
                            text: 'Invoice', textColor: Colors.black),
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
                      customText(text: 'Date:', textColor: Colors.black),
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: customText(
                            text: '27-09-2023', textColor: Colors.black),
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
                      customText(text: 'Currency:', textColor: Colors.black),
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: customText(
                            text: '\$12,345.67', textColor: Colors.black),
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
