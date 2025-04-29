import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

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
    this.isReadOnly=true,
    this.initialProfileChoice,
    this.validators,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Inder',
            fontSize: 18,
            color: textColor,
          ),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.005),
        FormBuilderDropdown<String>(
          enabled: isReadOnly,
          initialValue: initialProfileChoice,
          dropdownColor: Color(0xFFDEDAE0),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            filled: true,
            fillColor: backgroundColor,
          ),
          hint: Text(
            hintText,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Inder',
              color: hintColor,
            ),
          ),
          items: options.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                  fontFamily: 'Inder',
                  fontSize: 16,
                  color: textColor,
                ),
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
