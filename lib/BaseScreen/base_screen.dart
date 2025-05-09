import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Layout/main_layout.dart';
import 'package:untitled/Tabs/diagnosis_tab.dart';
import 'package:untitled/Tabs/home_tab.dart';
import 'package:untitled/Tabs/settings_tabs.dart';
import 'package:untitled/BaseScreen/base_screen_logic.dart';

class BaseScreen extends StatelessWidget {
  static const String routeName = "BaseScreen";

  final List<Widget> tabs = [
    HomeTab(),
    DiagnosisTab(),
    SettingsTabs(),
  ];

  final List<String> appBarTitles = ["Lupira", "Diagnosis", "Settings"];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BaseScreenCubit(),
      child: BlocBuilder<BaseScreenCubit, BaseScreenState>(
        builder: (context, state) {
          return MainLayout(
              child: tabs[state.selectedTabIndex],
              title: appBarTitles[state.selectedTabIndex]);
        },
      ),
    );
  }
}
