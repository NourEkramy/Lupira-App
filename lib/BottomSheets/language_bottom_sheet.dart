import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/Formating/text_style_format.dart';
import '../Formating/colors_format.dart';

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
    bool isArabic = context.locale.languageCode == 'ar';
    return Container(
      decoration: BoxDecoration(
        color: ColorsFormat.credentialsCardColor,
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
              color: ColorsFormat.border_backgroundWhiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4.4.w),
                topRight: Radius.circular(4.4.w),
              ),
            ),
            width: double.infinity,
            child: Text(
              textAlign: TextAlign.center,
              'selectLanguage'.tr(),
              style: TextStyleFormat.bottomSheetTitle
                  .copyWith(color: ColorsFormat.darckPruble),
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
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Row(
                children: [
                  Container(
                    width: 5.3.w,
                    height: 2.5.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.locale == Locale("ar")
                            ? ColorsFormat.languagePurble
                            : ColorsFormat.titleColor,
                        width: 0.5.w,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: context.locale == Locale("ar")
                          ? ColorsFormat.languagePurble
                          : null,
                    ),
                  ),
                  SizedBox(width: isArabic ? 3.w : 2.w),
                  Text(
                    'arabic'.tr(),
                    style: TextStyleFormat.passwordSubTitle
                        .copyWith(color: ColorsFormat.text_dividerColor),
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
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Row(
                children: [
                  Container(
                    width: 5.3.w,
                    height: 2.5.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.locale == Locale("en")
                            ? ColorsFormat.languagePurble
                            : ColorsFormat.titleColor,
                        width: 0.5.w,
                      ),
                      borderRadius: BorderRadius.circular(4.4.w),
                      color: context.locale == Locale("en")
                          ? ColorsFormat.languagePurble
                          : null,
                    ),
                  ),
                  SizedBox(width:  isArabic ? 3.w : 2.w),
                  Text(
                    'english'.tr(),
                    style: TextStyleFormat.passwordSubTitle
                        .copyWith(color: ColorsFormat.text_dividerColor),
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
