import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../BottomSheets/explanation_bottom_sheet.dart';

class QuestionModule extends StatelessWidget {
  final String question;
  final List<String> options;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final bool hasError;
  final String explanationText;

  const QuestionModule({
    super.key,
    required this.question,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
    required this.hasError,
    required this.explanationText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 2.w,
        vertical: 1.2.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 0.9.h,
                  ),
                  child: Text(
                    question,
                    style: const TextStyle(
                      fontFamily: "Inder",
                      fontSize: 18,
                      color: Color(0xff4B4A4C),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return ExplanationBottomSheet(explanation: explanationText,);
                    },
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 0.7.h,
                  ),
                  child: Icon(
                    Icons.info_outlined,
                    color: Color(0xff744199),
                    size: 21.3.sp,
                  ),
                ),
              ),
            ],
          ),
          ...options.map((option) {
            return ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              visualDensity: VisualDensity(
                horizontal: -4,
                vertical: -4,
              ),
              title: Text(
                option,
                style: const TextStyle(
                  fontFamily: "Inder",
                  fontSize: 18,
                  color: Color(0xff4B4A4C),
                ),
              ),
              leading: Radio<String>(
                value: option,
                groupValue: selectedValue,
                activeColor: const Color(0xFF9166B0),
                fillColor: WidgetStateColor.resolveWith((states) {
                  if (hasError) {
                    return const Color(0xFFB9433E);
                  }
                  if (states.contains(WidgetState.selected)) {
                    return const Color(0xFF9166B0);
                  }
                  return const Color(0xff817F82);
                }),
                onChanged: onChanged,
              ),
            );
          }),
          SizedBox(
            height: 1.h,
          ),
          const Divider(
            color: Color(0xffABABAB),
          ),
          if (hasError)
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 0.6.h,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.error_outlined,
                    color: Color(0xFFB9433E),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Text(
                    "chooseAnswer".tr(),
                    style: TextStyle(
                      color: Color(0xFFB9433E),
                      fontFamily: "Inder",
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
