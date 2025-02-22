import 'package:flutter/material.dart';

class UserCredentialsCardModule extends StatelessWidget {
  Widget cardBody;

  UserCredentialsCardModule({super.key, required this.cardBody});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF744199), Color(0xFFEBE4E4)],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFEBE4E4),
          border: Border.all(
            color: Colors.transparent,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.07,
            vertical: MediaQuery.sizeOf(context).height * 0.075),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: cardBody,
        ),
      ),
    );
  }
}
