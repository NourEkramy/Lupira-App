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
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.224,
                  decoration: BoxDecoration(
                    color: const Color(0xFFCABDD3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(20.0),
                  margin: const EdgeInsets.only(
                    top: 6,
                    right: 4,
                    bottom: 50,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
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
                Positioned(
                  top: -10,
                  right: -15,
                  child: Image.asset("assets/images/detection image.png"),
                ),
              ],
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
                        SizedBox(width: 5,),
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
          ],
        ),
      ),
    );
  }
}
