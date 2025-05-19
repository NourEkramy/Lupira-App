import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/BaseScreen/base_screen_logic.dart';
import 'package:untitled/BottomSheets/exit_without_answering_bottom_sheet.dart';
import 'package:untitled/Formating/text_style_format.dart';
import '../../Formating/colors_format.dart';

class MainLayout extends StatelessWidget {
  Widget child;
  String title;
  String? appName;
  bool showBottomNav;
  bool inDetectionScreen;

  MainLayout({
    super.key,
    required this.child,
    required this.title,
    this.appName,
    this.showBottomNav = true,
    this.inDetectionScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BaseScreenCubit, BaseScreenState>(
      builder: (context, state) {
        bool isArabic = context.locale.languageCode == 'ar';
        return Scaffold(
          backgroundColor: ColorsFormat.border_backgroundWhiteColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: Builder(
              builder: (BuildContext context) {
                if (!Navigator.canPop(context)) {
                  return SizedBox();
                }

                return IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 22.sp,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    if(inDetectionScreen){
                      showDialog(context: context, builder: (context) => ExitWithoutAnsweringBottomSheet(),);
                    }else{
                      Navigator.pop(context);
                    }
                  },
                );
              },
            ),
            centerTitle: true,
            elevation: 0,
            toolbarHeight: 8.6.h,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(2.6.w)),
            ),
            backgroundColor: ColorsFormat.gradientPruble,
            title: RichText(
              text: TextSpan(
                text: title,
                style: TextStyleFormat.passwordPageTitle.copyWith(
                  fontSize: isArabic ? 25.sp : 26.sp,
                  color: ColorsFormat.credentialsCardColor,
                ),
                children: appName != null
                    ? [
                        TextSpan(
                          text: appName,
                          style: TextStyle(
                            fontSize: isArabic ? 25.sp : 26.sp,
                            fontFamily: 'BerkshireSwash',
                            color: ColorsFormat.credentialsCardColor,
                          ),
                        ),
                      ]
                    : [],
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
                    border:
                        Border.all(color: ColorsFormat.hintColor, width: 0.2.w),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.4.w),
                      topRight: Radius.circular(4.4.w),
                    ),
                    child: BottomNavigationBar(
                      selectedLabelStyle: TextStyleFormat.snackBarMessage
                          .copyWith(fontWeight: FontWeight.w500),
                      selectedIconTheme: IconThemeData(size: 22.sp),
                      unselectedIconTheme: IconThemeData(size: 22.sp),
                      backgroundColor: ColorsFormat.credentialsCardColor,
                      selectedItemColor: ColorsFormat.darckPruble,
                      unselectedItemColor: ColorsFormat.hintColor,
                      showUnselectedLabels: false,
                      currentIndex: state.selectedTabIndex,
                      onTap: (index) {
                        context.read<BaseScreenCubit>().changeTab(index);
                      },
                      items: [
                        BottomNavigationBarItem(
                          label: "home".tr(),
                          icon: ImageIcon(
                            AssetImage("assets/images/home-button.png"),
                          ),
                        ),
                        BottomNavigationBarItem(
                          label: "diagnosis".tr(),
                          icon: ImageIcon(
                            AssetImage("assets/images/diagnose.png"),
                          ),
                        ),
                        BottomNavigationBarItem(
                          label: "settings".tr(),
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
