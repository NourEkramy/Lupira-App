import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
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
  // final List<TextEditingController> controllers = [];
  final _formKey = GlobalKey<FormBuilderState>();

  Country? selectedCountry;
  Country? selectedPhoneCountry;
  String? selectedGender;
  String? selectedEthnicity;

  List<Map<String, dynamic>> textFields = [
    {
      'validators': [
        FormBuilderValidators.required(errorText: 'Username is required'),
        FormBuilderValidators.minLength(5,
            errorText: 'Username must be at least 5 characters long!'),
        FormBuilderValidators.match(
          RegExp(r'^[a-zA-Z0-9._]+$'),
          errorText:
              'Username can only contain letters, numbers, periods, and underscores!',
        ),
      ],
      'name': 'Username',
      'title': 'Username',
      'hint': 'Enter username',
    },
    {
      'validators': [
        FormBuilderValidators.required(errorText: 'Email is required'),
        FormBuilderValidators.email(
            errorText: 'Please enter a valid email address!'),
      ],
      'name': 'Email',
      'title': 'Email',
      'hint': 'useremail@placeholder.com',
      'keyboardType': TextInputType.emailAddress,
    },
    {
      'validators': [
        FormBuilderValidators.required(errorText: 'Password is required'),
        FormBuilderValidators.minLength(8,
            errorText: 'Password must be at least 8 characters long!'),
        FormBuilderValidators.match(
          RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).+$'),
          errorText:
              'Password must include at least one lowercase letter, one uppercase letter, one number, and one special character!',
        ),
      ],
      'name': 'Password',
      'title': 'Password',
      'hint': 'Enter password',
      'keyboardType': TextInputType.visiblePassword,
    },
    {
      'name': 'Confirm password',
      'title': 'Confirm password',
      'hint': 'Enter password',
      'keyboardType': TextInputType.visiblePassword,
    },
    {
      'validators': [
        FormBuilderValidators.required(errorText: 'Date of birth is required'),
      ],
      'name': 'Date of birth',
      'title': 'Date of birth',
      'hint': 'DD/MM/YYYY',
      'suffix': Icon(
        Icons.calendar_today_outlined,
        color: Color(0xFF606060),
      ),
      'isReadOnly': true,
    },
    {
      'validators': [
        FormBuilderValidators.required(errorText: 'Phone is required'),
      ],
      'name': 'Phone',
      'title': 'Phone',
      'hint': 'Enter phone number',
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
      final values = _formKey.currentState!.value;

      String userName = values['Username'];
      String email = values['Email'];
      String dateOfBirth = values['Date of birth'];
      String phoneNumber = values['Phone'];

      String phone = "+${selectedPhoneCountry!.phoneCode}$phoneNumber";
      String country = selectedCountry!.name;

      try{
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
      }catch(e){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Signup error: $e"),
            backgroundColor: Color(0xFFB9433E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10,),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserCredentialsCardModule(
        cardBody: FormBuilder(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
              Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 48,
                  fontFamily: 'Alegreya',
                  color: Color(0xFF49146D),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
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
                                          return 'Please confirm your password';
                                        if (val != password)
                                          return 'Passwords do not match';
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
                                    errorText: 'Please enter the phone number'),
                                FormBuilderValidators.match(
                                    RegExp(r'^\d{6,15}$'),
                                    errorText: 'Enter a valid phone number'),
                              ]),
                              builder: (FormFieldState<String?> field) {
                                final hasError = field.hasError;

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.02),
                                    Text(
                                      textField['title'],
                                      style: TextStyle(
                                        fontFamily: 'Inder',
                                        fontSize: 18,
                                        color: Color(0xFF817F82),
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.sizeOf(context).height *
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
                                                : Colors.transparent,
                                            width: 1.5,
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
                                                color:
                                                    selectedPhoneCountry != null
                                                        ? Color(0xFF817F82)
                                                        : Color(0xFFABABAB),
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(width: 8),
                                            Container(
                                              width: 1,
                                              height: 24,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(width: 8),
                                            Expanded(
                                              child: TextField(
                                                keyboardType:
                                                    textField['keyboardType'],
                                                onChanged: field.didChange,
                                                style: TextStyle(
                                                  color: Color(0xFF817F82),
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
                            validators: customValidator,
                            onTap: index == 4 ? selectDate : null,
                            isReadOnly: textField['isReadOnly'] ?? false,
                            // textController: controllers[index],
                            textFieldType: textField['keyboardType'],
                            obscureText: textField['keyboardType'] ==
                                TextInputType.visiblePassword,
                            textFieldTitle: textField['title'],
                            hintTextTitle: textField['hint'],
                            hintTextColor: Color(0xFFABABAB),
                            titelTextColor: Color(0xFF817F82),
                            borderColor: Colors.transparent,
                            backgroundColor: Color(0xFFDEDAE0),
                            suffix: textField['suffix'],
                            name: textField['name'],
                          );
                        },
                        itemCount: textFields.length,
                      ),
                      DropDownListModule(
                        options: ['Male', 'Female'],
                        hintColor: Color(0xFFABABAB),
                        hintText: 'Select gender',
                        textColor: Color(0xFF817F82),
                        borderColor: Colors.transparent,
                        text: 'Gender',
                        backgroundColor: Color(0xFFDEDAE0),
                        name: 'Gender',
                        validators: [
                          FormBuilderValidators.required(
                              errorText: 'Please select a gender')
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value;
                          });
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.02),
                      FormBuilderField<Country>(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        name: 'country',
                        validator: FormBuilderValidators.required(
                            errorText: 'Please select a country'),
                        builder: (FormFieldState<Country?> field) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Country',
                                style: TextStyle(
                                  fontFamily: 'Inder',
                                  fontSize: 18,
                                  color: Color(0xFF817F82),
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.sizeOf(context).height *
                                      0.005),
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
                                      horizontal: 12, vertical: 16),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFDEDAE0),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: field.hasError
                                          ? Color(0xFFB9433E)
                                          : Colors.transparent,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        selectedCountry?.name ??
                                            'Select country',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Inder',
                                          color: selectedCountry == null
                                              ? Color(0xFFABABAB)
                                              : Color(0xFF817F82),
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
                                        color: Color(0xFFB9433E), fontSize: 12),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                      DropDownListModule(
                        options: [
                          'Asian or Pacific Islander',
                          'Black or African American',
                          'Hispanic or Latino',
                          'Native American or Alaskan Native',
                          'White or Caucasian',
                          'Multoracial or Biracial',
                          'A race/ethnicity not listed here'
                        ],
                        hintColor: Color(0xFFABABAB),
                        hintText: 'Select ethnicity',
                        textColor: Color(0xFF817F82),
                        borderColor: Colors.transparent,
                        text: 'Ethnicity',
                        backgroundColor: Color(0xFFDEDAE0),
                        name: 'Ethnicity',
                        validators: [
                          FormBuilderValidators.required(
                              errorText: 'Please select a country')
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedEthnicity = value;
                          });
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.05),
                      OperationButtonModule(
                          onTap: signUp,
                          borderColor: Color(0xFF49146D),
                          buttonColor: Color(0xFF49146D),
                          buttonText: 'Sign Up',
                          buttonTextColor: Colors.white),
                      AuthenticationButtonModule(
                          conditionOperation: 'Login',
                          conditionQeustion: 'Already have an account?  '),
                    ],
                  ),
                ),
              ),
            ],
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
