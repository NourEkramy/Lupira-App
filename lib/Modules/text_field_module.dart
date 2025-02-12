import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldModule extends StatelessWidget {
  String textFieldTitle;
  String hintTextTitle;
  Widget? suffix;

  TextFieldModule({super.key, required this.hintTextTitle, required this.textFieldTitle, this.suffix});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
        Text(
          textFieldTitle,
          style: TextStyle(
            fontFamily: 'Inder',
            fontSize: 16,
            color: Color(0xFF57585D),
          ),
        ),
        TextField(
          decoration: InputDecoration(
            suffixIcon: suffix?? SizedBox(),
            hintText: hintTextTitle,
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: BorderRadius.all(Radius.circular(10))),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: BorderRadius.all(Radius.circular(10))),
            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: BorderRadius.all(Radius.circular(10))),
            hintStyle: TextStyle(fontFamily: 'Inder',color: Color(0xFFABABAB),),
            filled: true,
            fillColor: Color(0xFFDEDAE0),
          ),
        ),
      ],
    );
  }
}
