import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/BaseScreen/base_screen_logic.dart';
import 'Layout/main_layout.dart';
import 'Tabs/diagnosis_tab.dart';
import 'Tabs/home_tab.dart';
import 'Tabs/settings_tabs.dart';

class BaseScreen extends StatelessWidget {
  static const String routName = "BaseScreen";

  final List<Widget> tabs = [
    HomeTab(),
    DiagnosisTab(),
    SettingsTabs(),
  ];

  final List<String> appBarTitles = ["Lupira", "diagnosis".tr(), "settings".tr()];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BaseScreenCubit(),
      child: BlocBuilder<BaseScreenCubit, BaseScreenState>(
        builder: (context, state) {
          return PopScope(
            canPop: false,
            child: MainLayout(
                child: tabs[state.selectedTabIndex],
                title: appBarTitles[state.selectedTabIndex]),
          );
        },
      ),
    );
  }
}
