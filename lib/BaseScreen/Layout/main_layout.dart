import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/BaseScreen/base_screen_logic.dart';

class MainLayout extends StatelessWidget {
  Widget child;
  String title;
  String? appName;
  bool showBottomNav;

  MainLayout({
    super.key,
    required this.child,
    required this.title,
    this.appName,
    this.showBottomNav = true,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BaseScreenCubit, BaseScreenState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0xFFDEDAE0),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: Builder(
              builder: (BuildContext context) {
                return Navigator.canPop(context)
                    ? IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          size: 22.sp,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context); // Navigate back
                        },
                      )
                    : SizedBox(); // No back button on the first screen
              },
            ),
            elevation: 0,
            toolbarHeight: 8.6.h,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(2.6.w)),
            ),
            backgroundColor: Color(0xFF744199),
            title: Center(
              child: RichText(
                text: TextSpan(
                  text: title,
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Alegreya',
                    color: Color(0xFFEBE4E4),
                  ),
                  children: appName != null
                      ? [
                          TextSpan(
                            text: appName,
                            style: const TextStyle(
                              fontSize: 40,
                              fontFamily: 'BerkshireSwash',
                              color: Color(0xFFEBE4E4),
                            ),
                          ),
                        ]
                      : [],
                ),
              ),
            ),
          ),
          body: child,
          bottomNavigationBar: showBottomNav
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.4.w),
                      topRight: Radius.circular(4.4.w),
                    ),
                    border: Border.all(color: Color(0xFFABABAB), width: 0.2.w),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.4.w),
                      topRight: Radius.circular(4.4.w),
                    ),
                    child: BottomNavigationBar(
                      selectedLabelStyle: TextStyle(
                        fontFamily: "Inder",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      selectedIconTheme: IconThemeData(size: 22.sp),
                      unselectedIconTheme: IconThemeData(size: 22.sp),
                      backgroundColor: Color(0xffEBE4E4),
                      selectedItemColor: Color(0xFF3D1A57),
                      unselectedItemColor: Color(0xFFABABAB),
                      showUnselectedLabels: false,
                      currentIndex: state.selectedTabIndex,
                      onTap: (index) {
                        context.read<BaseScreenCubit>().changeTab(index);
                      },
                      items: [
                        BottomNavigationBarItem(
                          label: "Home",
                          icon: ImageIcon(
                            AssetImage("assets/images/home-button.png"),
                          ),
                        ),
                        BottomNavigationBarItem(
                          label: "Diagnosis",
                          icon: ImageIcon(
                            AssetImage("assets/images/diagnose.png"),
                          ),
                        ),
                        BottomNavigationBarItem(
                          label: "Settings",
                          icon: Icon(Icons.settings),
                        ),
                      ],
                    ),
                  ),
                )
              : null,
        );
      },
    );
  }
}
