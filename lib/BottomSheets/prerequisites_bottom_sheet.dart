import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sizer/sizer.dart';
import '../BaseScreen/Layout/main_layout.dart';
import '../Detection/detection_screen.dart';

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
    return Container(
      height: 90.h,
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
              'prerequisites'.tr(),
              style: TextStyle(
                color: Color(0xFF3D1A57),
                fontSize: 32,
                fontFamily: 'Inder',
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
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Inder',
                          color: Color(0xFF3D1A57),
                        ),
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
                                  padding: EdgeInsets.symmetric(vertical: 0.8.h),
                                  child: Text(
                                    "• Anti-nuclear Antibody (ANA)",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Inder',
                                        color: Color(0xFF4b4a4c)),
                                  ),
                                ),
                              ),
                              WidgetSpan(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 0.8.h),
                                  child: Text(
                                    "• Complete Blood Count (CBC)",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Inder',
                                        color: Color(0xFF4b4a4c)),
                                  ),
                                ),
                              ),
                              WidgetSpan(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 0.8.h),
                                  child: Text(
                                    "• Direct antiglobulin (direct coombs) test",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Inder',
                                        color: Color(0xFF4b4a4c)),
                                  ),
                                ),
                              ),
                              WidgetSpan(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 0.8.h),
                                  child: Text(
                                    "• Urine test",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Inder',
                                        color: Color(0xFF4b4a4c)),
                                  ),
                                ),
                              ),
                              WidgetSpan(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 0.8.h),
                                  child: Text(
                                    "• Solid phase enzyme-linked immunosorbent assay",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Inder',
                                        color: Color(0xFF4b4a4c)),
                                  ),
                                ),
                              ),
                              WidgetSpan(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 0.8.h),
                                  child: Text(
                                    "• CH50, CH100, Total complement test",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Inder',
                                        color: Color(0xFF4b4a4c)),
                                  ),
                                ),
                              ),
                              WidgetSpan(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 0.8.h),
                                  child: Text(
                                    "• Kidney biopsy",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Inder',
                                        color: Color(0xFF4b4a4c)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        "followingOptional".tr(),
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Inder',
                          color: Color(0xFF3D1A57),
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
                                  padding: EdgeInsets.symmetric(vertical: 0.8.h),
                                  child: Text(
                                    "• PTT, LA-sensitive PTT or dilute Russell viper venom test",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Inder',
                                        color: Color(0xFF4b4a4c)),
                                  ),
                                ),
                              ),
                              WidgetSpan(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 0.8.h),
                                  child: Text(
                                    "• Chest X-ray or Ultrasound or computed tomography (CT)",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Inder',
                                        color: Color(0xFF4b4a4c)),
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
                                      child: Text(
                                        'understoodPrerequisites'.tr(),
                                        style: TextStyle(
                                          fontFamily: 'Inder',
                                          fontSize: 16,
                                          color: Color(0xFF3D1A57),
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
                                        color: Color(0xffD6101D),
                                        size: 18.sp,
                                      ),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      Text(
                                        "confirmStartDetection".tr(),
                                        style: TextStyle(
                                          color: Color(0xffD6101D),
                                          fontFamily: "Inder",
                                          fontSize: 15,
                                        ),
                                      ),
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
                                  horizontal: 6.7.w,
                                  vertical: 0.6.h,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xffD6101D),
                                    width: 0.5.w,
                                  ),
                                  borderRadius: BorderRadius.circular(2.6.w),
                                ),
                                child: Text(
                                  "close".tr(),
                                  style: TextStyle(
                                    color: Color(0xffD6101D),
                                    fontFamily: "Inder",
                                    fontSize: 19,
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
                                  backgroundColor: const Color(0xFF502371),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2.6.w),
                                  ),
                                ),
                                child: Text(
                                  "start".tr(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Inder",
                                    fontSize: 19,
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
