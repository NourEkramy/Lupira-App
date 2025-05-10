import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Detection/detection_api.dart';
import 'package:untitled/Layout/main_layout.dart';
import 'package:untitled/Modules/report_card_module.dart';

import '../Detection Details/detection_details_screen.dart';

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
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    try {
      final response = await HistoryApi.fetchHistory(token!);

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
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MainLayout(
                    child: DetectionDetailsScreen(
                      detectionData: historyData[index],
                    ),
                    title: 'Detection Details',
                  ),
                ),
              );
            },
            reportDate: historyData[index]['date']?.substring(0, 10) ??
                'Unknown date',
            reportResult: historyData[index]['resultLabel'] ?? 'No result',
          );
        },
        itemCount: historyData.length,
      ),
    );
  }
}
