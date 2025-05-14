import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ReportCardModule extends StatelessWidget {
  String reportDate;
  String reportResult;
  VoidCallback onTap;

  ReportCardModule({
    super.key,
    required this.reportDate,
    required this.reportResult,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffD2CFD3),
          borderRadius: BorderRadius.circular(2.6.w),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color with opacity
              spreadRadius: 0, // Spread of the shadow
              blurRadius: 2.w, // Softness of the shadow
              offset: Offset(0, 0.5.h), // Position of the shadow (X, Y)
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(
          vertical: 1.7.h,
          horizontal: 3.6.w,
        ),
        margin: EdgeInsets.only(
          bottom: 2.9.h,
        ),
        width: 93.w,
        child: Row(
          children: [
            Image.asset("assets/images/medical-clipboard .png"),
            SizedBox(
              width: 5.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reportResult,
                  style: const TextStyle(
                    color: Color(0xFF4B4A4C),
                    fontFamily: "Inder",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  reportDate,
                  style: const TextStyle(
                    color: Color(0xFF817F82),
                    fontFamily: "Inder",
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
