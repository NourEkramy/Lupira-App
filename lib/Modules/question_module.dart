import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/Formating/text_style_format.dart';
import '../BottomSheets/explanation_bottom_sheet.dart';
import '../Formating/colors_format.dart';

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
                    style: TextStyleFormat.textFieldStyle
                        .copyWith(color: ColorsFormat.text_dividerColor),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return ExplanationBottomSheet(
                        explanation: explanationText,
                      );
                    },
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 0.7.h,
                  ),
                  child: Icon(
                    Icons.info_outlined,
                    color: ColorsFormat.gradientPruble,
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
                style: TextStyleFormat.textFieldStyle
                    .copyWith(color: ColorsFormat.text_dividerColor),
              ),
              leading: Radio<String>(
                value: option,
                groupValue: selectedValue,
                activeColor: ColorsFormat.indecatorPurble,
                fillColor: WidgetStateColor.resolveWith((states) {
                  if (hasError) {
                    return ColorsFormat.darckRedError;
                  }
                  if (states.contains(WidgetState.selected)) {
                    return ColorsFormat.indecatorPurble;
                  }
                  return ColorsFormat.titleColor;
                }),
                onChanged: onChanged,
              ),
            );
          }),
          SizedBox(
            height: 1.h,
          ),
          Divider(
            color: ColorsFormat.hintColor,
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
                    color: ColorsFormat.darckRedError,
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Text(
                    "chooseAnswer".tr(),
                    style: TextStyleFormat.snackBarMessage
                        .copyWith(color: ColorsFormat.darckRedError),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
