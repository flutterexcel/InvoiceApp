// ignore_for_file: file_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class BusinessDetails {
  String? businessLogo;
  String? businessName;
  String? businessOwnerName;
  String? businessNumber;
  String? addressLine1;
  String? addressLine2;
  String? addressLine3;
  String? email;
  String? phone;
  String? mobile;
  String? website;
  BusinessDetails({
    this.businessLogo,
    this.businessName,
    this.businessOwnerName,
    this.businessNumber,
    this.addressLine1,
    this.addressLine2,
    this.addressLine3,
    this.email,
    this.phone,
    this.mobile,
    this.website,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'businessLogo': businessLogo,
      'businessName': businessName,
      'businessOwnerName': businessOwnerName,
      'businessNumber': businessNumber,
      'addressLine1': addressLine1,
      'addressLine2': addressLine2,
      'addressLine3': addressLine3,
      'email': email,
      'phone': phone,
      'mobile': mobile,
      'website': website,
    };
  }

  factory BusinessDetails.fromMap(Map<String, dynamic> map) {
    return BusinessDetails(
      businessLogo:
          map['businessLogo'] != null ? map['businessLogo'] as String : null,
      businessName:
          map['businessName'] != null ? map['businessName'] as String : null,
      businessOwnerName: map['businessOwnerName'] != null
          ? map['businessOwnerName'] as String
          : null,
      businessNumber: map['businessNumber'] != null
          ? map['businessNumber'] as String
          : null,
      addressLine1:
          map['addressLine1'] != null ? map['addressLine1'] as String : null,
      addressLine2:
          map['addressLine2'] != null ? map['addressLine2'] as String : null,
      addressLine3:
          map['addressLine3'] != null ? map['addressLine3'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      mobile: map['mobile'] != null ? map['mobile'] as String : null,
      website: map['website'] != null ? map['website'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BusinessDetails.fromJson(String source) =>
      BusinessDetails.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ItemPageModel {
  String? descriptionn;
  String? unitCostt;
  String? unitt;
  String? quantityy;
  String? discountt;
  String? discountAmountt;
  bool? taxablee;
  String? totall;
  String? additionalDetailss;
  bool? saveToMyItemss;
  ItemPageModel({
    this.descriptionn,
    this.unitCostt,
    this.unitt,
    this.quantityy,
    this.discountt,
    this.discountAmountt,
    this.taxablee,
    this.totall,
    this.additionalDetailss,
    this.saveToMyItemss,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'descriptionn': descriptionn,
      'unitCostt': unitCostt,
      'unitt': unitt,
      'quantityy': quantityy,
      'discountt': discountt,
      'discountAmountt': discountAmountt,
      'taxablee': taxablee,
      'totall': totall,
      'additionalDetailss': additionalDetailss,
      'saveToMyItemss': saveToMyItemss,
    };
  }

  factory ItemPageModel.fromMap(Map<String, dynamic> map) {
    return ItemPageModel(
      descriptionn:
          map['descriptionn'] != null ? map['descriptionn'] as String : null,
      unitCostt: map['unitCostt'] != null ? map['unitCostt'] as String : null,
      unitt: map['unitt'] != null ? map['unitt'] as String : null,
      quantityy: map['quantityy'] != null ? map['quantityy'] as String : null,
      discountt: map['discountt'] != null ? map['discountt'] as String : null,
      discountAmountt: map['discountAmountt'] != null
          ? map['discountAmountt'] as String
          : null,
      taxablee: map['taxablee'] != null ? map['taxablee'] as bool : null,
      totall: map['totall'] != null ? map['totall'] as String : null,
      additionalDetailss: map['additionalDetailss'] != null
          ? map['additionalDetailss'] as String
          : null,
      saveToMyItemss:
          map['saveToMyItemss'] != null ? map['saveToMyItemss'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemPageModel.fromJson(String source) =>
      ItemPageModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ClientModel {
  String? clientName;
  String? email;
  String? mobile;
  String? phone;
  String? fax;
  String? contact;
  String? address1;
  String? address2;
  ClientModel({
    this.clientName,
    this.email,
    this.mobile,
    this.phone,
    this.fax,
    this.contact,
    this.address1,
    this.address2,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'clientName': clientName,
      'email': email,
      'mobile': mobile,
      'phone': phone,
      'fax': fax,
      'contact': contact,
      'address1': address1,
      'address2': address2,
    };
  }

  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      clientName:
          map['clientName'] != null ? map['clientName'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      mobile: map['mobile'] != null ? map['mobile'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      fax: map['fax'] != null ? map['fax'] as String : null,
      contact: map['contact'] != null ? map['contact'] as String : null,
      address1: map['address1'] != null ? map['address1'] as String : null,
      address2: map['address2'] != null ? map['address2'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientModel.fromJson(String source) =>
      ClientModel.fromMap(json.decode(source) as Map<String, dynamic>);
  String? address3;
}

class InvoiceModel {
  String? invoiceNumber;
  String? date;
  String? terms;
  String? dueDate;
  String? poNumber;
  InvoiceModel({
    this.invoiceNumber,
    this.date,
    this.terms,
    this.dueDate,
    this.poNumber,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'invoiceNumber': invoiceNumber,
      'date': date,
      'terms': terms,
      'dueDate': dueDate,
      'poNumber': poNumber,
    };
  }

  factory InvoiceModel.fromMap(Map<String, dynamic> map) {
    return InvoiceModel(
      invoiceNumber:
          map['invoiceNumber'] != null ? map['invoiceNumber'] as String : null,
      date: map['date'] != null ? map['date'] as String : null,
      terms: map['terms'] != null ? map['terms'] as String : null,
      dueDate: map['dueDate'] != null ? map['dueDate'] as String : null,
      poNumber: map['poNumber'] != null ? map['poNumber'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory InvoiceModel.fromJson(String source) =>
      InvoiceModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
