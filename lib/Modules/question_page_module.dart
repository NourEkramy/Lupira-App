import 'package:flutter/material.dart';

class QuestionPageModule extends StatelessWidget {
  final String question;
  final List<String> options;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;

  const QuestionPageModule({
    super.key,
    required this.question,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
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
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
