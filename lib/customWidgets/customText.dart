// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

Widget customText(
    {String? text,
    double fontsize = 14,
    bool underline = false,
    Color textColor = Colors.white,
    bool isBold = false}) {
  return Text(text!,
      textAlign: TextAlign.justify,
      style: TextStyle(
          fontSize: fontsize,
          color: textColor,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          decoration: !underline ? null : TextDecoration.underline));
}
