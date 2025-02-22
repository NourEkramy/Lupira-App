import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  static const String routName = "Profile";

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
          padding: const EdgeInsets.only(left: 8, right: 8, top: 32,),
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
                        border: Border.all(color: Color(0xFFABABAB), width: 3,),
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
              Text(
                'Old password',
                style: TextStyle(
                  fontFamily: 'Inder',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4B4A4C),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter old password',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFABABAB)),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFABABAB)),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFABABAB)),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintStyle: TextStyle(
                    fontFamily: 'Inder',
                    color: Color(0xFF817F82),
                    fontSize: 16,
                  ),
                  filled: true,
                  fillColor: Color(0xFFDEDAE0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
