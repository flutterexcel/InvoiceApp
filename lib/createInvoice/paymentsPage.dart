import 'package:flutter/material.dart';
import 'package:invoice_maker/appcolors.dart';
import 'package:invoice_maker/createInvoice/payment2Page.dart';
import 'package:invoice_maker/customWidgets/customText.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(224, 224, 224, 1),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: blueColor,
        title: const Text(
          "Payments",
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
                  height: 30,
                  padding: EdgeInsets.only(left: 5, right: 5),
                  decoration: BoxDecoration(color: Colors.grey),
                  child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customText(
                          text: 'Total',
                        ),
                        customText(
                          text: '\$0.00',
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customText(
                            text: 'Add Payment',
                            textColor: Colors.grey.shade400),
                        customText(
                            text: '\$0.00', textColor: Colors.grey.shade400),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (context, a, b) => PaymentPage2()));
                  },
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 30,
                  padding: EdgeInsets.only(left: 5, right: 5),
                  decoration: BoxDecoration(color: Colors.grey),
                  child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customText(
                          text: 'Paid',
                        ),
                        customText(
                          text: '\$0.00',
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customText(
                            text: 'Balance Due',
                            textColor: Colors.grey.shade400),
                        customText(
                            text: '\$0.00', textColor: Colors.grey.shade400),
                      ],
                    ),
                    onTap: () {},
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
