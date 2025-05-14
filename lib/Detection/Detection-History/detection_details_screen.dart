import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class DetectionDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> detectionData;

  const DetectionDetailsScreen({super.key, required this.detectionData});

  @override
  State<DetectionDetailsScreen> createState() => _DetectionDetailsScreenState();
}

class _DetectionDetailsScreenState extends State<DetectionDetailsScreen> {
  String _getTitleForIndex(int questionIndex) {
    if (questionIndex == 0) return "anaTest".tr();
    if (questionIndex == 1) return "symptoms".tr();
    if (questionIndex == 17) return "labTests".tr();
    return '';
  }

  @override
  Widget build(BuildContext context) {
    final responses = widget.detectionData['responses'] as List? ?? [];
    final resultLabel =
        widget.detectionData['resultLabel'] as String? ?? 'noResult'.tr();
    String? lastTitle;

    return Column(
      children: [
        Center(
          child: Container(
            padding: EdgeInsets.all(3.8.w),
            child: Row(
              children: [
                Icon(
                  Icons.assignment,
                  color: Color(0xFF744199),
                  size: 21.sp,
                ),
                SizedBox(width: 2.4.w),
                Expanded(
                  child: Text(
                    overflow: TextOverflow.visible,
                    'result'.tr()+resultLabel,
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xFF3D1A57),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inder',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(
              left: 3.8.w,
              right: 3.8.w,
              top: 1.2.h,
              bottom: 1.8.h,
            ),
            itemCount: responses.length,
            itemBuilder: (context, index) {
              final item = responses[index] as Map<String, dynamic>;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_getTitleForIndex(index) != '') ...[
                    Padding(
                      padding: EdgeInsets.only(
                        top: 1.8.h,
                        bottom: 1.6.h,
                      ),
                      child: Text(
                        _getTitleForIndex(index),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3D1A57),
                          fontFamily: 'Inder',
                        ),
                      ),
                    ),
                  ],
                  Padding(
                    padding: EdgeInsets.only(
                      top: 1.h,
                      bottom: 0.7.h,
                      left: 2.w,
                    ),
                    child: Text(
                      item['question']?.toString() ?? 'unknownQuestion'.tr(),
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Inder',
                        color: Color(0xFF4B4A4C),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.2.h),
                  Padding(
                    padding: EdgeInsets.only(top: 0.7.h, bottom: 1.h, left: 3.5.w),
                    child: Text(
                      'answer'.tr()+"${item['answer']?.toString() ?? 'noAnswerProvided'.tr()}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF3D1A57),
                        fontFamily: 'Inder',
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Divider(
                    color: Color(0xFFABABAB),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
