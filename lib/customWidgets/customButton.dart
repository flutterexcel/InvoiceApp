// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:invoice_maker/appcolors.dart';

Widget customButton(
    {String buttonText = 'SAVE', required final VoidCallback onPressed}) {
  return Container(
    height: 50,
    width: 135,
    child: TextButton(
        child: Text(buttonText,
            style: TextStyle(fontSize: 14, color: orangeColor)),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                    side: BorderSide(color: Colors.red)))),
        onPressed: onPressed),
  );
}
