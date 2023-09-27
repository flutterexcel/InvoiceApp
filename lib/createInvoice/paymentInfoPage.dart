import 'package:flutter/material.dart';
import 'package:invoice_maker/appcolors.dart';
import 'package:invoice_maker/customWidgets/customText.dart';
import 'package:invoice_maker/customWidgets/customTextField.dart';

class PaymentInfoPage extends StatefulWidget {
  const PaymentInfoPage({super.key});

  @override
  State<PaymentInfoPage> createState() => _PaymentInfoPageState();
}

class _PaymentInfoPageState extends State<PaymentInfoPage> {
  TextEditingController paypalEmailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: blueColor,
        title: const Text(
          "Payment Info",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
            child: customText(
                text: 'Do not enter sensitive information',
                textColor: Colors.black),
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
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                    color: Colors.grey,
                  ),
                  child: Center(
                      child: Row(
                    children: [
                      customText(text: 'Paypal email'),
                    ],
                  )),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    padding: EdgeInsets.only(
                      left: 5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: CustomTextField(
                        controller: paypalEmailController,
                        labelText: 'Enter your paypal email address',
                      ),
                    )),
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
                  height: 30,
                  padding: EdgeInsets.only(
                    left: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                    color: Colors.grey,
                  ),
                  child: Center(
                      child: Row(
                    children: [
                      customText(text: 'Make checks payable to'),
                    ],
                  )),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    padding: EdgeInsets.only(
                      left: 5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: CustomTextField(
                        controller: paypalEmailController,
                        labelText: "Your or your business's name",
                      ),
                    )),
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
                  height: 30,
                  padding: EdgeInsets.only(
                    left: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                    color: Colors.grey,
                  ),
                  child: Center(
                      child: Row(
                    children: [
                      customText(text: 'Payment Instructions'),
                    ],
                  )),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    padding: EdgeInsets.only(
                      left: 5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: CustomTextField(
                        controller: paypalEmailController,
                        labelText:
                            "Specify instructions for payments or deposits",
                      ),
                    )),
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
                  height: 30,
                  padding: EdgeInsets.only(
                    left: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                    color: Colors.grey,
                  ),
                  child: Center(
                      child: Row(
                    children: [
                      customText(text: 'Other'),
                    ],
                  )),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    padding: EdgeInsets.only(
                      left: 5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: CustomTextField(
                        controller: paypalEmailController,
                        labelText: "Additional payment instructions",
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
