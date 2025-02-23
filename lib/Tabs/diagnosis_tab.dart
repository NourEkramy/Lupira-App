import 'package:flutter/material.dart';

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
            const Text(
              "Detection",
              style: TextStyle(
                color: Color(0xFF3D1A57),
                fontFamily: "Inder",
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  decoration: BoxDecoration(
                    color: const Color(0xFFCABDD3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Start Lupus Detection",
                                style: TextStyle(
                                  color: Color(0xFF3D1A57),
                                  fontFamily: "Inder",
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFCABDD3),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 25,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                      color: Color(0xFF502371),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                child: const Text(
                                  "Start Now",
                                  style: TextStyle(
                                    color: Color(0xFF502371),
                                    fontFamily: 'Inder',
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(),
                      ],
                    ),
                  ),
                ),
                Image.asset(""),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
