import 'package:flutter/material.dart';
import 'package:untitled/Modules/detection_card_module.dart';
import 'package:untitled/Modules/report_card_module.dart';
import '../Detection-History/detection_history.dart';
import '../Detection/detection_api.dart';
import '../Layout/main_layout.dart';

class DiagnosisTab extends StatefulWidget {
  const DiagnosisTab({super.key});

  @override
  State<DiagnosisTab> createState() => _DiagnosisTabState();
}

class _DiagnosisTabState extends State<DiagnosisTab> {
  List<dynamic> historyData = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    const token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjMxMjAsImlhdCI6MTc0NjYyMTY5NSwiZXhwIjoxNzQ2NjI1Mjk1fQ.Ud6JRRH7n1rma3o2qbLxPQXjHirjsLtlsTx17yTfBPM";

    try {
      final response = await HistoryApi.fetchHistory(token);

      if (response['success'] == true) {
        setState(() {
          historyData = response['history'] ?? [];
          isLoading = false;
        });
      } else {
        setState(() {
          historyData = [];
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 25,
          bottom: 10,
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
            DetectionCardModule(
              mainTitle: "Start Lupus Detection",
              onTap: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                bottom: 15,
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainLayout(
                            title: "History",
                            child: DetectionHistory(),
                          ),
                          settings: RouteSettings(
                            arguments: {'responseData': historyData},
                          ),
                        ),
                      );
                    },
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
                        SizedBox(
                          width: 5,
                        ),
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
            if (isLoading)
              Center(child: CircularProgressIndicator())
            else if (historyData.isEmpty)
              Text("No history available.")
            else
              SizedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ReportCardModule(
                      reportDate: historyData[index]['date'].substring(0, 10),
                      reportResult: historyData[index]['resultLabel'],
                    );
                  },
                  itemCount: 5,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
