import 'package:flutter/material.dart';
import 'package:untitled/Modules/report_card_module.dart';

class DetectionHistory extends StatelessWidget {
  static const String routeName = "DetectionHistory";

  const DetectionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDEDAE0),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: MediaQuery.of(context).size.height * 0.086,
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.vertical(bottom: Radius.circular(10)),
        ),
        backgroundColor: Color(0xFF744199),
        title: Center(
          child: Text(
            "History",
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'Alegreya',
              color: Color(0xFFEBE4E4),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: 13,
            right: 13,
            top: 30,
        ),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ReportCardModule(
              reportDate: "5 May, 2024",
              reportResult: "No signs of lupus detected",
            );
          },
          itemCount: 8,
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          border: Border.all(color: Color(0xFFABABAB), width: 1),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            selectedLabelStyle: TextStyle(
              fontFamily: "Inder",
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            selectedIconTheme: IconThemeData(size: 30),
            unselectedIconTheme: IconThemeData(size: 30),
            backgroundColor: Color(0xffEBE4E4),
            selectedItemColor: Color(0xFF3D1A57),
            unselectedItemColor: Color(0xFFABABAB),
            showUnselectedLabels: false,
            onTap: (index) {
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
      ),
    );
  }
}
