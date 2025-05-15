import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/Formating/text_style_format.dart';
import '../BaseScreen/Layout/main_layout.dart';
import '../Formating/colors_format.dart';
import 'detection_result_screen.dart';
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
  bool hasErrorLoadingQuestions = false;

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
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    List<Questions> fetchedQuestions =
        await QuestionsServices.getQuestions(token!);
    setState(() {
      if (fetchedQuestions.isEmpty) {
        hasErrorLoadingQuestions = true;
      } else {
        questionsList = fetchedQuestions;
        _splitQuestionsIntoPages();
        hasErrorLoadingQuestions = false;
      }
      isLoading = false;
      _progress = 0.0;
    });
  }

  String _getTitleForIndex(int questionIndex) {
    if (questionIndex == 0) return "anaTest".tr();
    if (questionIndex >= 1 && questionIndex <= 16) return "symptoms".tr();
    return "labTest".tr();
  }

  Future<void> _nextPage() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    final currentQuestions = pages[_currentPage];
    bool hasAnyError = false;

    setState(() {
      for (var q in currentQuestions) {
        final id = q.sId ?? '';

        if (q.questionNumber == 20) {
          final q19 = questionsList.firstWhere((q) => q.questionNumber == 19);
          final q19Answer = answers[q19.sId];
          if (q19Answer != 'Yes') {
            continue; // Skip validation for Q20
          }
        }

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
        _progress = _currentPage / pages.length;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      final List<Map<String, dynamic>> formattedAnswers = [];

      for (var entry in answers.entries) {
        final question = questionsList.firstWhere(
          (q) => q.sId == entry.key,
        );

        if (entry.value != null && entry.value!.isNotEmpty) {
          formattedAnswers.add({
            "questionNumber": question.questionNumber,
            "answer": entry.value,
          });
        }
      }

      final Map<String, dynamic> requestBody = {
        "responses": formattedAnswers,
      };

      try {
        dynamic responseData = await QuestionsServices.sendAndDetect(
          token: token!,
          body: requestBody,
        );
        if (responseData['success'] == true) {
          String result = responseData['data']['result'];
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainLayout(
                title: "detectionResult".tr(),
                child: DetectionResultScreen(),
                showBottomNav: false,
              ),
              settings: RouteSettings(
                arguments: {
                  'result': result,
                  'code': responseData['data']['code'],
                },
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content:
                    Text(responseData['message'] ?? "diagnosisFailed".tr())),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${e.toString()}")),
        );
      }
    }
  }

  void _prevPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
        _progress = _currentPage / pages.length;
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

    if (hasErrorLoadingQuestions) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 8.6.h,
              backgroundColor: ColorsFormat.lupusArticlesWhite,
              child: ImageIcon(
                AssetImage("assets/images/error.png"),
                color: ColorsFormat.lightRedError,
                size: 39.sp,
              ),
            ),
            SizedBox(
              height: 2.5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.2.w),
              child: Text(
                "questionUnavailable".tr() + "\n" + "tryAgain".tr(),
                style: TextStyleFormat.notFountText
                    .copyWith(color: ColorsFormat.lightRedError),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.only(
        top: 2.1.h,
        left: 4.4.w,
        right: 4.4.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "${(_progress * 100).ceil()}%",
                style: TextStyleFormat.passwordPageSubTitle
                    .copyWith(color: ColorsFormat.titleColor),
              ),
              SizedBox(
                width: 3.w,
              ),
              Expanded(
                child: SizedBox(
                  height: 1.4.h,
                  child: LinearProgressIndicator(
                    value: _progress,
                    borderRadius: BorderRadius.circular(4.4.w),
                    backgroundColor: Color(0xffC5C3C6),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      ColorsFormat.indecatorPurble,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 3.h,
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
                        style: TextStyleFormat.passwordSubTitle.copyWith(
                          fontWeight: FontWeight.w700,
                          color: ColorsFormat.darckPruble,
                          fontSize: 26,
                        ),
                      ),
                      ...questions.where((question) {
                        // Show question 20 only if question 19 was answered "Yes"
                        if (question.questionNumber == 20) {
                          return answers.entries.any((entry) =>
                              questionsList
                                      .firstWhere((q) => q.sId == entry.key)
                                      .questionNumber ==
                                  19 &&
                              entry.value == 'Yes');
                        }
                        return true;
                      }).map((question) {
                        return QuestionModule(
                          question: question.questionText ?? "",
                          options: question.options ?? [],
                          selectedValue: answers[question.sId],
                          hasError: hasError[question.sId] ?? false,
                          onChanged: (value) => setState(() {
                            answers[question.sId ?? ''] = value;
                            hasError[question.sId ?? ''] = false;
                          }),
                          explanationText: question.explanation ?? "",
                        );
                      }),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.4.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _currentPage > 0
                                ? GestureDetector(
                                    onTap: _prevPage,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.arrow_back_ios_outlined,
                                          color: Color(0xff9166B0),
                                          size: 16.sp,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          "back".tr(),
                                          style: TextStyleFormat.textFieldStyle
                                              .copyWith(
                                            color: Color(0xff9166B0),
                                            fontSize: 19,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : SizedBox(),
                            SizedBox(
                              width: 27.w,
                              child: ElevatedButton(
                                onPressed: _nextPage,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      ColorsFormat.button_linksColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2.6.w),
                                  ),
                                ),
                                child: Text(
                                  _currentPage == pages.length - 1
                                      ? "submit".tr()
                                      : "next".tr(),
                                  style:
                                      TextStyleFormat.textFieldStyle.copyWith(
                                    color: Colors.white,
                                    fontSize: 19,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.4.h,
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
