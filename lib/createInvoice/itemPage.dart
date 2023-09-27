// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:invoice_maker/appcolors.dart';
import 'package:invoice_maker/customWidgets/customButton.dart';
import 'package:invoice_maker/customWidgets/customText.dart';
import 'package:invoice_maker/customWidgets/customTextField.dart';
import 'package:invoice_maker/provider/invoiceProvider.dart';
import 'package:provider/provider.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  final TextEditingController descriptionEditingController =
      TextEditingController();
  final TextEditingController unitEditingController = TextEditingController();
  final TextEditingController unitCostEditingController =
      TextEditingController();
  final TextEditingController quantityEditingController =
      TextEditingController();
  final TextEditingController discountAmountEditingController =
      TextEditingController();
  final TextEditingController additionalDetailsEditingController =
      TextEditingController();
  bool switched = false;
  @override
  Widget build(BuildContext context) {
    var invoiceProvider = Provider.of<InvoiceProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: blueColor,
        title: const Text(
          "Item",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 397,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5, right: 5, top: 6),
                          child: SizedBox(
                              child: CustomTextField(
                            controller: descriptionEditingController,
                            labelText: 'Description',
                          )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(
                                  text: 'Unit Cost:', textColor: Colors.black),
                              SizedBox(
                                  width: 45,
                                  child: CustomTextField(
                                    controller: unitCostEditingController,
                                    labelText: '\$0.00',
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(
                                  text: 'Unit:', textColor: Colors.black),
                              SizedBox(
                                  width: 80,
                                  child: CustomTextField(
                                    controller: unitEditingController,
                                    labelText: 'hours, days',
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(
                                  text: 'Quantity:', textColor: Colors.black),
                              SizedBox(
                                  width: 20,
                                  child: CustomTextField(
                                    controller: quantityEditingController,
                                    labelText: '1',
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(
                                  text: 'Discount:', textColor: Colors.black),
                              InkWell(
                                child: customText(
                                    text: 'Percentage',
                                    textColor: Colors.black),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(
                                  text: 'Discount Amount:',
                                  textColor: Colors.black),
                              SizedBox(
                                  width: 20,
                                  child: CustomTextField(
                                    controller: discountAmountEditingController,
                                    labelText: '0%',
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 5,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customText(
                                  text: 'Taxable', textColor: Colors.black),
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
                                    // themeProvider.toggleTheme();
                                    switched = !switched;
                                    setState(() {});
                                  })
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width + 20,
                          height: 40,
                          padding: EdgeInsets.only(
                            left: 5,
                            right: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customText(
                                text: 'Total',
                              ),
                              customText(text: '\$0.0'),
                            ],
                          ),
                        ),
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
                width: MediaQuery.of(context).size.width,
                height: 90,
                padding: EdgeInsets.only(left: 5, top: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: InkWell(
                  child: Center(
                      child: Row(
                    children: [
                      CustomTextField(
                        controller: additionalDetailsEditingController,
                        labelText: 'Additional Details',
                      ),
                    ],
                  )),
                  onTap: () {},
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
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    padding: EdgeInsets.only(
                      left: 5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customText(
                            text: 'Save to "My Items"',
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
                              // themeProvider.toggleTheme();
                              switched = !switched;
                              setState(() {});
                            })
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            customButton(onPressed: () {
              invoiceProvider.setItemDetails(
                  additionalDetailss: additionalDetailsEditingController.text,
                  descriptionn: descriptionEditingController.text,
                  discountAmountt: discountAmountEditingController.text,
                  discountt: "",
                  quantityy: quantityEditingController.text,
                  saveToMyItemss: true,
                  taxablee: true,
                  totall: '',
                  unitCostt: unitCostEditingController.text,
                  unitt: unitEditingController.text);

              Navigator.pop(context);
            })
          ],
        ),
      ),
    );
  }
}
