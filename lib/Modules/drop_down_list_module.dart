import 'package:flutter/material.dart';

class DropDownListModule extends StatelessWidget {
  String text;
  String hintText;
  Color borderColor;
  Color hintColor;
  Color textColor;
  Color backgroundColor;
  List<String> options;

  DropDownListModule({
    super.key,
    required this.options,
    required this.hintColor,
    required this.hintText,
    required this.textColor,
    required this.borderColor,
    required this.text,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Inder',
            fontSize: 18,
            color: textColor,
          ),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.005),
        DropdownButtonFormField<String>(
          dropdownColor: Color(0xFFDEDAE0),
          decoration: InputDecoration(
            hintText: hintText,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            hintStyle: TextStyle(
              fontSize: 16,
              fontFamily: 'Inder',
              color: hintColor,
            ),
            filled: true,
            fillColor: backgroundColor,
          ),
          items: options.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                  fontFamily: 'Inder',
                  fontSize: 16,
                  color: textColor,
                ),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {},
        ),
      ],
    );
  }
}
