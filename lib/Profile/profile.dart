import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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
  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjMxMjAsImlhdCI6MTc0NjEwNTgxMSwiZXhwIjoxNzQ2MTA5NDExfQ.1LyMZW8hwzTBJrodk1E1lDRZIc8r0ohGziI7HnUHTmg";
  String? selectedCountry;
  String? selectedGender;
  String? selectedEthnicity;

  static List<Map<String, dynamic>> textFields = [
    {
      'title': 'Username',
    },
    {
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
    final values = _formKey.currentState!.value;

    String userName = values['Username'];
    String email = values['Email'];
    String dateOfBirth = values['Date of birth'];
    String phoneNumber = values['Phone'];

    if (_formKey.currentState!.validate()) {
      try {
        final response = await ProfileApi.applyProfileEdits(
          token: token ?? '',
          country: selectedCountry ?? '',
          dateOfBirth: dateOfBirth ?? '',
          email: email ?? '',
          ethnicity: selectedEthnicity ?? '',
          gender: selectedGender ?? '',
          phoneNumber: phoneNumber ?? '',
          username: userName ?? '',
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
      } catch (e) {
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
          ? Center(child: CircularProgressIndicator(),)
          : SingleChildScrollView(
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
                    FormBuilder(
                      key: _formKey,
                      child: ListView.builder(
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

                          return TextFieldModule(
                            textFieldType: null,
                            name: textField['title'],
                            textFieldTitle: textField['title'],
                            hintTextTitle: '',
                            initialProfileData: hintData ?? '',
                            isReadOnly: !isEditable,
                            onTap: () {
                              if (!isEditable) {
                                setState(() {
                                  isEditable = true;
                                });
                              }
                            },
                            hintTextColor: Color(0xFF4B4A4C),
                            titelTextColor: Color(0xFF4B4A4C),
                            borderColor: Color(0xFFABABAB),
                            backgroundColor: Color(0xFFDEDAE0),
                            suffix: textField['suffix'],
                          );
                        },
                        itemCount: textFields.length,
                      ),
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
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
                          isReadOnly: true,
                          initialProfileChoice: profileData?.data?.gender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value;
                            });
                          },
                          name: 'Gender',
                          options: ['Male', 'Female'],
                          hintColor: Color(0xFF4B4A4C),
                          hintText: 'Select Gender',
                          textColor: Color(0xFF4B4A4C),
                          borderColor: Color(0xFFABABAB),
                          text: 'Gender',
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
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
                            isReadOnly: true,
                            initialProfileChoice: profileData?.data?.country,
                            onChanged: (value) {
                              setState(() {
                                selectedCountry = value;
                              });
                            },
                            name: 'Country',
                            options: ['Egypt', 'Canada', 'UK'],
                            hintColor: Color(0xFF4B4A4C),
                            hintText: 'Select Country',
                            textColor: Color(0xFF4B4A4C),
                            borderColor: Color(0xFFABABAB),
                            text: 'Country',
                            backgroundColor: Colors.transparent),
                      ),
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
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
                            isReadOnly: true,
                            initialProfileChoice: profileData?.data?.ethnicity,
                            onChanged: (value) {
                              setState(() {
                                selectedEthnicity = value;
                              });
                            },
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
                            backgroundColor: Colors.transparent),
                      ),
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
                    if (isEditable)
                      ElevatedButton(
                        onPressed: updateProfile,
                        child: Text(
                          'Save changes',
                        ),
                      ),
                  ],
                ),
              ),
            ),
    );
  }
}
