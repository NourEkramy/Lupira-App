import 'package:flutter/material.dart';

class LanguageBottomSheets extends StatelessWidget {
  const LanguageBottomSheets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFEBE4E4),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20),),
      ),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10,),
            decoration: BoxDecoration(
              color: Color(0xFFDEDAE0),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20),),
          ),
            width: double.infinity,
            child: Text(
              textAlign: TextAlign.center,
              'Select a langauge',
              style: TextStyle(
                color: Color(0xFF3D1A57),
                fontSize: 32,
                fontFamily: 'Inder',
              ),
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              children: [
                Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF817F82), width: 2,),
                  borderRadius: BorderRadius.circular(20),
                ),),
                SizedBox(width: MediaQuery.sizeOf(context).width * 0.02),
                Text(
                  'Arabic',
                  style: TextStyle(
                    color: Color(0xFF4B4A4C),
                    fontFamily: 'Inder',
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              children: [Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFAF93BF), width: 2,),
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFAF93BF),
                ),),
                SizedBox(width: MediaQuery.sizeOf(context).width * 0.02),
                Text(
                  'English',
                  style: TextStyle(
                    color: Color(0xFF4B4A4C),
                    fontFamily: 'Inder',
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
        ],
      ),
    );
  }
}
