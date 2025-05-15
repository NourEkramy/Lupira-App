import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/Formating/text_style_format.dart';
import '../Formating/colors_format.dart';

class DropDownListModule extends StatelessWidget {
  String text;
  String hintText;
  Color borderColor;
  Color hintColor;
  Color textColor;
  Color backgroundColor;
  List<String> options;
  String name;
  List<FormFieldValidator<String>>? validators;
  ValueChanged<String?>? onChanged;
  String? initialProfileChoice;
  bool isReadOnly;

  DropDownListModule({
    super.key,
    required this.name,
    required this.options,
    required this.hintColor,
    required this.hintText,
    required this.textColor,
    required this.borderColor,
    required this.text,
    required this.backgroundColor,
    this.isReadOnly = true,
    this.initialProfileChoice,
    this.validators,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 2.h),
        Text(
          text,
          style: TextStyleFormat.textFieldStyle.copyWith(color: textColor),
        ),
        SizedBox(height: 0.5.h),
        FormBuilderDropdown<String>(
          enabled: !isReadOnly,
          initialValue: initialProfileChoice,
          dropdownColor: ColorsFormat.border_backgroundWhiteColor,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.all(Radius.circular(2.6.w))),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.all(Radius.circular(2.6.w))),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.all(Radius.circular(2.6.w))),
            filled: true,
            fillColor: backgroundColor,
          ),
          hint: Text(
            hintText,
            style: TextStyleFormat.snackBarMessage.copyWith(color: hintColor),
          ),
          items: options.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style:
                    TextStyleFormat.snackBarMessage.copyWith(color: textColor),
              ),
            );
          }).toList(),
          name: name,
          validator: FormBuilderValidators.compose(validators ?? []),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
