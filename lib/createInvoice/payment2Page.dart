import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invoice_maker/appcolors.dart';
import 'package:invoice_maker/customWidgets/customDateTimePicker.dart';
import 'package:invoice_maker/customWidgets/customText.dart';
import 'package:invoice_maker/customWidgets/customTextField.dart';

class PaymentPage2 extends StatefulWidget {
  const PaymentPage2({super.key});

  @override
  State<PaymentPage2> createState() => _PaymentPage2State();
}

class _PaymentPage2State extends State<PaymentPage2> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController dateEditingController = TextEditingController();
  final TextEditingController notesEditingController = TextEditingController();
  List<String> paymentMethodsList = [
    'Cash',
    'Check',
    'Bank',
    'Credit card',
    'PayPal',
    'Other',
    'Cancel',
  ];
  String paymentMethod = 'Other';
  bool _canPop = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_canPop) {
          return true;
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text(
                  "Some fields contain invalid data. Would you like to keep editing or to discard the changes?"),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _canPop = true;
                    });
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: Text("DISCARD"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("EDIT"),
                ),
              ],
            ),
          );
          return false;
        }
      },
      child: Scaffold(
        backgroundColor: Color.fromRGBO(224, 224, 224, 1),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: blueColor,
          title: const Text(
            "Payment",
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
                    height: 125,
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
                            customText(text: 'Amount', textColor: Colors.black),
                            SizedBox(
                                width: 45,
                                child: CustomTextField(
                                  controller: amountController,
                                  labelText: '\$0.00',
                                ))
                          ],
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
                                  text: 'Payment method:',
                                  textColor: Colors.black),
                              customText(
                                  text: paymentMethod, textColor: Colors.black),
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
                                      children: paymentMethodsList
                                          .map((e) => Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: InkWell(
                                                  child: customText(
                                                      text: e,
                                                      textColor: Colors.black),
                                                  onTap: () {
                                                    paymentMethod = e;
                                                    Navigator.pop(context);

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
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          child: cupertinoDateTime(
                              context: context,
                              onlyDate: true,
                              dateEditingController: dateEditingController,
                              dateLabel: DateFormat('dd-MM-yyyy').format(
                                  DateTime.now().add(Duration(days: 3)))),
                          onTap: () {},
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
                      child: CustomTextField(
                    controller: notesEditingController,
                    labelText: 'Notes',
                  )),
                  onTap: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
