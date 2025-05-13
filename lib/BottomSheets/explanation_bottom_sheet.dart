import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:untitled/BottomSheets/language_bottom_sheet.dart';

class ExplanationBottomSheet extends StatelessWidget {
  String explanation;

  ExplanationBottomSheet({
    super.key,
    required this.explanation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFEBE4E4),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: Color(0xFFDEDAE0),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            width: double.infinity,
            child: Text(
              textAlign: TextAlign.center,
              'explanation'.tr(),
              style: TextStyle(
                color: Color(0xFF3D1A57),
                fontSize: 32,
                fontFamily: 'Inder',
              ),
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "whatMeans".tr(),
                  style: TextStyle(
                    fontFamily: "Inder",
                    fontSize: 24,
                    color: Color(0xff4B4A4C),
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.013),
                Text(
                  explanation,
                  style: TextStyle(
                    fontFamily: "Inder",
                    fontSize: 20,
                    color: Color(0xff4B4A4C),
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.07),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
