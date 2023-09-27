// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_is_empty

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:invoice_maker/appcolors.dart';
import 'package:invoice_maker/customWidgets/customText.dart';
import 'package:invoice_maker/customWidgets/customTextField.dart';
import 'package:invoice_maker/models/createInvoiceModel.dart';
import 'package:permission_handler/permission_handler.dart';

class EmailInvoicePage extends StatefulWidget {
  const EmailInvoicePage({super.key});

  @override
  State<EmailInvoicePage> createState() => _EmailInvoicePageState();
}

class _EmailInvoicePageState extends State<EmailInvoicePage> {
  final TextEditingController emailInvoiceEditingController =
      TextEditingController();
  final TextEditingController toEditingController = TextEditingController();
  bool switched = true;

  ClientModel? clientModel;
  Contact? selectedContact;

  Future<void> openContactPicker() async {
    final status = await Permission.contacts.request();
    if (status.isGranted) {
      final contact = await ContactsService.openDeviceContactPicker();
      setState(() {
        selectedContact = contact;
        if (selectedContact != null) {
          if (selectedContact!.emails!.length > 0) {
            toEditingController.text = selectedContact!.emails!.first.value!;
            setState(() {});
          } else {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text("No Email Addresses"),
                      content: Text(
                          "We could not find any email addresses for ${selectedContact!.displayName}"),
                      actions: [
                        TextButton(
                          child: Text("OK"),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ));
          }
        }
        print('_selectedContact${selectedContact!.displayName}');
      });
    } else {
      print('Permission denied');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: blueColor,
        title: const Text(
          "Email Invoice",
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
                    height: 100,
                    // padding: EdgeInsets.only(left: 5, right: 5, top: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5)),
                    ),
                    child: Column(
                      children: [
                        Card(
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 30,
                                padding: EdgeInsets.only(left: 5, right: 6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    customText(
                                      text: 'Balance Due',
                                    ),
                                    customText(text: '\$0.00'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 30,
                          padding: EdgeInsets.only(left: 5, top: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 100,
                                  child: CustomTextField(
                                    controller: toEditingController,
                                    labelText: "To",
                                  ),
                                ),
                                InkWell(
                                    child: Icon(Icons.add),
                                    onTap: () {
                                      openContactPicker();
                                    })
                              ],
                            ),
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
            Padding(
              padding: EdgeInsets.only(
                left: 5,
                right: 5,
              ),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  padding: EdgeInsets.only(top: 6, left: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: CustomTextField(
                    controller: emailInvoiceEditingController,
                    labelText: "Message (optional)",
                  )),
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
                    padding: EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: customText(
                              text: 'Save message as default',
                              textColor: Colors.black),
                        ),
                        Switch(
                            // thumb color (round icon)
                            activeColor: blueColor,
                            activeTrackColor: Colors.cyan,
                            inactiveThumbColor: Colors.blueGrey.shade600,
                            inactiveTrackColor: Colors.grey.shade400,
                            splashRadius: 50.0,
                            value: switched,
                            onChanged: (value) {
                              switched = !switched;
                              setState(() {});
                            })
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
