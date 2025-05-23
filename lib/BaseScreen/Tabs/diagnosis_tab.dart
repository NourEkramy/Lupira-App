import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/Formating/text_style_format.dart';
import 'package:untitled/Modules/detection_card_module.dart';
import 'package:untitled/Modules/report_card_module.dart';
import '../../BottomSheets/prerequisites_bottom_sheet.dart';
import '../../Detection/Detection-History/detection_details_screen.dart';
import '../../Detection/Detection-History/detection_history.dart';
import '../../Detection/Detection-History/detection_history_api.dart';
import '../../Formating/colors_format.dart';
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
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var language = prefs.getString('selected_language') ??
        EasyLocalization.of(context)!.locale.languageCode;

    try {
      final response = await HistoryApi.fetchHistory(token!, language);

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
        padding: EdgeInsets.only(
          left: 2.4.w,
          right: 2.4.w,
          top: 2.9.h,
          bottom: 1.2.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 2.4.w,
              ),
              child: Text(
                "detection".tr(),
                style: TextStyleFormat.passwordSubTitle.copyWith(
                  color: ColorsFormat.darckPruble,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            DetectionCardModule(
              mainTitle: "startDetection".tr(),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return PrerequisitesBottomSheet();
                  },
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 2.4.w,
                bottom: 1.7.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "detectionHistory".tr(),
                    style: TextStyleFormat.passwordSubTitle.copyWith(
                      color: ColorsFormat.darckPruble,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainLayout(
                            title: "history".tr(),
                            showBottomNav: false,
                            child: DetectionHistory(),
                          ),
                          settings: RouteSettings(
                            arguments: {'responseData': historyData},
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          "seeMore".tr(),
                          style: TextStyleFormat.snackBarMessage.copyWith(
                            fontWeight: FontWeight.bold,
                            color: ColorsFormat.gradientPruble,
                          ),
                        ),
                        SizedBox(
                          width: 1.1.w,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: ColorsFormat.gradientPruble,
                          size: 16.sp,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (isLoading)
              Padding(
                padding: EdgeInsets.only(
                  top: 1.h,
                ),
                child: const Center(child: CircularProgressIndicator()),
              )
            else if (historyData.isEmpty)
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 1.h,
                  ),
                  child: Text(
                    "noHistory".tr(),
                    style: TextStyleFormat.textFieldStyle
                        .copyWith(color: ColorsFormat.text_dividerColor),
                  ),
                ),
              )
            else
              SizedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
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
                      reportID: historyData[index]['id'] ?? "",
                      reportDate: historyData[index]['date'],
                      reportResult: historyData[index]['resultLabel'],
                    );
                  },
                  itemCount: historyData.length > 5 ? 5 : historyData.length,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
