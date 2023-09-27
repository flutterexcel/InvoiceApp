import 'package:flutter/material.dart';
import 'package:invoice_maker/appcolors.dart';
import 'package:invoice_maker/customWidgets/customText.dart';
import 'package:invoice_maker/customWidgets/customTextField.dart';

class DiscountPage extends StatefulWidget {
  const DiscountPage({super.key});

  @override
  State<DiscountPage> createState() => _DiscountPageState();
}

class _DiscountPageState extends State<DiscountPage> {
  List<String> discountList = [
    'No Discount',
    'Percentage',
    'Flat Amount',
    'Cancel',
  ];
  final TextEditingController percentageController =
      TextEditingController(text: '0');
  final TextEditingController amountController =
      TextEditingController(text: '0');
  bool showPercentage = false;
  bool showFlatAmount = false;
  String discount = 'No Discount';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: blueColor,
        title: const Text(
          "Discount",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          Card(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: showPercentage || showFlatAmount ? 70 : 30,
              padding: EdgeInsets.only(left: 5, top: 5, right: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customText(text: 'Discount:', textColor: Colors.black),
                        customText(text: discount, textColor: Colors.black),
                      ],
                    ),
                    onTap: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.white,
                          context: context,
                          builder: (BuildContext context) {
                            return SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: discountList
                                    .map((e) => Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: InkWell(
                                            child: customText(
                                                text: e,
                                                textColor: Colors.black),
                                            onTap: () {
                                              if (e == 'Percentage') {
                                                showPercentage = true;
                                                showFlatAmount = false;
                                                discount = e;
                                              } else if (e == 'Flat Amount') {
                                                showPercentage = false;
                                                showFlatAmount = true;
                                                discount = e;
                                              } else if (e == 'No Discount') {
                                                showPercentage = false;
                                                showFlatAmount = false;
                                                discount = e;
                                              }

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
                    height: showPercentage || showFlatAmount ? 20 : 1,
                  ),
                  showPercentage
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customText(
                                text: 'Percentage', textColor: Colors.black),
                            Container(
                              width: 30,
                              child: CustomTextField(
                                controller: percentageController,
                              ),
                            ),
                          ],
                        )
                      : SizedBox(),
                  showFlatAmount
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customText(text: 'Amount', textColor: Colors.black),
                            Container(
                              width: 30,
                              child: CustomTextField(
                                controller: amountController,
                              ),
                            ),
                          ],
                        )
                      : SizedBox()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
