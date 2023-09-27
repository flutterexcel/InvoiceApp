// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  TextEditingController controller;
  String labelText;
  bool isValidate;
  String validationText;
  bool isSuffixIcon;
  TextInputType textInputType;
  bool inputBorder;
  bool readOnly;
  bool isSuffixText;
  Color labelColor;
  int maxLines;
  // final VoidCallback? onChanged;
  bool denyCharactersOnly;
  String suffixText;
  CustomTextField(
      {required this.controller,
      this.inputBorder = false,
      this.labelText = '',
      this.labelColor = Colors.grey,
      this.validationText = '',
      this.isSuffixIcon = false,
      //  this.onChanged,
      this.isSuffixText = false,
      this.suffixText = 'days before next service date',
      this.maxLines = 1,
      this.denyCharactersOnly = false,
      this.readOnly = false,
      this.textInputType = TextInputType.name,
      this.isValidate = false});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      readOnly: widget.readOnly,
      keyboardType: widget.textInputType,
      inputFormatters: widget.denyCharactersOnly
          ? [
              // FilteringTextInputFormatter.deny(RegExp(r'[a-zA-Z]')),
              FilteringTextInputFormatter.allow(RegExp(r'[0-9\.\-]')),
            ]
          : widget.textInputType == TextInputType.number
              ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
              : null,
      decoration: InputDecoration.collapsed(
        hintText: widget.labelText,
        hintStyle: TextStyle(
          fontSize: 15,
          color: widget.labelColor,
          fontFamily: "RobotoThin",
        ),
      ),
      maxLines: widget.maxLines,
      // onChanged: widget.onChanged,
      validator: !widget.isValidate
          ? null
          : (String? value) {
              if (value == null || value == '') {
                return widget.validationText;
              }
              return null;
            },
    );
  }
}
