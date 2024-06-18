import 'package:dummy_template/pages/analysis/analysis_page.dart';
import 'package:dummy_template/pages/home/home_page.dart';
import 'package:dummy_template/pages/setting/setting_page.dart';
import 'package:dummy_template/values/color.dart';
import 'package:dummy_template/values/images.dart';
import 'package:dummy_template/values/route.dart';
import 'package:dummy_template/values/text_style.dart';
import 'package:flutter/material.dart';

class TabMenu extends StatefulWidget {
  const TabMenu({super.key});

  @override
  State<TabMenu> createState() => _TabMenuState();
}

class _TabMenuState extends State<TabMenu> {
  final tabs = [
    const HomePage(),
    const AnalysisPage(),
    null,
    const SettingPage(),
    const SizedBox()
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            value == tabs.length - 3
                ? null
                : value == tabs.length - 1
                    ? Navigator.pushNamed(context, profilePage)
                    : setState(() {
                        currentIndex = value;
                      });
          },
          currentIndex: currentIndex,
          selectedLabelStyle: roboto,
          unselectedLabelStyle: roboto,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.black,
          selectedItemColor: lightBlue,
          elevation: 20,
          items: const [
            BottomNavigationBarItem(
                label: 'Home', icon: Icon(Icons.home_outlined)),
            BottomNavigationBarItem(
                label: 'Analysis', icon: Icon(Icons.bar_chart_outlined)),
            BottomNavigationBarItem(label: '', icon: Text('')),
            BottomNavigationBarItem(
                label: 'Setting', icon: Icon(Icons.settings_outlined)),
            BottomNavigationBarItem(
                label: 'Profile', icon: Icon(Icons.person_outline_rounded)),
          ]),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: FloatingActionButton(
          elevation: 2,
          backgroundColor: Colors.white,
          shape: const CircleBorder(side: BorderSide.none),
          onPressed: () {
            Navigator.pushNamed(context, alertPage);
          },
          child: Image.asset(alarm),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
