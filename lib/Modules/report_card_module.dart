import 'package:flutter/material.dart';

class ReportCardModule extends StatelessWidget {
  String reportDate;
  String reportResult;

  ReportCardModule({
    super.key,
    required this.reportDate,
    required this.reportResult,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffD2CFD3),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color with opacity
              spreadRadius: 0, // Spread of the shadow
              blurRadius: 8, // Softness of the shadow
              offset: const Offset(0, 4), // Position of the shadow (X, Y)
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        margin: const EdgeInsets.only(
          bottom: 25,
        ),
        width: MediaQuery.of(context).size.width * 0.93,
        child: Row(
          children: [
            Image.asset("assets/images/medical-clipboard .png"),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reportDate,
                  style: const TextStyle(
                    color: Color(0xFF4B4A4C),
                    fontFamily: "Inder",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  reportResult,
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
