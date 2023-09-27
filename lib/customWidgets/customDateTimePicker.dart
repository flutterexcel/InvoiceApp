// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:invoice_maker/appcolors.dart';
import 'package:invoice_maker/customWidgets/customText.dart';

Widget cupertinoDateTime(
    {required BuildContext context,
    TextEditingController? dateEditingController,
    Color color = Colors.black,
    bool onlyDate = false,
    double horizontalPadding = 0.0,
    String labelText = 'Date:',
    String? dateLabel}) {
  return StatefulBuilder(builder: (context, setState) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            isDismissible: true,
            context: context,
            builder: (context) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: customText(
                                text: "Cancel",
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                if (dateEditingController.text == dateLabel) {
                                  setState(() {
                                    dateEditingController.text = DateTime.now()
                                        .toUtc()
                                        .toIso8601String();
                                  });
                                }
                              },
                              child: customText(
                                text: "Done",
                              ))
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      color: orangeColor,
                    ),
                    Container(
                      child: CupertinoDatePicker(
                        onDateTimeChanged: (dateTime) {
                          setState(() {
                            dateEditingController.text =
                                dateTime.toIso8601String();
                          });
                        },
                        mode: onlyDate
                            ? CupertinoDatePickerMode.date
                            : CupertinoDatePickerMode.dateAndTime,
                        initialDateTime: DateTime.now(),
                        minimumDate: DateTime(2000),
                        maximumDate: DateTime.now().add(Duration(days: 365)),
                      ),
                      constraints: BoxConstraints(maxHeight: 280.0),
                    ),
                  ],
                ));
      },
      child: Container(
        height: 50,
        // padding:
        //     EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 15.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white, width: 1.5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customText(
              text: labelText,
              textColor: color,
            ),
            customText(
              text:
                  '${dateEditingController!.text == dateLabel || dateEditingController.text == "" ? dateLabel : DateFormat(onlyDate ? 'MM/dd/yyyy' : 'MM/dd/yyyy, hh:mm a').format(DateTime.parse(dateEditingController.text))}',
              textColor: color,
            ),
          ],
        ),
      ),
    );
  });
}
