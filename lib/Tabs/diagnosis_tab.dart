import 'package:flutter/material.dart';
import 'package:untitled/Modules/detection_card_module.dart';

class DiagnosisTab extends StatelessWidget {
  const DiagnosisTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                left: 10,
              ),
              child: Text(
                "Detection",
                style: TextStyle(
                  color: Color(0xFF3D1A57),
                  fontFamily: "Inder",
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            DetectionCardModule(
              mainTitle: "Start Lupus Detection",
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Detection history",
                    style: TextStyle(
                      color: Color(0xFF3D1A57),
                      fontFamily: "Inder",
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    child: const Row(
                      children: [
                        Text(
                          "See more",
                          style: TextStyle(
                            color: Color(0xFF744199),
                            fontFamily: "Inder",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Color(0xff744199),
                          size: 17,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
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
              padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15,),
              margin: const EdgeInsets.only(top: 15,),
              width: MediaQuery.of(context).size.width * 0.94,
              child: Row(
                children: [
                  Image.asset("assets/images/medical-clipboard .png"),
                  SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "5 May, 2024",
                        style: TextStyle(
                          color: Color(0xFF4B4A4C),
                          fontFamily: "Inder",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "No signs of lupus detected",
                        style: TextStyle(
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
          ],
        ),
      ),
    );
  }
}
