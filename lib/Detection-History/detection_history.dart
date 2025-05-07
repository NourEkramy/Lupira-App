import 'package:flutter/material.dart';
import 'package:untitled/Detection/detection_api.dart';
import 'package:untitled/Modules/report_card_module.dart';

class DetectionHistory extends StatefulWidget {
  static const String routeName = "DetectionHistory";

  const DetectionHistory({super.key});

  @override
  State<DetectionHistory> createState() => _DetectionHistoryState();
}

class _DetectionHistoryState extends State<DetectionHistory> {
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
    return Padding(
      padding: const EdgeInsets.only(
        left: 13,
        right: 13,
        top: 30,
      ),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ReportCardModule(
            reportDate: historyData[index]['date'].substring(0, 10),
            reportResult: historyData[index]['resultLabel'],
          );
        },
        itemCount: historyData.length,
      ),
    );
  }
}
