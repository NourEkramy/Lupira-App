import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/Formating/text_style_format.dart';

class OperationButtonModule extends StatelessWidget {
  Color borderColor;
  Color buttonColor;
  Color buttonTextColor;
  String buttonText;
  Widget? loadingIndicator;
  bool isLoading;
  VoidCallback onTap;

  OperationButtonModule({
    super.key,
    required this.borderColor,
    required this.buttonColor,
    this.buttonText = "",
    required this.buttonTextColor,
    required this.onTap,
    this.loadingIndicator,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        padding: EdgeInsets.symmetric(vertical: 1.8.h, horizontal: 8.w),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: borderColor,
            width: 0.5.w,
          ),
          borderRadius: BorderRadius.circular(2.6.w),
        ),
        minimumSize: Size(double.infinity, 5.7.h),
      ),
      child: isLoading
          ? loadingIndicator
          : Text(
              buttonText,
              style: TextStyleFormat.passwordPageSubTitle
                  .copyWith(color: buttonTextColor),
            ),
    );
  }
}
