import 'package:flutter/material.dart';

class DetectionResultScreen extends StatelessWidget {
  const DetectionResultScreen({super.key});

  static const String routeName = "DetectionResultScreen";

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)?.settings.arguments as dynamic;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          data['code'] == 1
              ? CircleAvatar(
                  radius: 90,
                  backgroundColor: Color(0xffDDBCC3),
                  child: ImageIcon(
                    AssetImage("assets/images/warning_positive_result.png"),
                    color: Color(0xffD6101D),
                    size: 125,
                  ),
                )
              : CircleAvatar(
                  radius: 90,
                  backgroundColor: Color(0xffC2D0D0),
                  child: ImageIcon(
                    AssetImage("assets/images/negative_result.png"),
                    color: Color(0xff209872),
                    size: 125,
                  ),
                ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          Text(
            "Detection Result",
            style: TextStyle(
              fontFamily: "Inder",
              fontSize: 30,
              color: data['code'] == 1 ? Color(0xffD6101D) : Color(0xff209872),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              data['result'],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Inder",
                fontSize: 27,
                color: Color(0xff4B4A4C),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          if (data['code'] == 1)
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              decoration: BoxDecoration(
                color: Color(0xffCABDD3),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/phonendoscope.png"),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Text(
                        "Next step",
                        style: TextStyle(
                          fontFamily: "Inder",
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff3D1A57),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    "We strongly recommend consulting a healthcare professional for further evaluation and guidance",
                    style: TextStyle(
                      fontFamily: "Inder",
                      fontSize: 20,
                      color: Color(0xff4B4A4C),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
