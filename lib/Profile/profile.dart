import 'package:flutter/material.dart';
import 'package:untitled/Modules/drop_down_list_module.dart';

import '../Modules/text_field_module.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  static const String routName = "Profile";

  static const List<Map<String, dynamic>> textFields = [
    {'title': 'Username', 'hint': 'Nadia'},
    {'title': 'Email', 'hint': 'nadia@gmail.com'},
    {'title': 'Date of birth', 'hint': '11/5/2002', 'suffix': Icon(Icons.calendar_today_outlined)},
    {'title': 'Phone', 'hint': 'Enter phone number'},
  ];

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 8,
            right: 8,
            top: 32,
          ),
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
              return TextFieldModule(
                textFieldTitle: textField['title'],
                hintTextTitle: textField['hint'],
                hintTextColor: Color(0xFF4B4A4C),
                titelTextColor: Color(0xFF4B4A4C),
                borderColor: Color(0xFFABABAB),
                backgroundColor: Color(0xFFDEDAE0),
                suffix: textField['suffix'],
              );
            },
            itemCount: textFields.length,
          ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
              DropDownListModule(
                  options: ['Male', 'Female'],
                  hintColor: Color(0xFF4B4A4C),
                  hintText: 'Female',
                  textColor: Color(0xFF4B4A4C),
                  borderColor: Color(0xFFABABAB),
                  text: 'Gender',
                  backgroundColor: Colors.transparent),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
              DropDownListModule(
                  options: ['Egypt', 'Canada', 'UK'],
                  hintColor: Color(0xFF4B4A4C),
                  hintText: 'Country',
                  textColor: Color(0xFF4B4A4C),
                  borderColor: Color(0xFFABABAB),
                  text: 'Country',
                  backgroundColor: Colors.transparent),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
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
                  hintColor: Color(0xFF4B4A4C),
                  hintText: 'Ethnicity',
                  textColor: Color(0xFF4B4A4C),
                  borderColor: Color(0xFFABABAB),
                  text: 'Ethnicity',
                  backgroundColor: Colors.transparent),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}