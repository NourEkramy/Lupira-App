import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldModule extends StatelessWidget {
  String textFieldTitle;
  String hintTextTitle;
  Color hintTextColor;
  Color titelTextColor;
  Color borderColor;
  Color backgroundColor;
  Widget? suffix;
  TextEditingController textController;
  TextInputType textFieldType;

  TextFieldModule(
      {super.key,
      required this.hintTextTitle,
      required this.textFieldTitle,
      required this.hintTextColor,
      required this.titelTextColor,
      required this.borderColor,
      required this.backgroundColor,
      required this.textController,
      required this.textFieldType,
      this.suffix});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
        Text(
          textFieldTitle,
          style: TextStyle(
            fontFamily: 'Inder',
            fontSize: 18,
            color: titelTextColor,
          ),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.005),
        TextField(
          controller: textController,
          keyboardType: textFieldType,
          style: TextStyle(
            color: Color(0xff4B4A4C),
            fontFamily: "Inder",
            fontSize: 16,
          ),
          decoration: InputDecoration(
            suffixIcon: suffix ?? SizedBox(),
            hintText: hintTextTitle,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            hintStyle: TextStyle(
              fontSize: 16,
              fontFamily: 'Inder',
              color: hintTextColor,
            ),
            filled: true,
            fillColor: backgroundColor,
          ),
        ),
      ],
    );
  }
}
