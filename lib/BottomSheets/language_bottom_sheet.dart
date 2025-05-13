import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  Future<void> changeLanguage(BuildContext context, String langCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_language', langCode);

    context.setLocale(Locale(langCode));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFEBE4E4),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: Color(0xFFDEDAE0),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            width: double.infinity,
            child: Text(
              textAlign: TextAlign.center,
              'selectLanguage'.tr(),
              style: TextStyle(
                color: Color(0xFF3D1A57),
                fontSize: 32,
                fontFamily: 'Inder',
              ),
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
          GestureDetector(
            onTap: () {
              setState(() {
                changeLanguage(context, 'ar');
              });
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.locale == Locale("ar")
                            ? Color(0xFFAF93BF)
                            : Color(0xFF817F82),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: context.locale == Locale("ar")
                          ? Color(0xFFAF93BF)
                          : null,
                    ),
                  ),
                  SizedBox(width: MediaQuery.sizeOf(context).width * 0.02),
                  Text(
                    'arabic'.tr(),
                    style: TextStyle(
                      color: Color(0xFF4B4A4C),
                      fontFamily: 'Inder',
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
          GestureDetector(
            onTap: () {
              setState(() {
                changeLanguage(context, 'en');
              });
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.locale == Locale("en")
                            ? Color(0xFFAF93BF)
                            : Color(0xFF817F82),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: context.locale == Locale("en")
                          ? Color(0xFFAF93BF)
                          : null,
                    ),
                  ),
                  SizedBox(width: MediaQuery.sizeOf(context).width * 0.02),
                  Text(
                    'english'.tr(),
                    style: TextStyle(
                      color: Color(0xFF4B4A4C),
                      fontFamily: 'Inder',
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
        ],
      ),
    );
  }
}
