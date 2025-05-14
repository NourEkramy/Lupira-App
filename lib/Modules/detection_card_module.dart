import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DetectionCardModule extends StatelessWidget {
  String mainTitle;
  String? subtitle;
  VoidCallback? onTap;

  DetectionCardModule({
    super.key,
    required this.mainTitle,
    required this.onTap,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 95.w,
          height: 22.4.h,
          decoration: BoxDecoration(
            color: const Color(0xFFCABDD3),
            borderRadius: BorderRadius.circular(2.6.w),
          ),
          padding: EdgeInsets.all(5.w),
          margin: EdgeInsets.only(
            top: 0.8.h,
            right: 1.w,
            bottom: 4.6.h,
          ),
          child: Row(
            children: [
              SizedBox(
                width: 50.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      mainTitle,
                      style: const TextStyle(
                        color: Color(0xFF3D1A57),
                        fontFamily: "Inder",
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle != null
                        ? Text(
                            subtitle ?? "",
                            style: const TextStyle(
                              color: Color(0xFF3D1A57),
                              fontFamily: "Inder",
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        : SizedBox(),
                    SizedBox(height: 1.h),
                    ElevatedButton(
                      onPressed: onTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFCABDD3),
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Color(0xFF502371),
                            width: 0.5.w,
                          ),
                          borderRadius: BorderRadius.circular(2.6.w),
                        ),
                      ),
                      child: const Text(
                        "Start Now",
                        style: TextStyle(
                          color: Color(0xFF502371),
                          fontFamily: 'Inder',
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(),
            ],
          ),
        ),
        Positioned(
          top: -1.1.h,
          right: -3.6.w,
          child: Image.asset("assets/images/detection image.png"),
        ),
      ],
    );
  }
}
