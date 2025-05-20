import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/Formating/text_style_format.dart';

class TextFieldModule extends StatefulWidget {
  final String textFieldTitle;
  final String hintTextTitle;
  final Color hintTextColor;
  final Color titelTextColor;
  final Color borderColor;
  final Color backgroundColor;
  final Widget? suffix;
  final TextInputType? textFieldType;
  final bool obscureText;
  final bool isReadOnly;
  final VoidCallback? onTap;
  final List<FormFieldValidator<String>>? validators;
  final String name;
  final String? initialProfileData;

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
  State<TextFieldModule> createState() => _TextFieldModuleState();
}

class _TextFieldModuleState extends State<TextFieldModule> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Widget? _buildSuffixIcon() {
    if (widget.obscureText) {
      return IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility_off : Icons.visibility,
          color: Colors.grey,
        ),
        onPressed: _toggleVisibility,
      );
    } else {
      return widget.suffix; // Use custom suffix if provided
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 3.h),
        Text(
          widget.textFieldTitle,
          style: TextStyleFormat.textFieldStyle.copyWith(color: widget.titelTextColor),
        ),
        SizedBox(height: 0.5.h),
        FormBuilderTextField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onTap: widget.onTap,
          initialValue: widget.initialProfileData,
          readOnly: widget.isReadOnly,
          obscureText: _obscureText,
          keyboardType: widget.textFieldType,
          style:
              TextStyleFormat.snackBarMessage.copyWith(color: widget.titelTextColor),
          decoration: InputDecoration(
            errorMaxLines: 3,
            suffixIcon: _buildSuffixIcon() ?? SizedBox(),
            hintText: widget.hintTextTitle,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: widget.borderColor),
                borderRadius: BorderRadius.all(Radius.circular(2.6.w))),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: widget.borderColor),
                borderRadius: BorderRadius.all(Radius.circular(2.6.w))),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: widget.borderColor),
                borderRadius: BorderRadius.all(Radius.circular(2.6.w))),
            hintStyle:
                TextStyleFormat.snackBarMessage.copyWith(color: widget.hintTextColor),
            filled: true,
            fillColor: widget.backgroundColor,
          ),
          name: widget.name,
          validator: FormBuilderValidators.compose(widget.validators ?? []),
        ),
      ],
    );
  }
}
