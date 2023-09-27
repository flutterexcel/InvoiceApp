// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors, file_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:invoice_maker/appcolors.dart';
import 'package:invoice_maker/customWidgets/customTextField.dart';

class PhotoPage extends StatefulWidget {
  Uint8List? imageBytes;
  PhotoPage({this.imageBytes});
  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  final TextEditingController additionalDetailsEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: blueColor,
        title: const Text(
          "Photo",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(children: [
        Card(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: 125,
              padding: EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              ),
              child: Image.memory(
                widget.imageBytes!,
              )),
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
            child: Center(
                child: CustomTextField(
              controller: additionalDetailsEditingController,
              labelText: 'Additional Details',
            )),
          ),
        ),
      ]),
    );
  }
}
