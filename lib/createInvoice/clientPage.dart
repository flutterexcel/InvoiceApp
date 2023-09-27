// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:invoice_maker/appcolors.dart';
import 'package:invoice_maker/customWidgets/customButton.dart';
import 'package:invoice_maker/customWidgets/customText.dart';
import 'package:invoice_maker/customWidgets/customTextField.dart';
import 'package:invoice_maker/models/createInvoiceModel.dart';
import 'package:invoice_maker/provider/invoiceProvider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  final TextEditingController clientNameEditingController =
      TextEditingController();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController mobileEditingController = TextEditingController();
  final TextEditingController phoneEditingController = TextEditingController();
  final TextEditingController faxEditingController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController address3Controller = TextEditingController();

  Contact? _selectedContact;
  ClientModel? clientModel;

  Future<void> _openContactPicker() async {
    final status = await Permission.contacts.request();
    if (status.isGranted) {
      final contact = await ContactsService.openDeviceContactPicker();
      setState(() {
        _selectedContact = contact;
        if (_selectedContact != null) {
          clientNameEditingController.text = _selectedContact!.displayName!;
          mobileEditingController.text =
              _selectedContact!.phones![0].value ?? '';
        }
        print('_selectedContact${_selectedContact!.displayName}');
      });
    } else {
      print('Permission denied');
    }
  }

  @override
  Widget build(BuildContext context) {
    var invoiceProvider = Provider.of<InvoiceProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: blueColor,
        title: const Text(
          "Client",
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
                    height: 235,
                    padding: EdgeInsets.only(left: 5, right: 5, top: 6),
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
                        SizedBox(
                            child: CustomTextField(
                          controller: clientNameEditingController,
                          labelText: 'Client Name',
                        )),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                            child: CustomTextField(
                          controller: emailEditingController,
                          labelText: 'Email',
                        )),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText(text: 'Mobile', textColor: Colors.black),
                            SizedBox(
                                width: 113,
                                child: CustomTextField(
                                  controller: mobileEditingController,
                                  labelText: 'Mobile Number',
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText(text: 'Phone', textColor: Colors.black),
                            SizedBox(
                                width: 100,
                                child: CustomTextField(
                                  controller: phoneEditingController,
                                  labelText: 'Phone Number',
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText(text: 'Fax', textColor: Colors.black),
                            SizedBox(
                                width: 85,
                                child: CustomTextField(
                                  controller: faxEditingController,
                                  labelText: 'Fax Number',
                                ))
                          ],
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
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: CustomTextField(
                        controller: contactController,
                        labelText: 'Contact',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: CustomTextField(
                        controller: address1Controller,
                        labelText: 'Address 1',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: CustomTextField(
                        controller: address2Controller,
                        labelText: 'Address 2',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: CustomTextField(
                        controller: address3Controller,
                        labelText: 'Address 3',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            InkWell(
                child: Card(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customText(
                            text: 'Import from contacts',
                            textColor: Colors.black),
                      ],
                    ),
                  ),
                ),
                onTap: _openContactPicker),
            SizedBox(
              height: 5,
            ),
            Card(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: blueColor)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customText(
                        text: 'Generate Statement', textColor: blueColor),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            customButton(onPressed: () {
              invoiceProvider.setClientDetails(
                  clientNamee: clientNameEditingController.text,
                  emaill: emailEditingController.text,
                  mobilee: mobileEditingController.text,
                  phonee: phoneEditingController.text,
                  faxx: faxEditingController.text,
                  contactt: contactController.text,
                  address11: address1Controller.text,
                  address22: address2Controller.text);

              Navigator.pop(context);
            })
          ],
        ),
      ),
    );
  }
}
