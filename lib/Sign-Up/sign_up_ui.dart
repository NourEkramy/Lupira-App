import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/Formating/colors_format.dart';
import 'package:untitled/Formating/text_style_format.dart';
import 'package:untitled/Log-In/log_in_ui.dart';
import 'package:untitled/Modules/authentication_button_module.dart';
import 'package:untitled/Modules/drop_down_list_module.dart';
import 'package:untitled/Modules/operation_button_module.dart';
import 'package:untitled/Modules/text_field_module.dart';
import 'package:untitled/Modules/user_credentials_card_module.dart';
import 'package:untitled/Sign-Up/sign_up_api.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  static const String routName = "SignUp";

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormBuilderState>();

  Country? selectedCountry;
  Country? selectedPhoneCountry;
  String? selectedGender;
  String? selectedEthnicity;
  bool _isLoading = false;

  List<Map<String, dynamic>> textFields = [
    {
      'validators': [
        FormBuilderValidators.required(errorText: "usernameRequired".tr()),
        FormBuilderValidators.minLength(5,
            errorText: "usernameCharLength".tr()),
        FormBuilderValidators.match(
          RegExp(r'^[a-zA-Z0-9._]+$'),
          errorText: "validUsername".tr(),
        ),
      ],
      'name': "Username",
      'title': "username".tr(),
      'hint': "enterUsername".tr(),
    },
    {
      'validators': [
        FormBuilderValidators.required(errorText: "emailRequired".tr()),
        FormBuilderValidators.email(errorText: "emailValidRequired".tr()),
      ],
      'name': 'Email',
      'title': 'email'.tr(),
      'hint': 'useremail@placeholder.com',
      'keyboardType': TextInputType.emailAddress,
    },
    {
      'validators': [
        FormBuilderValidators.required(errorText: "passwordRequired".tr()),
        FormBuilderValidators.minLength(8,
            errorText: "passwordValidLength".tr()),
        FormBuilderValidators.match(
          RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).+$'),
          errorText:
              'Password must include at least one lowercase letter, one uppercase letter, one number, and one special character!',
        ),
      ],
      'name': 'Password',
      'title': "password".tr(),
      'hint': "enterPassword".tr(),
      'keyboardType': TextInputType.visiblePassword,
    },
    {
      'name': 'Confirm password',
      'title': "confirmPassword".tr(),
      'hint': 'enterPassword'.tr(),
      'keyboardType': TextInputType.visiblePassword,
    },
    {
      'validators': [
        FormBuilderValidators.required(errorText: "DOBrequired".tr()),
      ],
      'name': 'Date of birth',
      'title': "dateOfBirth".tr(),
      'hint': 'DD/MM/YYYY',
      'suffix': Icon(
        Icons.calendar_today_outlined,
        color: Colors.grey,
      ),
      'isReadOnly': true,
    },
    {
      'validators': [
        FormBuilderValidators.required(errorText: "phoneRequired".tr()),
      ],
      'name': 'Phone',
      'title': 'phone'.tr(),
      'hint': "enterPhone".tr(),
      'keyboardType': TextInputType.phone,
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> signUp() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      setState(() => _isLoading = true);
      final values = _formKey.currentState!.value;

      String userName = values['Username'];
      String email = values['Email'];
      String dateOfBirth = values['Date of birth'];
      String phoneNumber = values['Phone'];

      String phone = "+${selectedPhoneCountry!.phoneCode}$phoneNumber";
      String country = selectedCountry!.name;

      try {
        final response = await SignUpApi.signupUser(
          username: userName,
          email: email,
          password: values['Password'],
          confirmPassword: values['Confirm password'],
          dateOfBirth: dateOfBirth,
          phoneNumber: phone,
          gender: selectedGender!,
          country: country,
          ethnicity: selectedEthnicity!,
        );

        bool success = response['success'];
        String message = response['message'];

        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                message,
                style: TextStyleFormat.snackBarMessage.copyWith(
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.8.w),
              ),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.symmetric(
                horizontal: 2.w,
                vertical: 2.h,
              ),
              duration: Duration(seconds: 5),
            ),
          );
          setState(() => _isLoading = false);

          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 250),
              pageBuilder: (context, animation, secondaryAnimation) => LogIn(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                var begin = Offset(0.25.w, 0.0); // from right
                const end = Offset.zero;
                return SlideTransition(
                  position: animation.drive(
                    Tween(
                      begin: begin,
                      end: end,
                    ).chain(
                      CurveTween(curve: Curves.ease),
                    ),
                  ),
                  child: child,
                );
              },
            ),
          );
        } else {
          setState(() => _isLoading = false);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message,
                  style: TextStyleFormat.snackBarMessage.copyWith(
                    color: Colors.white,
                  )),
              backgroundColor: ColorsFormat.darckRedError,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.8.w),
              ),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.symmetric(
                horizontal: 2.w,
                vertical: 2.h,
              ),
              duration: Duration(seconds: 5),
            ),
          );
        }
      } catch (e) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "$e",
              style: TextStyleFormat.snackBarMessage.copyWith(
                color: Colors.white,
              ),
            ),
            backgroundColor: ColorsFormat.darckRedError,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.8.w),
            ),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(
              horizontal: 2.w,
              vertical: 2.h,
            ),
            duration: Duration(seconds: 5),
          ),
        );
      }
    }
  }


  Future<bool> goToLogin(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => LogIn(),
    );
    return result == true;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) async {
        if (didPop) return;

        final shouldExit = await goToLogin(context);

        if (context.mounted && shouldExit == true) {
          Navigator.pop(context, result);
        }
      },
      child: Scaffold(
        body: UserCredentialsCardModule(
          cardBody: FormBuilder(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 5.5.h),
                Text(
                  'signup'.tr(),
                  style: TextStyleFormat.pageTitle.copyWith(
                    color: ColorsFormat.pageTitlePurble,
                  ),
                ),
                SizedBox(height: 1.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var textField = textFields[index];

                            final customValidator =
                                textField['name'] == 'Confirm password'
                                    ? [
                                        (val) {
                                          final password = _formKey.currentState
                                              ?.fields['Password']?.value;
                                          if (val == null || val.isEmpty)
                                            return "confirmPasswordRequired".tr();
                                          if (val != password)
                                            return "noMatchPassword".tr();
                                          return null;
                                        }
                                      ]
                                    : textField['validators'];

                            if (index == 5) {
                              return FormBuilderField<String>(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                name: 'Phone',
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                      errorText: "phoneRequiredError".tr()),
                                  FormBuilderValidators.match(
                                    RegExp(r'^\d{6,15}$'),
                                    errorText: "phoneValid".tr(),
                                  ),
                                ]),
                                builder: (FormFieldState<String?> field) {
                                  final hasError = field.hasError;

                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 2.h),
                                      Text(
                                        textField['title'],
                                        style: TextStyleFormat.textFieldStyle
                                            .copyWith(
                                          color: ColorsFormat.titleColor,
                                        ),
                                      ),
                                      SizedBox(height: 0.5.h),
                                      GestureDetector(
                                        onTap: () {
                                          showCountryPicker(
                                            context: context,
                                            showPhoneCode: true,
                                            onSelect: (Country country) {
                                              setState(() {
                                                selectedPhoneCountry = country;
                                              });
                                            },
                                          );
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 2.8.w,
                                            vertical: 0.4.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color: ColorsFormat
                                                .border_backgroundWhiteColor,
                                            borderRadius:
                                                BorderRadius.circular(2.6.w),
                                            border: Border.all(
                                              color: hasError
                                                  ? ColorsFormat.darckRedError
                                                  : Colors.transparent,
                                              width: 0.3.w,
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                selectedPhoneCountry != null
                                                    ? '+${selectedPhoneCountry!.phoneCode}'
                                                    : 'code'.tr(),
                                                style: TextStyleFormat
                                                    .textFieldStyle
                                                    .copyWith(
                                                  color: selectedPhoneCountry !=
                                                          null
                                                      ? ColorsFormat.titleColor
                                                      : ColorsFormat.hintColor,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2.w,
                                              ),
                                              Container(
                                                width: 0.2.w,
                                                height: 3.h,
                                                color: Colors.grey,
                                              ),
                                              SizedBox(
                                                width: 2.w,
                                              ),
                                              Expanded(
                                                child: TextField(
                                                  keyboardType:
                                                      textField['keyboardType'],
                                                  onChanged: field.didChange,
                                                  style: TextStyleFormat
                                                      .textFieldStyle
                                                      .copyWith(
                                                    color:
                                                        ColorsFormat.titleColor,
                                                  ),
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: textField['hint'],
                                                    hintStyle: TextStyleFormat
                                                        .textFieldStyle
                                                        .copyWith(
                                                      color:
                                                          ColorsFormat.hintColor,
                                                    ),
                                                    // errorText removed here
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      if (hasError)
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 0.5.h, left: 2.8.w),
                                          child: Text(
                                            field.errorText ?? '',
                                            style: TextStyleFormat.textFieldError
                                                .copyWith(
                                              color: ColorsFormat.darckRedError,
                                            ),
                                          ),
                                        ),
                                    ],
                                  );
                                },
                              );
                            }
                            return TextFieldModule(
                              validators: customValidator,
                              onTap: index == 4 ? selectDate : null,
                              isReadOnly: textField['isReadOnly'] ?? false,
                              textFieldType: textField['keyboardType'],
                              obscureText: textField['keyboardType'] ==
                                  TextInputType.visiblePassword,
                              textFieldTitle: textField['title'],
                              hintTextTitle: textField['hint'],
                              hintTextColor: ColorsFormat.hintColor,
                              titelTextColor: ColorsFormat.titleColor,
                              borderColor: Colors.transparent,
                              backgroundColor:
                                  ColorsFormat.border_backgroundWhiteColor,
                              suffix: textField['suffix'],
                              name: textField['name'],
                            );
                          },
                          itemCount: textFields.length,
                        ),
                        DropDownListModule(
                          isReadOnly: false,
                          options: ["male".tr(), "female".tr()],
                          hintColor: ColorsFormat.hintColor,
                          hintText: 'selectGender'.tr(),
                          textColor: ColorsFormat.titleColor,
                          borderColor: ColorsFormat.border_backgroundWhiteColor,
                          text: 'gender'.tr(),
                          backgroundColor:
                              ColorsFormat.border_backgroundWhiteColor,
                          name: 'Gender',
                          validators: [
                            FormBuilderValidators.required(
                                errorText: "genderRequired".tr())
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value;
                            });
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        FormBuilderField<Country>(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          name: 'country',
                          validator: FormBuilderValidators.required(
                              errorText: "countryRequired".tr()),
                          builder: (FormFieldState<Country?> field) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "country".tr(),
                                  style: TextStyleFormat.textFieldStyle.copyWith(
                                    color: ColorsFormat.titleColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showCountryPicker(
                                      context: context,
                                      onSelect: (Country country) {
                                        field.didChange(country); // important
                                        setState(() {
                                          selectedCountry =
                                              country; // optional for display
                                        });
                                      },
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 2.8.w,
                                      vertical: 1.8.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorsFormat
                                          .border_backgroundWhiteColor,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: field.hasError
                                            ? ColorsFormat.darckRedError
                                            : Colors.transparent,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          selectedCountry?.name ??
                                              "selectCountry".tr(),
                                          style: TextStyleFormat.textFieldStyle
                                              .copyWith(
                                            color: selectedCountry == null
                                                ? ColorsFormat.hintColor
                                                : ColorsFormat.titleColor,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          color: ColorsFormat.suffixColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                if (field.hasError)
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 0.6.h,
                                      left: 2.w,
                                    ),
                                    child: Text(
                                      field.errorText ?? '',
                                      style:
                                          TextStyleFormat.textFieldError.copyWith(
                                        color: ColorsFormat.darckRedError,
                                      ),
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                        DropDownListModule(
                          isReadOnly: false,
                          options: [
                            "ethnicityOption1".tr(),
                            "ethnicityOption2".tr(),
                            "ethnicityOption3".tr(),
                            "ethnicityOption4".tr(),
                            "ethnicityOption5".tr(),
                            "ethnicityOption6".tr(),
                            "ethnicityOption7".tr()
                          ],
                          hintColor: ColorsFormat.hintColor,
                          hintText: 'selectEthnicity'.tr(),
                          textColor: ColorsFormat.titleColor,
                          borderColor: ColorsFormat.border_backgroundWhiteColor,
                          text: 'ethnicity'.tr(),
                          backgroundColor:
                              ColorsFormat.border_backgroundWhiteColor,
                          name: 'Ethnicity',
                          validators: [
                            FormBuilderValidators.required(
                                errorText: "ethnicityRequired".tr())
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedEthnicity = value;
                            });
                          },
                        ),
                        SizedBox(height: 5.h),
                        OperationButtonModule(
                          onTap: signUp,
                          borderColor: ColorsFormat.button_linksColor,
                          buttonColor: ColorsFormat.button_linksColor,
                          buttonText: "signup".tr(),
                          buttonTextColor: Colors.white,
                          isLoading: _isLoading,
                          loadingIndicator: SizedBox(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 3.5.sp,
                            ),
                            height: 3.h,
                            width: 6.w,
                          ),
                        ),
                        AuthenticationButtonModule(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(
                                  transitionDuration: Duration(milliseconds: 300),
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) =>
                                          LogIn(),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    var begin = Offset(0.25.w, 0.0); // from right
                                    const end = Offset.zero;
                                    return SlideTransition(
                                      position: animation.drive(
                                        Tween(
                                          begin: begin,
                                          end: end,
                                        ).chain(
                                          CurveTween(curve: Curves.ease),
                                        ),
                                      ),
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            },
                            conditionOperation: "login".tr(),
                            conditionQuestion: "haveAccount".tr()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> selectDate() async {
    final DateTime now = DateTime.now();
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 100),
      lastDate: now,
    );

    if (picked != null) {
      setState(() {
        String formattedDate =
            "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";

        _formKey.currentState?.fields['Date of birth']
            ?.didChange(formattedDate);
      });
    }
  }
}
