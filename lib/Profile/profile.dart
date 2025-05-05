import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:untitled/Modules/drop_down_list_module.dart';
import 'package:untitled/Profile/profile_api.dart';
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
  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjMxMjAsImlhdCI6MTc0NjQ0NzI5NywiZXhwIjoxNzQ2NDUwODk3fQ.iHroI1td5lXa7uTeH3XGRRA303w7gvokd5iYfLBvtsE";
  String? selectedCountry;
  String? selectedGender;
  String? selectedEthnicity;
  bool isUpdating = false;
  Country? selectedPhoneCountry;

  static List<Map<String, dynamic>> textFields = [
    {
      'validators': [
        FormBuilderValidators.minLength(5,
            errorText: 'Username must be at least 5 characters long!'),
        FormBuilderValidators.match(
          RegExp(r'^[a-zA-Z0-9._]+$'),
          errorText:
              'Username can only contain letters, numbers, periods, and underscores!',
        ),
      ],
      'title': 'Username',
    },
    {
      'validators': [
        FormBuilderValidators.email(
            errorText: 'Please enter a valid email address!'),
      ],
      'title': 'Email',
    },
    {
      'title': 'Date of birth',
      'suffix': Icon(Icons.calendar_today_outlined),
    },
    {
      'title': 'Phone',
    },
  ];

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  Future<void> loadProfile() async {
    try {
      final data = await ProfileApi.fetchProfile(token);

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
      String phone =  selectedPhoneCountry != null
          ? "+${selectedPhoneCountry!.phoneCode}$phoneNumber"
          : phoneNumber;
      setState(() {
        isUpdating = true;
      });

      try {
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

        print('status: $success');
        print('message: $message');
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                message,
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: success ? Colors.green : Color(0xFFB9433E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              duration: Duration(seconds: 3),
            ),
          );
          await loadProfile();
          setState(() {
            isEditable = false;
            isUpdating = false;
            isPhoneEditable = false;
          });
        }else{
          setState(() {
            isUpdating = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
              backgroundColor: Color(0xFFB9433E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
            ),
          );
        }

        print('Form Values: $values');
      } catch (e) {
        setState(() {
          isUpdating = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Updating data error: $e"),
            backgroundColor: Color(0xFFB9433E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var hintData;
    return Scaffold(
      backgroundColor: Color(0xFFDEDAE0),
      appBar: AppBar(
        backgroundColor: Color(0xFF744199),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Profile',
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'Alegreya',
                color: Color(0xFFEBE4E4),
              ),
            ),
          ],
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: FormBuilder(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                    top: 32,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Color(0xFFABABAB),
                                    width: 3,
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: 65,
                                  backgroundColor: Colors.transparent,
                                  child: Icon(
                                    Icons.person,
                                    color: Color(0xFFABABAB),
                                    size: 125,
                                  ),
                                ),
                              ),
                              CircleAvatar(
                                radius: 18,
                                backgroundColor: Color(0xFFD9D9D9),
                                child: Icon(
                                  Icons.edit,
                                  size: 22,
                                  color: Color(0xFFABABAB),
                                ),
                              ),
                            ],
                          ),
                        ),
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
                                      errorText:
                                          'Please enter the phone number'),
                                  FormBuilderValidators.match(
                                      RegExp(r'^\d{6,15}$'),
                                      errorText: 'Enter a valid phone number'),
                                ]),
                                builder: (FormFieldState<String?> field) {
                                  final hasError = field.hasError;

                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.02),
                                      Text(
                                        textField['title'],
                                        style: TextStyle(
                                          fontFamily: 'Inder',
                                          fontSize: 18,
                                          color: Color(0xFF4B4A4C),
                                        ),
                                      ),
                                      SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.005),
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
                                              horizontal: 12, vertical: 3),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFDEDAE0),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: hasError
                                                  ? Color(0xFFB9433E)
                                                  : Color(0xFFABABAB),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                selectedPhoneCountry != null
                                                    ? '+${selectedPhoneCountry!.phoneCode}'
                                                    : 'Code',
                                                style: TextStyle(
                                                  fontFamily: 'Inder',
                                                  color: selectedPhoneCountry !=
                                                          null
                                                      ? Color(0xFF4B4A4C)
                                                      : Color(0xFF817F82),
                                                  fontSize: 16,
                                                ),
                                              ),
                                              SizedBox(width: 8),
                                              Container(
                                                width: 1,
                                                height: 24,
                                                color: Color(0xFF4B4A4C),
                                              ),
                                              SizedBox(width: 8),
                                              Expanded(
                                                child: TextField(
                                                  keyboardType:
                                                      textField['keyboardType'],
                                                  onChanged: field.didChange,
                                                  style: TextStyle(
                                                    color: Color(0xFF4B4A4C),
                                                    fontFamily: 'Inder',
                                                  ),
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: textField['hint'],
                                                    hintStyle: TextStyle(
                                                      color: Color(0xFFABABAB),
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
                                          padding: const EdgeInsets.only(
                                              top: 6, left: 12),
                                          child: Text(
                                            field.errorText ?? '',
                                            style: TextStyle(
                                              color: Color(0xFFB9433E),
                                              fontSize: 12,
                                              fontFamily: 'Inder',
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
                                if(index == 2){
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
                        SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.01),
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
                              name: 'Gender',
                              options: ['Male', 'Female'],
                              hintColor: Color(0xFF4B4A4C),
                              hintText: 'Select Gender',
                              textColor: Color(0xFF4B4A4C),
                              borderColor: Color(0xFFABABAB),
                              text: 'Gender',
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
                            height: MediaQuery.sizeOf(context).height * 0.03),
                        FormBuilderField<Country>(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          name: 'country',
                          builder: (FormFieldState<Country?> field) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Country',
                                  style: TextStyle(
                                    fontFamily: 'Inder',
                                    fontSize: 18,
                                    color: Color(0xFF4B4A4C),
                                  ),
                                ),
                                SizedBox(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.005),
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
                                            field.didChange(
                                                country); // important
                                            setState(() {
                                              selectedCountry =
                                                  country.name; // optional for display
                                            });
                                          },
                                        );
                                      });
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 16),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFDEDAE0),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: field.hasError
                                            ? Color(0xFFB9433E)
                                            : Color(0xFFABABAB),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          selectedCountry ??
                                              'Select country',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Inder',
                                            color: selectedCountry == null
                                                ? Color(0xFF817F82)
                                                : Color(0xFF4B4A4C),
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          color: Color(0xFF606060),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                if (field.hasError)
                                  Padding(
                                    padding: EdgeInsets.only(top: 5, left: 8),
                                    child: Text(
                                      field.errorText ?? '',
                                      style: TextStyle(
                                        color: Color(0xFFB9433E),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                        SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.01),
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
                              initialProfileChoice:
                                  profileData?.data?.ethnicity,
                              name: 'Ethnicity',
                              options: [
                                'Asian or Pacific Islander',
                                'Black or African American',
                                'Hispanic or Latino',
                                'Native American or Alaskan Native',
                                'White or Caucasian',
                                'Multoracial or Biracial',
                                'A race/ethnicity not listed here'
                              ],
                              hintColor: Color(0xFF4B4A4C),
                              hintText: 'Select Ethnicity',
                              textColor: Color(0xFF4B4A4C),
                              borderColor: Color(0xFFABABAB),
                              text: 'Ethnicity',
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
                            height: MediaQuery.sizeOf(context).height * 0.035),
                        if (isEditable && !isUpdating)
                          Center(
                            child: ElevatedButton(
                              onPressed: updateProfile,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF49146D),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Color(0xFF49146D),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: Text(
                                'Save changes',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Inder',
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          )
                        else
                          SizedBox(),
                        SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.02),
                      ],
                    ),
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
