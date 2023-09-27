// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:invoice_maker/appcolors.dart';
import 'package:invoice_maker/customWidgets/customButton.dart';
import 'package:invoice_maker/customWidgets/customDateTimePicker.dart';
import 'package:invoice_maker/customWidgets/customText.dart';
import 'package:invoice_maker/customWidgets/customTextField.dart';
import 'package:invoice_maker/provider/invoiceProvider.dart';
import 'package:provider/provider.dart';

class InvoiceNumberPage extends StatefulWidget {
  @override
  State<InvoiceNumberPage> createState() => _InvoiceNumberPageState();
}

class _InvoiceNumberPageState extends State<InvoiceNumberPage> {
  TextEditingController invoiceController =
      TextEditingController(text: 'INV0001');
  TextEditingController poNumberController = TextEditingController();
  final TextEditingController dateEditingController = TextEditingController();
  final TextEditingController dueDateEditingController =
      TextEditingController();
  List<String> termsList = [
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
  String terms = '3 Days';

  @override
  Widget build(BuildContext context) {
    var invoiceProvider = Provider.of<InvoiceProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: blueColor,
        title: const Text(
          "Invoice Number",
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
                  height: 220,
                  padding: EdgeInsets.only(left: 5, right: 5, top: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customText(
                              text: 'Invoice Number:', textColor: Colors.black),
                          SizedBox(
                              width: 60,
                              child: CustomTextField(
                                controller: invoiceController,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        child: cupertinoDateTime(
                            context: context,
                            onlyDate: true,
                            dateEditingController: dateEditingController,
                            dateLabel: DateFormat('dd-MM-yyyy')
                                .format(DateTime.now())),
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText(text: 'Terms', textColor: Colors.black),
                            customText(text: terms, textColor: Colors.black),
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
                                          children: termsList
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
                                                        terms = e;
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
                      InkWell(
                        child: cupertinoDateTime(
                            context: context,
                            onlyDate: true,
                            labelText: 'Due Date:',
                            dateEditingController: dueDateEditingController,
                            dateLabel: DateFormat('dd-MM-yyyy')
                                .format(DateTime.now().add(Duration(days: 3)))),
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customText(
                              text: 'PO Number:', textColor: Colors.black),
                          SizedBox(
                              width: 60,
                              child: CustomTextField(
                                controller: poNumberController,
                              ))
                        ],
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
            height: 100,
          ),
          customButton(onPressed: () {
            invoiceProvider.setInvoiceNumberDetails(
                datee: dateEditingController.text,
                dueDatee: dueDateEditingController.text,
                invoiceNumberr: invoiceController.text,
                poNumberr: poNumberController.text,
                termss: terms);

            Navigator.pop(context);
          })
        ],
      ),
    );
  }
}
