import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/Formating/text_style_format.dart';
import '../Formating/colors_format.dart';

class ReportCardModule extends StatelessWidget {
  final String reportDate;
  final String reportResult;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  ReportCardModule(
      {super.key,
      required this.reportDate,
      required this.reportResult,
      required this.onTap,
      required this.onDelete});

  String formatDateTime(String date, String language) {
    final parsedDate = DateTime.parse(date).toLocal(); // Convert to local time
    final formatter = DateFormat('dd-MM-yyyy - a h:mm', language);
    return formatter.format(parsedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsFormat.articleCardColor,
        borderRadius: BorderRadius.circular(2.6.w),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.2),
            // Shadow color with opacity
            spreadRadius: 0,
            // Spread of the shadow
            blurRadius: 2.w,
            // Softness of the shadow
            offset: Offset(0, 0.5.h), // Position of the shadow (X, Y)
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        vertical: 1.7.h,
        horizontal: 3.w,
      ),
      margin: EdgeInsets.only(
        bottom: 2.9.h,
      ),
      width: 93.w,
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: Row(
                children: [
                  Image.asset("assets/images/medical-clipboard .png"),
                  SizedBox(
                    width: 4.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          reportResult,
                          style: TextStyleFormat.passwordPageSubTitle.copyWith(
                            fontSize: 17.3.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorsFormat.text_dividerColor,
                          ),
                        ),
                        Text(
                          formatDateTime(
                              reportDate, context.locale.languageCode),
                          style: TextStyleFormat.textFieldStyle.copyWith(
                            fontWeight: FontWeight.w400,
                            color: ColorsFormat.titleColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: onDelete,
            child: Container(
              child: Icon(
                Icons.delete,
                size: 21.sp,
                color: ColorsFormat.darckRedError,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
