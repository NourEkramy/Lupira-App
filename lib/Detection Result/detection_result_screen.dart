import 'package:flutter/material.dart';

class DetectionResultScreen extends StatelessWidget {
  const DetectionResultScreen({super.key});

  static const String routeName = "DetectionResultScreen";

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)?.settings.arguments as dynamic;
    return Column(
      children: [
        data['code'] == 1
            ? CircleAvatar(
                radius: 65,
                backgroundColor: Color(0xffC2D0D0),
                child: ImageIcon(
                  AssetImage("assets/images/warning_positive_result.png"),
                  size: 125,
                ),
              )
            : CircleAvatar(
                radius: 65,
                backgroundColor: Color(0xffDDBCC3),
                child: ImageIcon(
                  AssetImage("assets/images/warning_positive_result.png"),
                  size: 125,
                ),
              ),
      ],
    );
  }
}
