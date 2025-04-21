import 'package:flutter/material.dart';

class OperationButtonModule extends StatelessWidget {

  Color borderColor;
  Color buttonColor;
  Color buttonTextColor;
  String buttonText;
  VoidCallback onTap;

  OperationButtonModule({super.key, required this.borderColor, required this.buttonColor, required this.buttonText, required this.buttonTextColor, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor, width: 2,),
          borderRadius: BorderRadius.circular(10.0),
        ),
        minimumSize: Size(double.infinity, 50),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          color: buttonTextColor,
          fontFamily: 'Inder',
          fontSize: 20,
        ),
      ),
    );
  }
}
