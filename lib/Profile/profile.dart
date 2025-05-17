import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/Formating/text_style_format.dart';
import 'package:untitled/Modules/drop_down_list_module.dart';
import 'package:untitled/Profile/profile_api.dart';
import '../Formating/colors_format.dart';
import '../Models/user_profile_data_model.dart';
import '../Modules/text_field_module.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  static const String routName = "Profile";

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormBuilderState>();
  UserProfileDataModel? profileData;
  bool isLoading = true;
  bool isEditable = false;
  bool isPhoneEditable = false;
  String? selectedCountry;
  String? selectedGender;
  String? selectedEthnicity;
  bool isUpdating = false;
  Country? selectedPhoneCountry;

  static List<Map<String, dynamic>> textFields = [
    {
      'validators': [
        FormBuilderValidators.minLength(5,
            errorText: "usernameCharLength".tr()),
        FormBuilderValidators.match(
          RegExp(r'^[a-zA-Z0-9._]+$'),
          errorText: "validUsername".tr(),
        ),
      ],
      'title': "username".tr(),
    },
    {
      'validators': [
        FormBuilderValidators.email(errorText: "emailValidRequired".tr()),
      ],
      'title': "email".tr(),
    },
    {
      'title': "dateOfBirth".tr(),
      'suffix': Icon(Icons.calendar_today_outlined),
    },
    {
      'title': "phone".tr(),
    },
  ];

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  Future<void> loadProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var language = prefs.getString('selected_language') ??
          EasyLocalization.of(context)!.locale.languageCode;

      final data = await ProfileApi.fetchProfile(token!, language);

      if (data != null && data.data != null) {
        setState(() {
          profileData = data;
          selectedGender = data.data!.gender;
          selectedCountry = data.data!.country;
          selectedEthnicity = data.data!.ethnicity;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> updateProfile() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final values = _formKey.currentState!.value;

      String userName = values['Username'] ?? '';
      String email = values['Email'] ?? '';
      String dateOfBirth = values['Date of birth'] ?? '';
      String phoneNumber = values['Phone'] ?? '';
      String phone = selectedPhoneCountry != null
          ? "+${selectedPhoneCountry!.phoneCode}$phoneNumber"
          : phoneNumber;
      setState(() {
        isUpdating = true;
      });

      try {
        final prefs = await SharedPreferences.getInstance();
        var token = prefs.getString('token');

        final response = await ProfileApi.applyProfileEdits(
          token: token ?? '',
          country: selectedCountry ?? '',
          dateOfBirth: dateOfBirth ?? '',
          email: email ?? '',
          ethnicity: selectedEthnicity ?? '',
          gender: selectedGender ?? '',
          phoneNumber: phone ?? '',
          username: userName ?? '',
        );

        bool success = response['success'];
        String message = response['message'];

        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                message,
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: success ? Colors.green : ColorsFormat.darckRedError,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.8.w),
              ),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
              duration: Duration(seconds: 3),
            ),
          );
          await loadProfile();
          setState(() {
            isEditable = false;
            isUpdating = false;
            isPhoneEditable = false;
          });
        } else {
          setState(() {
            isUpdating = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
              backgroundColor: ColorsFormat.darckRedError,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.8.w),
              ),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.symmetric(
                horizontal: 2.w,
                vertical: 2.h,
              ),
            ),
          );
        }
      } catch (e) {
        setState(() {
          isUpdating = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("$e"),
            backgroundColor: ColorsFormat.darckRedError,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.8.w),
            ),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(
              horizontal: 2.w,
              vertical: 2.h,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var hintData;
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : SingleChildScrollView(
            child: FormBuilder(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 2.w,
                  right: 2.w,
                  top: 2.h,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var textField = textFields[index];
                          if (index == 0)
                            hintData = profileData?.data?.username;
                          else if (index == 1)
                            hintData = profileData?.data?.email;
                          else if (index == 2)
                            hintData = profileData?.data?.dateOfBirth;
                          else
                            hintData = profileData?.data?.phoneNumber;

                          if (index == 3 && (isEditable && isPhoneEditable)) {
                            return FormBuilderField<String>(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              name: 'Phone',
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: "phoneRequiredError".tr()),
                                FormBuilderValidators.match(
                                    RegExp(r'^\d{6,15}$'),
                                    errorText: "phoneValid".tr()),
                              ]),
                              builder: (FormFieldState<String?> field) {
                                final hasError = field.hasError;

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Text(
                                      textField['title'],
                                      style: TextStyleFormat.textFieldStyle
                                          .copyWith(
                                        color: ColorsFormat.text_dividerColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
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
                                          color: ColorsFormat.border_backgroundWhiteColor,
                                          borderRadius:
                                              BorderRadius.circular(2.6.w),
                                          border: Border.all(
                                            color: hasError
                                                ? ColorsFormat.darckRedError
                                                : ColorsFormat.hintColor,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              selectedPhoneCountry != null
                                                  ? '+${selectedPhoneCountry!.phoneCode}'
                                                  : 'code'.tr(),
                                              style: TextStyleFormat.textFieldStyle
                                                  .copyWith(
                                                color:
                                                selectedPhoneCountry != null
                                                    ? Color(0xFF4B4A4C)
                                                    : Color(0xFF817F82),
                                              ),
                                            ),
                                            SizedBox(width: 2.w),
                                            Container(
                                              width: 0.2.w,
                                              height: 2.8.h,
                                              color: ColorsFormat.text_dividerColor,
                                            ),
                                            SizedBox(width: 2.w),
                                            Expanded(
                                              child: TextField(
                                                keyboardType:
                                                    textField['keyboardType'],
                                                onChanged: field.didChange,
                                                style: TextStyle(
                                                  color: ColorsFormat.text_dividerColor,
                                                  fontFamily: 'Inder',
                                                ),
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: textField['hint'],
                                                  hintStyle: TextStyle(
                                                    color: ColorsFormat.hintColor,
                                                    fontFamily: 'Inder',
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
                                          top: 0.6.h,
                                          left: 2.6.w,
                                        ),
                                        child: Text(
                                          field.errorText ?? '',
                                          style: TextStyleFormat.textFieldStyle
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
                            textFieldType: null,
                            name: textField['title'],
                            validators: textField['validators'],
                            textFieldTitle: textField['title'],
                            hintTextTitle: '',
                            initialProfileData: hintData ?? '',
                            isReadOnly: !isEditable,
                            hintTextColor: Color(0xFF4B4A4C),
                            titelTextColor: Color(0xFF4B4A4C),
                            borderColor: Color(0xFFABABAB),
                            backgroundColor: Color(0xFFDEDAE0),
                            suffix: textField['suffix'],
                            onTap: () {
                              if (index == 2) {
                                selectDate();
                              }
                              if (index == 3) {
                                setState(() {
                                  isPhoneEditable = true;
                                  if (!isEditable) {
                                    isEditable = true;
                                  }
                                });
                              } else if (!isEditable) {
                                setState(() {
                                  isEditable = true;
                                });
                              }
                            },
                          );
                        },
                        itemCount: textFields.length,
                      ),
                      SizedBox(height: 1.h),
                      GestureDetector(
                        onTap: () {
                          if (!isEditable) {
                            setState(() {
                              isEditable = true;
                            });
                          }
                        },
                        child: AbsorbPointer(
                          absorbing: !isEditable,
                          child: DropDownListModule(
                            isReadOnly: !isEditable,
                            initialProfileChoice: profileData?.data?.gender,
                            name: "Gender",
                            options: ["male".tr(), "female".tr()],
                            hintColor: ColorsFormat.text_dividerColor,
                            hintText: "selectGender".tr(),
                            textColor: ColorsFormat.text_dividerColor,
                            borderColor: ColorsFormat.hintColor,
                            text: "gender".tr(),
                            backgroundColor: Colors.transparent,
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      FormBuilderField<Country>(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        name: 'country',
                        builder: (FormFieldState<Country?> field) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "country".tr(),
                                style: TextStyleFormat.textFieldStyle
                                    .copyWith(
                                  color: ColorsFormat.text_dividerColor,
                                ),
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (!isEditable) {
                                    setState(() {
                                      isEditable = true;
                                    });
                                  }
                                  if (isEditable) {
                                    setState(() {
                                      showCountryPicker(
                                        context: context,
                                        onSelect: (Country country) {
                                          field.didChange(country); // important
                                          setState(() {
                                            selectedCountry = country
                                                .name; // optional for display
                                          });
                                        },
                                      );
                                    });
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 2.8.w,
                                    vertical: 1.8.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorsFormat.border_backgroundWhiteColor,
                                    borderRadius: BorderRadius.circular(2.4.w),
                                    border: Border.all(
                                      color: field.hasError
                                          ? ColorsFormat.darckRedError
                                          : ColorsFormat.hintColor,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        selectedCountry ?? "selectCountry".tr(),
                                        style: TextStyleFormat.textFieldStyle
                                            .copyWith(
                                          color: selectedCountry == null
                                              ? ColorsFormat.titleColor
                                              : ColorsFormat.text_dividerColor,
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
                                  padding:
                                      EdgeInsets.only(top: 0.6.h, left: 2.w),
                                  child: Text(
                                    field.errorText ?? '',
                                    style: TextStyleFormat.textFieldError.copyWith(color: ColorsFormat.darckRedError),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (!isEditable) {
                            setState(() {
                              isEditable = true;
                            });
                          }
                        },
                        child: AbsorbPointer(
                          absorbing: !isEditable,
                          child: DropDownListModule(
                            isReadOnly: !isEditable,
                            initialProfileChoice: profileData?.data?.ethnicity,
                            name: "Ethnicity",
                            options: [
                              "ethnicityOption1".tr(),
                              "ethnicityOption2".tr(),
                              "ethnicityOption3".tr(),
                              "ethnicityOption4".tr(),
                              "ethnicityOption5".tr(),
                              "ethnicityOption6".tr(),
                              "ethnicityOption7".tr(),
                            ],
                            hintColor: ColorsFormat.text_dividerColor,
                            hintText: "selectEthnicity".tr(),
                            textColor: ColorsFormat.text_dividerColor,
                            borderColor: ColorsFormat.hintColor,
                            text: "ethnicity".tr(),
                            backgroundColor: Colors.transparent,
                            onChanged: (value) {
                              setState(() {
                                selectedEthnicity = value;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3.5.h,
                      ),
                      if (isEditable && !isUpdating)
                        Center(
                          child: ElevatedButton(
                            onPressed: updateProfile,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorsFormat.button_linksColor,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: ColorsFormat.button_linksColor,
                                  width: 0.5.w,
                                ),
                                borderRadius: BorderRadius.circular(2.4.w),
                              ),
                            ),
                            child: Text(
                              "saveChanges".tr(),
                              style: TextStyleFormat.snackBarMessage.copyWith(color: Colors.white),
                            ),
                          ),
                        )
                      else
                        SizedBox(),
                      SizedBox(
                        height: 2.h,
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
