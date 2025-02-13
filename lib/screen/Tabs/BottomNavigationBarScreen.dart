import 'package:flutter/material.dart';
import 'package:movies/core/class/app_colors.dart';
import 'package:movies/core/class/app_images.dart';
import 'package:movies/screen/Tabs/explore_tab.dart';
import 'package:movies/screen/Tabs/profiel_tab.dart';
import 'package:movies/screen/Tabs/search_tab.dart';
import 'package:movies/screen/home.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  static const String roteName="BottomNavigationBarScreen";
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() => _bottomState();
}

class _bottomState extends State<BottomNavigationBarScreen> {
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            currentIndex=value;
            setState(() {
            });
          },
          currentIndex: currentIndex,
          backgroundColor: AppColors.secondary,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedItemColor: AppColors.button,
          unselectedItemColor: AppColors.text,
          type: BottomNavigationBarType.fixed,
          elevation: 0,

          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppImages.home)),
                label:""),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppImages.search)),
                label:"" ),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppImages.explore)),
                label:"" ),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppImages.profile)),
                label:"" ),
          ]
      ),
      body: tabs[currentIndex],
    );
  }
  List<Widget> tabs = [
    Home(),
    SearchTab(),
    ExploreTab(),
    ProfielTab(),
  ];
}

