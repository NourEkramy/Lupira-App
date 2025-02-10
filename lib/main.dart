import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xFFEBE4E4),
      ),
      home: const SignUp(),
    );
  }
}

class SignUp extends StatelessWidget{
  const SignUp({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [const Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 48,

              fontFamily: 'Alegreya',
              color:Color(0xFF49146D),
            ),
          ),
            const SizedBox(height: 40,),
            Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Username',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF57585D),
                    ),
                  ),
                ]
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color(0xFFDEDAE0),
              ),
            ),
            const SizedBox(height: 16,),
            Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF57585D),
                    ),
                  ),
                ]
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color(0xFFDEDAE0),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16,),
            Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF57585D),
                    ),
                  ),
                ]
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color(0xFFDEDAE0),
              ),
            ),
            const SizedBox(height: 16,),
            Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Confirm Password',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF57585D),
                    ),
                  ),
                ]
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color(0xFFDEDAE0),
              ),
            ),
            const SizedBox(height: 16,),
            Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Date of birth',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF57585D),
                    ),
                  ),
                ]
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Date of Birth',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color(0xFFDEDAE0),
              ),
            ),
            const SizedBox(height: 16,),
            Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Gender',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF57585D),
                    ),
                  ),
                ]
            ),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Gender',
                border:const OutlineInputBorder(),
                filled: true,
                fillColor: Color(0xFFDEDAE0),
              ),
              items: <String>['Male','Female'].map((String value){
                return DropdownMenuItem<String>(value: value,
                child: Text(value),
                );
              }).toList(), onChanged: (String? newValue) {  },
            ),
            const SizedBox(height: 16,),
            Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Countr',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF57585D),
                    ),
                  ),
                ]
            ),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Choose Country',
                border:const OutlineInputBorder(),
                filled: true,
                fillColor: Color(0xFFDEDAE0),
              ),
              items: <String>['Egypt','Canada','UK'].map((String value){
                return DropdownMenuItem<String>(value: value,
                  child: Text(value),
                );
              }).toList(), onChanged: (String? newValue) {  },
            ),
            const SizedBox(height: 25,),
            ElevatedButton(onPressed: (){},
                child: const Text('Sign Up'),
            )
          ],
        ),
      ),
    );
  }
}