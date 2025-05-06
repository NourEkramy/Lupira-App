import 'package:flutter/material.dart';

class DetectionResultScreen extends StatelessWidget {
  const DetectionResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Color(0xFFABABAB),
              width: 3,
            ),
          ),
          child: CircleAvatar(
            radius: 65,
            backgroundColor: Colors.transparent,
            child: Icon(
              Icons.person,
              color: Color(0xFFABABAB),
              size: 125,
            ),
          ),
        ),
      ],
    );
  }
}
