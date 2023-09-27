// ignore_for_file: file_names

import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> saveTheme(String theme) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool result = await sharedPreferences.setString("theme", theme);
  return result;
}

Future<String?> getTheme() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? currentTheme = sharedPreferences.getString("theme");
  return currentTheme;
}

// ignore_for_file: body_might_complete_normally_nullable, use_build_context_synchronously

Future<String?> uploadData(
    {required BuildContext context,
    ImageSource source = ImageSource.gallery}) async {
  File? imageFile;
  XFile? pickedFile = await ImagePicker().pickImage(source: source);
  imageFile = File(pickedFile!.path);
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                CircularProgressIndicator(),
                SizedBox(
                  height: 30,
                ),
                Text('Uploading image..'),
              ],
            ),
          ),
        );
      });
  try {
    Reference reference = FirebaseStorage.instance.ref("businessLogo");

    final TaskSnapshot snapshot = await reference.putFile(imageFile);

    final downloadUrl = await snapshot.ref.getDownloadURL();

    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Image Added Successfully')));

    return downloadUrl;
  } catch (e) {
    log("hereU${e.toString()}");
  }
}

Future<XFile?> selectImage(ImageSource source) async {
  XFile? pickedFile = await ImagePicker().pickImage(source: source);
  if (pickedFile != null) {
    return pickedFile;
  }
}

//  void signUp() async {
//       UserCredential? credential;

//       // UIHelper.showLoadingDialog(context, "Creating new account..");

//       try {
// //         FirebaseAuth auth = FirebaseAuth.instance;

// // // Wait for the user to complete the reCAPTCHA & for an SMS code to be sent.
// // ConfirmationResult confirmationResult = await auth.signInWithPhoneNumber('+44 7123 123 456');
// // UserCredential userCredential = await confirmationResult.confirm('123456');
//         await FirebaseAuth.instance.verifyPhoneNumber(
//           phoneNumber: '+918077849802',
//           verificationCompleted: (PhoneAuthCredential credential) async {
//             // Auto-retrieve the SMS code and sign-in the user.
//             await FirebaseAuth.instance.signInWithCredential(credential);
//           },
//           verificationFailed: (FirebaseAuthException e) {
//             if (e.code == 'invalid-phone-number') {
//               print('The provided phone number is not valid.');
//             }
//           },
//           codeSent: (String verificationId, int? resendToken) async {
//             // Save the verification ID so we can use it later.
//             // You can send this code to your backend server to
//             // complete the verification process.
//             print("inub");
//             String smsCode = 'xxxx';
//             PhoneAuthCredential credential = PhoneAuthProvider.credential(
//               verificationId: verificationId,
//               smsCode: smsCode,
//             );
//             await FirebaseAuth.instance.signInWithCredential(credential);
//           },
//           codeAutoRetrievalTimeout: (String verificationId) {
//             print("ritiiiiik");

//             // Auto-retrieve the SMS code and sign-in the user.
//             // You can use this callback to prompt the user to
//             // enter the code manually.
//           },
//         );

//         // await FirebaseAuth.instance.verifyPhoneNumber(
//         //   phoneNumber: '8077849802',
//         //   verificationCompleted: (PhoneAuthCredential credential) async {
//         //     await FirebaseAuth.instance.signInWithCredential(credential);
//         //   },
//         //   verificationFailed: (FirebaseAuthException e) {},
//         //   codeSent: (String verificationId, int? resendToken) {},
//         //   codeAutoRetrievalTimeout: (String verificationId) {},
//         // );
//         // credential = await FirebaseAuth.instance
//         //     .createUserWithEmailAndPassword(email: email, password: password);

//       } on FirebaseAuthException catch (ex) {
//         Navigator.pop(context);

//         UIHelper.showAlertDialog(
//             context, "An error occured", ex.message.toString());
//       }

//       if (credential != null) {
//         String uid = credential.user!.uid;
//         UserModel newUser = UserModel(
//             uid: uid,
//             email: emailController.text,
//             phone: phoneController.text,
//             addressLine1: addressLine1Controller.text,
//             addressLine2: addressLine2Controller.text,
//             addressLine3: addressLine3Controller.text,
//             businessName: businessNameController.text,
//             businessLogoUrl: '');
//         await FirebaseFirestore.instance
//             .collection("users")
//             .doc(uid)
//             .set(newUser.toMap())
//             .then((value) {
//           print("New User Created!");
//           Navigator.popUntil(context, (route) => route.isFirst);
//           // Navigator.pushReplacement(
//           //   context,
//           //   MaterialPageRoute(builder: (context) {
//           //     return CompleteProfile(
//           //         userModel: newUser, firebaseUser: credential!.user!);
//           //   }),
//           // );
//         });
//       }
//     }