import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Modules/authentication_button_module.dart';
import 'package:untitled/Modules/drop_down_list_module.dart';
import 'package:untitled/Modules/operation_button_module.dart';
import 'package:untitled/Modules/text_field_module.dart';
import 'package:untitled/Modules/user_credentials_card_module.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  static const String routName = "SignUp";

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final List<TextEditingController> controllers = [];

  static const List<Map<String, dynamic>> textFields = [
    {'title': 'Username', 'hint': 'Enter username',},
    {
      'title': 'Email',
      'hint': 'useremail@placeholder.com',
      'keyboardType': TextInputType.emailAddress,
    },
    {
      'title': 'Password',
      'hint': 'Enter password',
      'keyboardType': TextInputType.visiblePassword,
    },
    {
      'title': 'Confirm password',
      'hint': 'Enter password',
      'keyboardType': TextInputType.visiblePassword,
    },
    {
      'title': 'Date of birth',
      'hint': 'DD/MM/YYYY',
      'suffix': Icon(Icons.calendar_today_outlined),
      'isReadOnly': true,
    },
    {
      'title': 'Phone',
      'hint': 'Enter phone number',
      'keyboardType': TextInputType.phone,
    },
  ];

  @override
  void initState() {
    super.initState();
    controllers.addAll(
        List.generate(textFields.length, (_) => TextEditingController()));
  }

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserCredentialsCardModule(
        cardBody: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery
                .sizeOf(context)
                .height * 0.05),
            Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 48,
                fontFamily: 'Alegreya',
                color: Color(0xFF49146D),
              ),
            ),
            SizedBox(height: MediaQuery
                .sizeOf(context)
                .height * 0.01),
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
                        return TextFieldModule(
                          onTap: index == 4 ? selectDate : null,
                          isReadOnly: textField['isReadOnly']??false,
                          textController: controllers[index],
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
                    ),
                    DropDownListModule(
                      options: ['Egypt', 'Canada', 'UK'],
                      hintColor: Color(0xFFABABAB),
                      hintText: 'Choose country',
                      textColor: Color(0xFF817F82),
                      borderColor: Colors.transparent,
                      text: 'Country',
                      backgroundColor: Color(0xFFDEDAE0),
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
                      hintText: 'Select Ethnicity',
                      textColor: Color(0xFF817F82),
                      borderColor: Colors.transparent,
                      text: 'Ethnicity',
                      backgroundColor: Color(0xFFDEDAE0),
                    ),
                    SizedBox(height: MediaQuery
                        .sizeOf(context)
                        .height * 0.05),
                    OperationButtonModule(
                        borderColor: Color(0xFF49146D),
                        buttonColor: Color(0xFF49146D),
                        buttonText: 'Sigup',
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
        controllers[4].text =
        "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      });
    }
  }
}
