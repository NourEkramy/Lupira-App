import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/About-Lupira/about_lupira.dart';
import 'package:untitled/Formating/text_style_format.dart';
import '../Formating/colors_format.dart';
import 'package:intl/intl.dart';

class ReportCardModule extends StatelessWidget {
  final String reportDate;
  final String reportResult;
  final VoidCallback onTap;

  ReportCardModule({
    super.key,
    required this.reportDate,
    required this.reportResult,
    required this.onTap,
  });

  String formatDateTime(String date, String language) {
    final parsedDate = DateTime.parse(date).toLocal(); // Convert to local time
    final formatter = DateFormat('dd-MM-yyyy - a h:mm', language);
    return formatter.format(parsedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey('history_report'),
      startActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.25,
        children: [
          Builder(
            builder: (context) {
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Handle delete action
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 1.h,
                      horizontal: 3.6.w,
                    ),
                    decoration: BoxDecoration(
                      color: ColorsFormat.lightRedError,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(2.6.w),
                        bottomRight: Radius.circular(2.6.w),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.delete,
                          color: ColorsFormat.border_backgroundWhiteColor,
                          size: 21.sp, // Custom icon size
                        ),
                        SizedBox(height: 0.1.h),
                        Text(
                          'Delete',
                          style: TextStyleFormat.snackBarMessage.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: ColorsFormat.border_backgroundWhiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
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
            horizontal: 3.6.w,
          ),
          margin: EdgeInsets.only(
            bottom: 2.9.h,
          ),
          width: 93.w,
          child: Row(
            children: [
              Image.asset("assets/images/medical-clipboard .png"),
              SizedBox(
                width: 5.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reportResult,
                    style: TextStyleFormat.passwordPageSubTitle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ColorsFormat.text_dividerColor,
                    ),
                  ),
                  Text(
                    formatDateTime(reportDate, context.locale.languageCode),
                    style: TextStyleFormat.textFieldStyle.copyWith(
                      fontWeight: FontWeight.w400,
                      color: ColorsFormat.titleColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
