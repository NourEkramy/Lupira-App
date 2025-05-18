import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/Formating/text_style_format.dart';
import '../BaseScreen/Layout/main_layout.dart';
import '../Detection/detection_screen.dart';
import '../Formating/colors_format.dart';

class PrerequisitesBottomSheet extends StatefulWidget {
  const PrerequisitesBottomSheet({super.key});

  @override
  State<PrerequisitesBottomSheet> createState() => _PrerequisitesScreenState();
}

class _PrerequisitesScreenState extends State<PrerequisitesBottomSheet> {
  final _formKey = GlobalKey<FormBuilderState>();

  void startDetection() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final values = _formKey.currentState!.value;

      if (values['agree']) {
        Navigator.pop(context);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainLayout(
              title: "detection".tr(),
              showBottomNav: false,
              child: DetectionScreen(),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isArabic = context.locale.languageCode == 'ar';
    return Container(
      height: 90.h,
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
              'prerequisites'.tr(),
              style: TextStyleFormat.bottomSheetTitle
                  .copyWith(color: ColorsFormat.darckPruble,
              ),
            ),
          ),
          SizedBox(height: 3.h),
          Expanded(
            child: SingleChildScrollView(
              child: FormBuilder(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "followingMandatory".tr(),
                        style: TextStyleFormat.notFountText
                            .copyWith(color: ColorsFormat.darckPruble),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 3.8.w,
                          top: 1.4.h,
                          bottom: 1.2.h,
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 0.8.h),
                                  child: Text(
                                    "• Anti-nuclear Antibody (ANA)",
                                    style:
                                        TextStyleFormat.textFieldStyle.copyWith(
                                      color: ColorsFormat.text_dividerColor,
                                      fontSize: 16.5.sp,
                                    ),
                                  ),
                                ),
                              ),
                              WidgetSpan(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 0.8.h),
                                  child: Text(
                                    "• Complete Blood Count (CBC)",
                                    style:
                                        TextStyleFormat.textFieldStyle.copyWith(
                                      color: ColorsFormat.text_dividerColor,
                                      fontSize: 16.5.sp,
                                    ),
                                  ),
                                ),
                              ),
                              WidgetSpan(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 0.8.h),
                                  child: Text(
                                    "• Direct antiglobulin (direct coombs) test",
                                    style:
                                        TextStyleFormat.textFieldStyle.copyWith(
                                      color: ColorsFormat.text_dividerColor,
                                      fontSize: 16.5.sp,
                                    ),
                                  ),
                                ),
                              ),
                              WidgetSpan(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 0.8.h),
                                  child: Text(
                                    "• Urine test",
                                    style:
                                        TextStyleFormat.textFieldStyle.copyWith(
                                      color: ColorsFormat.text_dividerColor,
                                      fontSize: 16.5.sp,
                                    ),
                                  ),
                                ),
                              ),
                              WidgetSpan(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 0.8.h),
                                  child: Text(
                                    "• Solid phase enzyme-linked immunosorbent assay",
                                    style:
                                        TextStyleFormat.textFieldStyle.copyWith(
                                      color: ColorsFormat.text_dividerColor,
                                      fontSize: 16.5.sp,
                                    ),
                                  ),
                                ),
                              ),
                              WidgetSpan(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 0.8.h),
                                  child: Text(
                                    "• CH50, CH100, Total complement test",
                                    style:
                                        TextStyleFormat.textFieldStyle.copyWith(
                                      color: ColorsFormat.text_dividerColor,
                                      fontSize: 16.5.sp,
                                    ),
                                  ),
                                ),
                              ),
                              WidgetSpan(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 0.8.h),
                                  child: Text(
                                    "• Kidney biopsy",
                                    style:
                                        TextStyleFormat.textFieldStyle.copyWith(
                                      color: ColorsFormat.text_dividerColor,
                                      fontSize: 16.5.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        "followingOptional".tr(),
                        style: TextStyleFormat.notFountText.copyWith(
                          color: ColorsFormat.darckPruble,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 3.8.w,
                          top: 1.4.h,
                          bottom: 1.1.h,
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 0.8.h),
                                  child: Text(
                                    "• PTT, LA-sensitive PTT or dilute Russell viper venom test",
                                    style:
                                        TextStyleFormat.textFieldStyle.copyWith(
                                      color: ColorsFormat.text_dividerColor,
                                      fontSize: 16.5.sp,
                                    ),
                                  ),
                                ),
                              ),
                              WidgetSpan(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 0.8.h),
                                  child: Text(
                                    "• Chest X-ray or Ultrasound or computed tomography (CT)",
                                    style:
                                        TextStyleFormat.textFieldStyle.copyWith(
                                      color: ColorsFormat.text_dividerColor,
                                      fontSize: 16.5.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      FormBuilderField<bool>(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        name: 'agree',
                        initialValue: false,
                        validator: (value) {
                          if (value != true) {
                            return 'confirmStartDetection'.tr();
                          }
                          return null;
                        },
                        builder: (FormFieldState<bool?> field) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 1.1.h,
                                  bottom: 0.7.h,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                      value: field.value ?? false,
                                      onChanged: (value) {
                                        field.didChange(value);
                                      },
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(vertical: isArabic ? 7.0 : 0),
                                        child: Text(
                                          'understoodPrerequisites'.tr(),
                                          style: TextStyleFormat.snackBarMessage
                                              .copyWith(
                                            color: ColorsFormat.darckPruble,
                                            fontSize: 16.5.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (field.hasError)
                                Container(
                                  margin: EdgeInsets.only(
                                    right: 2.4.w,
                                    left: 2.4.w,
                                    bottom: 1.1.h,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.error_outline,
                                        color: ColorsFormat.lightRedError,
                                        size: 18.sp,
                                      ),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      Text("confirmStartDetection".tr(),
                                          style: TextStyleFormat.snackBarMessage
                                              .copyWith(
                                            color: ColorsFormat.lightRedError,
                                            fontSize: 15.2.sp,
                                          )),
                                    ],
                                  ),
                                )
                            ],
                          );
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 2.4.w,
                          vertical: 0.7.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 7.6.w,
                                  vertical: 0.6.h,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: ColorsFormat.lightRedError,
                                    width: 0.5.w,
                                  ),
                                  borderRadius: BorderRadius.circular(2.6.w),
                                ),
                                child: Text(
                                  "close".tr(),
                                  style:
                                      TextStyleFormat.textFieldStyle.copyWith(
                                    color: ColorsFormat.lightRedError,
                                    fontSize: 17.5.sp,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 27.w,
                              child: ElevatedButton(
                                onPressed: () {
                                  startDetection();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      ColorsFormat.button_linksColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2.6.w),
                                  ),
                                ),
                                child: Text(
                                  "start".tr(),
                                  style:
                                      TextStyleFormat.textFieldStyle.copyWith(
                                    color: Colors.white,
                                    fontSize: 17.5.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
