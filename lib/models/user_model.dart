class UserModel {
  String? uid;
  String? businessName;
  String? email;
  String? phone;
  String? addressLine1;
  String? addressLine2;
  String? addressLine3;
  String? businessLogoUrl;

  UserModel(
      {this.uid,
      this.businessName,
      this.email,
      this.phone,
      this.addressLine1,
      this.addressLine2,
      this.addressLine3,
      this.businessLogoUrl});

  UserModel.fromMap(Map<String, dynamic> map) {
    uid = map["uid"];
    businessName = map["businessName"];
    email = map["email"];
    phone = map["phone"];
    addressLine1 = map["addressLine1"];
    addressLine2 = map["addressLine2"];
    addressLine3 = map["addressLine3"];
    businessLogoUrl = map["businessLogoUrl"];
  }

  Map<String, dynamic> toMap() {
    return {
      "businessName": businessName,
      "email": email,
      "phone": phone,
      "addressLine1": addressLine1,
      "addressLine2": addressLine2,
      "addressLine3": addressLine3,
      "businessLogoUrl": businessLogoUrl,
      "date": DateTime.now(),
    };
  }
}
