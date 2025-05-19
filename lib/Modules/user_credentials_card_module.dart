import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../Formating/colors_format.dart';

class UserCredentialsCardModule extends StatelessWidget {
  final Widget cardBody;

  UserCredentialsCardModule({super.key, required this.cardBody});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ColorsFormat.gradientPruble,
            ColorsFormat.credentialsCardColor
          ],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: ColorsFormat.credentialsCardColor,
          border: Border.all(
            color: Colors.transparent,
            width: 0.2.w,
          ),
          borderRadius: BorderRadius.circular(2.6.w),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 7.w,
          vertical: 7.5.h,
        ),
        child: Padding(
          padding: EdgeInsets.all(2.w),
          child: cardBody,
        ),
      ),
    );
  }
}
