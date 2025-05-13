import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:untitled/BottomSheets/language_bottom_sheet.dart';
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
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 10.0,
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
                    bottom: 8.0,
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
                    top: 6.0,
                  ),
                  child: Icon(
                    Icons.info_outlined,
                    color: Color(0xff744199),
                    size: 28,
                  ),
                ),
              ),
            ],
          ),
          ...options.map((option) {
            return ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              visualDensity: const VisualDensity(
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
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          const Divider(
            color: Color(0xffABABAB),
          ),
          if (hasError)
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.error_outlined,
                    color: Color(0xFFB9433E),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.01,
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
