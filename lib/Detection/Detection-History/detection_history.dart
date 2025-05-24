import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/BottomSheets/delete_history_confirmation.dart';
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

  Future<void> deleteAll() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var language = prefs.getString('selected_language') ??
        EasyLocalization.of(context)!.locale.languageCode;
    bool success = await HistoryApi.deleteAllHistory(token ?? "", language);

    if (success) {
      await fetchData();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'deleteHistorySuccess'.tr(),
            style:
                TextStyleFormat.snackBarMessage.copyWith(color: Colors.white),
          ),
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.8.w),
          ),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(
            horizontal: 2.w,
            vertical: 2.h,
          ),
          duration: Duration(seconds: 5),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'deleteHistoryError'.tr(),
            style:
                TextStyleFormat.snackBarMessage.copyWith(color: Colors.white),
          ),
          backgroundColor: ColorsFormat.darckRedError,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.8.w),
          ),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(
            horizontal: 2.w,
            vertical: 2.h,
          ),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }

  void confirmDelete(BuildContext context, VoidCallback onDeleteTap) async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return DeleteHistoryConfirmation(onDeleteTap: onDeleteTap);
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 2.9.w,
        right: 2.9.w,
        top: 2.2.h,
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
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          confirmDelete(context, () {
                            setState(() {
                              deleteAll();
                            });
                          });
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                          vertical: 0.7.h,
                        ),
                        child: Text(
                          "delete".tr(),
                          style: TextStyleFormat.textFieldStyle.copyWith(
                            color: ColorsFormat.darckRedError,
                            fontSize: 17.5.sp,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
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
                            reportResult: historyData[index]['resultLabel'] ??
                                'noResult'.tr(),
                            onDelete: () {
                              setState(() {
                                confirmDelete(context, () async {
                                  final prefs =
                                      await SharedPreferences.getInstance();
                                  var token = prefs.getString('token');
                                  var language =
                                      prefs.getString('selected_language') ??
                                          EasyLocalization.of(context)!
                                              .locale
                                              .languageCode;
                                  bool success =
                                      await HistoryApi.deleteOneHistoryReport(
                                          token ?? "",
                                          historyData[index]['id'] ?? "",
                                          language);

                                  if (success) {
                                    setState(() {
                                      historyData.removeAt(index);
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'reportDeletedSuccess'.tr(),
                                          style: TextStyleFormat.snackBarMessage
                                              .copyWith(color: Colors.white),
                                        ),
                                        backgroundColor: Colors.green,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2.8.w),
                                        ),
                                        behavior: SnackBarBehavior.floating,
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 2.w,
                                          vertical: 2.h,
                                        ),
                                        duration: Duration(seconds: 5),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'reportDeleteError'.tr(),
                                          style: TextStyleFormat.snackBarMessage
                                              .copyWith(color: Colors.white),
                                        ),
                                        backgroundColor:
                                            ColorsFormat.darckRedError,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2.8.w),
                                        ),
                                        behavior: SnackBarBehavior.floating,
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 2.w,
                                          vertical: 2.h,
                                        ),
                                        duration: Duration(seconds: 5),
                                      ),
                                    );
                                  }

                                });
                              });
                            },
                          );
                        },
                        itemCount: historyData.length,
                      ),
                    ),
                  ],
                ),
    );
  }
}
