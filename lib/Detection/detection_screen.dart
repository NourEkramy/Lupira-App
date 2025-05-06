import 'package:flutter/material.dart';
import '../Models/detection_questions_model.dart';
import '../Modules/question_module.dart';
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
  List<List<Questions>> pages = [];
  List<int> startIndexes = [];
  Map<String, bool> hasError = {};
  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjMxMjAsImlhdCI6MTc0NjU0MjY1OSwiZXhwIjoxNzQ2NTQ2MjU5fQ.au707k57OR4bWIjXPqLKz5TveYqfzuwJV5KG8WYKiNc";

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  void _splitQuestionsIntoPages() {
    List<int> questionsPerPage = [1, 1, 3, 3, 5, 3, 1, 3, 3, 2, 2];
    int currentIndex = 0;

    for (var count in questionsPerPage) {
      if (currentIndex >= questionsList.length) break;
      int end = (currentIndex + count).clamp(0, questionsList.length);
      pages.add(questionsList.sublist(currentIndex, end));
      startIndexes.add(currentIndex);
      currentIndex = end;
    }

    if (currentIndex < questionsList.length) {
      pages.add(questionsList.sublist(currentIndex));
      startIndexes.add(currentIndex);
    }
  }

  Future<void> _loadQuestions() async {
    List<Questions> fetchedQuestions =
        await QuestionsServices.getQuestions(token);
    setState(() {
      questionsList = fetchedQuestions;
      _splitQuestionsIntoPages();
      isLoading = false;
      _progress = fetchedQuestions.isEmpty ? 0.0 : 1 / fetchedQuestions.length;
    });
  }

  String _getTitleForIndex(int questionIndex) {
    if (questionIndex == 0) return "ANA test presence";
    if (questionIndex >= 1 && questionIndex <= 16) return "Symptoms";
    return "Laboratory Tests";
  }

  Future<void> _nextPage() async {
    final currentQuestions = pages[_currentPage];
    bool hasAnyError = false;

    setState(() {
      for (var q in currentQuestions) {
        final id = q.sId ?? '';
        if ((answers[id] ?? '').isEmpty) {
          hasError[id] = true;
          hasAnyError = true;
        } else {
          hasError[id] = false;
        }
      }
    });

    if (hasAnyError) return;

    if (_currentPage < pages.length - 1) {
      setState(() {
        _currentPage++;
        _progress = (_currentPage + 1) / pages.length;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      final List<Map<String, dynamic>> formattedAnswers = [];

      int questionNumber = 1;
      for (var entry in answers.entries) {
        if (entry.value != null && entry.value!.isNotEmpty) {
          formattedAnswers.add({
            "questionNumber": questionNumber++,
            "answer": entry.value,
          });
        }
      }

      final Map<String, dynamic> requestBody = {
        "responses": formattedAnswers,
      };


      try {
        dynamic responseData = await QuestionsServices.sendAndDetect(
          token: token,
          body: requestBody,
        );
        if (responseData['success'] == true) {
          String result = responseData['data']['result'];
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Diagnosis: $result")),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(responseData['message'] ?? "Diagnosis failed")),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${e.toString()}")),
        );
      }
    }

  }

  void _prevPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
        _progress = (_currentPage + 1) / pages.length;
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
      padding: const EdgeInsets.only(
        top: 18.0,
        left: 18.0,
        right: 18.0,
      ),
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
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: pages.length,
              itemBuilder: (context, index) {
                final questions = pages[index];
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _getTitleForIndex(startIndexes[_currentPage]),
                        style: const TextStyle(
                          fontFamily: "Inder",
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff3D1A57),
                        ),
                      ),
                      ...questions.map((question) {
                        return QuestionModule(
                          question: question.questionText ?? "",
                          options: question.options ?? [],
                          selectedValue: answers[question.sId],
                          hasError: hasError[question.sId] ?? false,
                          onChanged: (value) => setState(() {
                            answers[question.sId ?? ''] = value;
                            hasError[question.sId ?? ''] = false;
                          }),
                        );
                      }),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005,
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02,
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
                                  _currentPage == pages.length - 1
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.014,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
