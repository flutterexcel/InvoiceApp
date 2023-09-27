import 'package:flutter/material.dart';
import 'package:invoice_maker/appcolors.dart';
import 'package:invoice_maker/customWidgets/customText.dart';
import 'package:invoice_maker/customWidgets/customTextField.dart';

class TaxPage extends StatefulWidget {
  const TaxPage({super.key});

  @override
  State<TaxPage> createState() => _TaxPageState();
}

class _TaxPageState extends State<TaxPage> {
  List<String> taxList = [
    'None',
    'On The Total',
    'Deducted',
    'Per Item',
    'Cancel',
  ];
  final TextEditingController labelController =
      TextEditingController(text: 'GST');
  final TextEditingController rateController =
      TextEditingController(text: '18');
  bool showLabelNRate = false;
  bool showOnlyLabel = false;
  String tax = 'None';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: blueColor,
        title: const Text(
          "Tax",
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
              height: showOnlyLabel
                  ? 70
                  : showLabelNRate
                      ? 105
                      : 30,
              padding: EdgeInsets.only(left: 5, top: 7, right: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customText(text: 'Tax:', textColor: Colors.black),
                        customText(text: tax, textColor: Colors.black),
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
                                children: taxList
                                    .map((e) => Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: InkWell(
                                            child: customText(
                                                text: e,
                                                textColor: Colors.black),
                                            onTap: () {
                                              if (e == 'On The Total') {
                                                showLabelNRate = true;
                                                tax = e;
                                              } else if (e == 'Deducted') {
                                                showLabelNRate = true;
                                                tax = e;
                                              } else if (e == 'Per Item') {
                                                showOnlyLabel = true;
                                                showLabelNRate = false;
                                                tax = e;
                                              } else if (e == 'None') {
                                                tax = e;
                                                showLabelNRate = false;
                                                showOnlyLabel = false;
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
                    height: showLabelNRate || showOnlyLabel ? 20 : 1,
                  ),
                  showLabelNRate || showOnlyLabel
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customText(text: 'Label:', textColor: Colors.black),
                            Container(
                              width: 30,
                              child: CustomTextField(
                                controller: labelController,
                              ),
                            ),
                          ],
                        )
                      : SizedBox(),
                  SizedBox(
                    height: showLabelNRate ? 20 : 1,
                  ),
                  showLabelNRate
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customText(text: 'Rate:', textColor: Colors.black),
                            Container(
                              width: 30,
                              child: CustomTextField(
                                controller: rateController,
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
