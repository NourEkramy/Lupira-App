import 'package:flutter/material.dart';

import '../Modules/question_page_module.dart';

class DetectionScreen extends StatefulWidget {
  DetectionScreen({super.key});

  static const String routeName = "DetectionScreen";

  @override
  State<DetectionScreen> createState() => _DetectionScreenState();
}

class _DetectionScreenState extends State<DetectionScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  double _progress = 0.0;
  String? selectedFatigue;
  String? selectedFrequency;
  String? selectedFever;

  void _nextPage() {
    if (_currentPage < 2) {
      setState(() {
        _currentPage++;
        _progress = (_currentPage + 1) / 3; // Update progress
      });
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _prevPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
        _progress = (_currentPage + 1) / 3; // Update progress
      });
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.014,
            child: LinearProgressIndicator(
              value: _progress,
              borderRadius: BorderRadius.circular(20.0),
              backgroundColor: Color(0xffC5C3C6),
              valueColor: AlwaysStoppedAnimation<Color>(
                Color(0xFF9D82AF),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Text(
            "Symptoms",
            style: TextStyle(
              fontFamily: "Inder",
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: Color(0xff3D1A57),
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                QuestionPageModule(
                  question: "Have you experienced persistent fatigue?",
                  options: ["Yes", "No"],
                  selectedValue: selectedFatigue,
                  onChanged: (value) => setState(() {
                    selectedFatigue = value;
                  }),
                ),
                QuestionPageModule(
                  question: "How often do you experience fatigue?",
                  options: ["Never", "Rarely", "Sometimes", "Often", "Always"],
                  selectedValue: selectedFrequency,
                  onChanged: (value) => setState(() {
                    selectedFrequency = value;
                  }),
                ),
                QuestionPageModule(
                  question: "Do you have a fever?",
                  options: ["Yes", "No"],
                  selectedValue: selectedFever,
                  onChanged: (value) => setState(() {
                    selectedFever = value;
                  }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ElevatedButton(
              onPressed: _nextPage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF9166B0),
              ),
              child: Text(
                "Next",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
