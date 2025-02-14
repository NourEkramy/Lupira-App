import 'package:flutter/material.dart';

class SettingsOptionsModule extends StatelessWidget {
  String optionIcon;
  String optionText;
  Color optionTextColor;
  SettingsOptionsModule({super.key, required this.optionTextColor, required this.optionIcon, required this.optionText});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
        onTap: (){},
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35,vertical: 13),
          child: Row(
            children: [
              Image.asset(optionIcon),
              SizedBox(width: MediaQuery.sizeOf(context).width * 0.065),
              Text(
                optionText,
                style: TextStyle(
                  color: optionTextColor,
                  fontFamily: 'Inder',
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ),
      Divider(thickness: 1,color: Color(0xFFABABAB),),
    ]);
  }
}
