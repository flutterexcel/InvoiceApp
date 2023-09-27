// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invoice_maker/models/createInvoiceModel.dart';

class InvoiceProvider extends ChangeNotifier {
  String? clientName;
  String? email;
  String? mobile;
  String? phone;
  String? fax;
  String? contact;
  String? address1;
  String? address2;
  String? invoiceNumber;
  String? date;
  String? terms;
  String? dueDate;
  String? poNumber;
  String? businessLogo;
  String? businessName;
  String? businessOwnerName;
  String? businessNumber;
  String? addressLine1;
  String? addressLine2;
  String? addressLine3;
  String? businessEmail;
  String? businessPhone;
  String? businessMobile;
  String? website;

  String? description;
  String? unitCost;
  String? unit;
  String? quantity;
  String? discount;
  String? discountAmount;
  bool? taxable;
  String? total;
  String? additionalDetails;
  bool? saveToMyItems;
  setClientDetails({
    String? clientNamee,
    String? emaill,
    String? mobilee,
    String? phonee,
    String? faxx,
    String? contactt,
    String? address11,
    String? address22,
  }) {
    clientName = clientNamee;
    email = emaill;
    mobile = mobilee;
    phone = phonee;
    fax = faxx;
    contact = contactt;
    address1 = address11;
    address2 = address22;
    var clientDetails = ClientModel(
            address1: address1,
            address2: address2,
            clientName: clientName,
            contact: contact,
            email: email,
            fax: fax,
            mobile: mobile,
            phone: phone)
        .toMap();

    FirebaseFirestore.instance
        .collection('profile')
        .doc('1')
        .update({"clientDetails": clientDetails});
    notifyListeners();
  }

  setInvoiceNumberDetails({
    String? invoiceNumberr,
    String? datee,
    String? termss,
    String? dueDatee,
    String? poNumberr,
  }) {
    if (datee == '') {
      datee = DateTime.now().toIso8601String();
    }
    invoiceNumber = invoiceNumberr;
    date = datee;
    terms = termss;
    dueDate = dueDatee;
    poNumber = poNumberr;

    var invoiceDetails = InvoiceModel(
      invoiceNumber: invoiceNumberr,
      date: datee,
      terms: termss,
      dueDate: dueDatee,
      poNumber: poNumberr,
    ).toMap();
    FirebaseFirestore.instance
        .collection('profile')
        .doc('1')
        .update({"invoiceNumber": invoiceDetails});
    print("nubvytf$date");
    notifyListeners();
  }

  setBusinessDetails({
    String? businessLogoo,
    String? businessNamee,
    String? businessOwnerNamee,
    String? businessNumberr,
    String? addressLine11,
    String? addressLine22,
    String? addressLine33,
    String? emaill,
    String? phonee,
    String? mobilee,
    String? websitee,
  }) {
    businessLogo = businessLogoo;
    businessName = businessNamee;
    businessOwnerName = businessOwnerNamee;
    businessNumber = businessNumberr;
    addressLine1 = addressLine11;
    addressLine2 = addressLine22;
    addressLine3 = addressLine33;
    businessEmail = emaill;
    businessPhone = phonee;
    businessMobile = mobilee;
    website = websitee;

    var businessDetails = BusinessDetails(
            addressLine1: addressLine11,
            addressLine2: addressLine22,
            addressLine3: addressLine33,
            businessLogo: businessLogoo,
            businessName: businessNamee,
            businessNumber: businessNumberr,
            businessOwnerName: businessOwnerNamee,
            email: emaill,
            mobile: mobilee,
            phone: phonee,
            website: websitee)
        .toMap();
    FirebaseFirestore.instance
        .collection('profile')
        .doc('1')
        .update({"businessDetails": businessDetails});

    notifyListeners();
  }

  setItemDetails({
    String? descriptionn,
    String? unitCostt,
    String? unitt,
    String? quantityy,
    String? discountt,
    String? discountAmountt,
    bool? taxablee,
    String? totall,
    String? additionalDetailss,
    bool? saveToMyItemss,
  }) {
    description = descriptionn;
    unitCost = unitCost;
    unit = unitt;
    quantity = quantityy;
    discount = discountt;
    discountAmount = discountAmountt;
    taxable = taxablee;
    total = totall;
    additionalDetails = additionalDetailss;
    saveToMyItems = saveToMyItemss;

    var itemPage = ItemPageModel(
            additionalDetailss: additionalDetails,
            descriptionn: description,
            discountAmountt: discountAmount,
            discountt: discount,
            quantityy: quantity,
            saveToMyItemss: saveToMyItems,
            taxablee: taxable,
            totall: total,
            unitCostt: unitCost,
            unitt: unit)
        .toMap();

    FirebaseFirestore.instance
        .collection('profile')
        .doc('1')
        .update({"itemPage": itemPage});
    notifyListeners();
  }
}
