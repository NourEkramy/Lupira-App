import 'package:flutter/material.dart';

import '../Models/detection_questions_model.dart';
import '../Modules/question_page_module.dart';
import 'detection_screen_api.dart';

class DetectionScreen extends StatefulWidget {
  const DetectionScreen({super.key});

  static const String routeName = "DetectionScreen";

  @override
  State<DetectionScreen> createState() => _DetectionScreenState();
}

class _DetectionScreenState extends State<DetectionScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  double _progress = 0.0;
  List<Questions> questionsList = [];
  Map<String, String?> answers = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjMwMjAsImlhdCI6MTc0NTk2NDk5OSwiZXhwIjoxNzQ1OTY4NTk5fQ.mP4-5xqIVaoBlycM1t5BlVfi7jwHVubY8ZYHMaZ1uGM";

    List<Questions> fetchedQuestions =
        await QuestionsServices.getQuestions(token);
    setState(() {
      questionsList = fetchedQuestions;
      isLoading = false;
      _progress = fetchedQuestions.isEmpty ? 0.0 : 1 / fetchedQuestions.length;
    });
  }

  String _getTitleForPage(int pageIndex) {
    if (pageIndex == 0) {
      return "ANA test presence";
    } else if (pageIndex > 0 && pageIndex <= 16) {
      return "Symptoms";
    } else {
      return "Laboratory Tests";
    }
  }

  void _nextPage() {
    if (_currentPage < questionsList.length - 1) {
      setState(() {
        _currentPage++;
        _progress = (_currentPage + 1) / questionsList.length;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // All questions answered, you can submit the `answers` map here
      print("Answers: $answers");
    }
  }

  void _prevPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
        _progress = (_currentPage + 1) / questionsList.length;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

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
              backgroundColor: const Color(0xffC5C3C6),
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFF9D82AF),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Text(
            _getTitleForPage(_currentPage),
            style: const TextStyle(
              fontFamily: "Inder",
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: Color(0xff3D1A57),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: questionsList.length,
              itemBuilder: (context, index) {
                final question = questionsList[index];
                return QuestionPageModule(
                  question: question.questionText ?? "",
                  options: question.options ?? [],
                  selectedValue: answers[question.sId],
                  onChanged: (value) => setState(() {
                    answers[question.sId ?? ''] = value;
                  }),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _currentPage > 0
                    ? GestureDetector(
                        onTap: _prevPage,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.arrow_back_ios_outlined,
                              color: Color(0xff9166B0),
                              size: 17,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            const Text(
                              "Back",
                              style: TextStyle(
                                color: Color(0xff9166B0),
                                fontFamily: "Inder",
                                fontSize: 19,
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.27,
                  child: ElevatedButton(
                    onPressed: _nextPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF502371),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      _currentPage == questionsList.length - 1
                          ? "Submit"
                          : "Next",
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "Inder",
                        fontSize: 19,
                      ),
                    ),
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
