import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/Detection/Detection-History/detection_history_api.dart';
import 'package:untitled/Formating/colors_format.dart';
import 'package:untitled/Formating/text_style_format.dart';
import 'package:untitled/Modules/report_card_module.dart';
import '../../BaseScreen/Layout/main_layout.dart';
import 'detection_details_screen.dart';

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
      padding: EdgeInsets.only(
        left: 2.9.w,
        right: 2.9.w,
        top: 3.5.h,
      ),
      child: isLoading
          ? Center(child: CircularProgressIndicator())
          : historyData.isEmpty
              ? Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 2.h,
                    ),
                    child: Text(
                      "noHistory".tr(),
                      style: TextStyleFormat.passwordPageSubTitle.copyWith(
                        color: ColorsFormat.text_dividerColor,
                      ),
                    ),
                  ),
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return ReportCardModule(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainLayout(
                              child: DetectionDetailsScreen(
                                detectionData: historyData[index],
                              ),
                              title: 'detectionDetails'.tr(),
                              showBottomNav: false,
                            ),
                          ),
                        );
                      },
                      reportDate:
                          historyData[index]['date']?.substring(0, 10) ??
                              'unknownData'.tr(),
                      reportResult:
                          historyData[index]['resultLabel'] ?? 'noResult'.tr(),
                    );
                  },
                  itemCount: historyData.length,
                ),
    );
  }
}
