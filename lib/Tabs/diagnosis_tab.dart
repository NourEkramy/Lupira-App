import 'package:flutter/material.dart';
import 'package:untitled/Modules/detection_card_module.dart';
import 'package:untitled/Modules/report_card_module.dart';

class DiagnosisTab extends StatelessWidget {
  const DiagnosisTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 25,
          bottom: 10,
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
                bottom: 15,
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
            SizedBox(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ReportCardModule(
                    reportDate: "5 May, 2024",
                    reportResult: "No signs of lupus detected",
                  );
                },
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
