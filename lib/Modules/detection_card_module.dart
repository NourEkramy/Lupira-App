import 'package:flutter/material.dart';

class DetectionCardModule extends StatelessWidget {
  String mainTitle;
  String? subtitle;

  DetectionCardModule({
    super.key,
    required this.mainTitle,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                    Text(
                      mainTitle,
                      style: const TextStyle(
                        color: Color(0xFF3D1A57),
                        fontFamily: "Inder",
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subtitle??"",
                      style: const TextStyle(
                        color: Color(0xFF3D1A57),
                        fontFamily: "Inder",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
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
    );
  }
}
