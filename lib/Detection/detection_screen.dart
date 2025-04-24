import 'package:flutter/material.dart';

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
    return Column(
      children: [
        LinearProgressIndicator(
          value: _progress,
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(
            Color(0xFF9166B0),
          ),
        ),
        Expanded(
          child: PageView(
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              _buildQuestionPage(
                "Have you experienced persistent fatigue?",
                ["Yes", "No"],
              ),
              _buildQuestionPage(
                "How often do you experience fatigue?",
                ["Never", "Rarely", "Sometimes", "Often", "Always"],
              ),
              _buildQuestionPage(
                "Do you have a fever?",
                ["Yes", "No"],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
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
    );
  }

  Widget _buildQuestionPage(String question, List<String> options) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Symptoms",
            style: TextStyle(
              fontFamily: "Inder",
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xff3D1A57),
            ),
          ),
          SizedBox(height: 10),
          Text(question, style: TextStyle(fontSize: 16)),
          ...options.map((option) {
            return RadioListTile(
              title: Text(option),
              value: option,
              groupValue: null, // Update this with user response logic
              onChanged: (value) {},
            );
          }).toList(),
        ],
      ),
    );
  }
}
