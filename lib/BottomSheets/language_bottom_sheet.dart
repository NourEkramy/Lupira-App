import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

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
          topLeft: Radius.circular(4.4.w),
          topRight: Radius.circular(4.4.w),
        ),
      ),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 1.2.h,
            ),
            decoration: BoxDecoration(
              color: Color(0xFFDEDAE0),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4.4.w),
                topRight: Radius.circular(4.4.w),
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
          SizedBox(height: 3.h),
          GestureDetector(
            onTap: () {
              setState(() {
                changeLanguage(context, 'ar');
              });
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.only(left: 6.w),
              child: Row(
                children: [
                  Container(
                    width: 5.3.w,
                    height: 2.5.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.locale == Locale("ar")
                            ? Color(0xFFAF93BF)
                            : Color(0xFF817F82),
                        width: 0.5.w,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: context.locale == Locale("ar")
                          ? Color(0xFFAF93BF)
                          : null,
                    ),
                  ),
                  SizedBox(width: 2.w),
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
          SizedBox(height: 2.h),
          GestureDetector(
            onTap: () {
              setState(() {
                changeLanguage(context, 'en');
              });
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.only(left: 6.w),
              child: Row(
                children: [
                  Container(
                    width: 5.3.w,
                    height: 2.5.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.locale == Locale("en")
                            ? Color(0xFFAF93BF)
                            : Color(0xFF817F82),
                        width: 0.5.w,
                      ),
                      borderRadius: BorderRadius.circular(4.4.w),
                      color: context.locale == Locale("en")
                          ? Color(0xFFAF93BF)
                          : null,
                    ),
                  ),
                  SizedBox(width: 2.w),
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
          SizedBox(height: 5.h),
        ],
      ),
    );
  }
}
