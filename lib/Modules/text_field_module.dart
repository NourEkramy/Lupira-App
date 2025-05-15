import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/Formating/text_style_format.dart';

class TextFieldModule extends StatelessWidget {
  String textFieldTitle;
  String hintTextTitle;
  Color hintTextColor;
  Color titelTextColor;
  Color borderColor;
  Color backgroundColor;
  Widget? suffix;
  TextInputType? textFieldType;
  bool obscureText;
  bool isReadOnly;
  VoidCallback? onTap;
  List<FormFieldValidator<String>>? validators;
  String name;
  String? initialProfileData;

  TextFieldModule({
    super.key,
    required this.name,
    this.validators,
    required this.hintTextTitle,
    required this.textFieldTitle,
    required this.hintTextColor,
    required this.titelTextColor,
    required this.borderColor,
    required this.backgroundColor,
    required this.textFieldType,
    this.initialProfileData,
    this.obscureText = false,
    this.isReadOnly = false,
    this.onTap,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 3.h),
        Text(
          textFieldTitle,
          style: TextStyleFormat.textFieldStyle.copyWith(color: titelTextColor),
        ),
        SizedBox(height: 0.5.h),
        FormBuilderTextField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onTap: onTap,
          initialValue: initialProfileData,
          readOnly: isReadOnly,
          obscureText: obscureText,
          keyboardType: textFieldType,
          style:
              TextStyleFormat.snackBarMessage.copyWith(color: titelTextColor),
          decoration: InputDecoration(
            errorMaxLines: 3,
            suffixIcon: suffix ?? SizedBox(),
            hintText: hintTextTitle,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.all(Radius.circular(2.6.w))),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.all(Radius.circular(2.6.w))),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.all(Radius.circular(2.6.w))),
            hintStyle:
                TextStyleFormat.snackBarMessage.copyWith(color: hintTextColor),
            filled: true,
            fillColor: backgroundColor,
          ),
          name: name,
          validator: FormBuilderValidators.compose(validators ?? []),
        ),
      ],
    );
  }
}
