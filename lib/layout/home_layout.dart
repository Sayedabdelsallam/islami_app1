import 'package:flutter/material.dart';
import 'package:islami_app/modules/hadith/hadith_screen.dart';
import 'package:islami_app/modules/quran/quran_screen.dart';
import 'package:islami_app/modules/radio/radio_screen.dart';
import 'package:islami_app/modules/sebha/sebha_screen.dart';
import 'package:islami_app/modules/times/times_screen.dart';
import 'package:islami_app/shared/colors.dart';

class HomeLayout extends StatefulWidget {
  HomeLayout({super.key});
  static const String routeName = 'home';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int selectedIndex = 0;
  List<Widget> screens =
  [
    QuranScreen(),
    HadithScreen(),
    SebhaScreen(),
    RadioScreen(),
    TimesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(

        type: BottomNavigationBarType.fixed,
        backgroundColor: MyColors.primary,
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(()
          {});
        },
        selectedItemColor: MyColors.white,
        unselectedItemColor: MyColors.black,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: buildItemBottomNavBar(index: 0, image: 'quranIcon'),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: buildItemBottomNavBar(index: 1, image: 'hadithIcon'),
            label: 'Hadith',
          ),
          BottomNavigationBarItem(
            icon: buildItemBottomNavBar(index: 2, image: 'sebhaIcon'),
            label: 'Sebha',
          ),
          BottomNavigationBarItem(
            icon: buildItemBottomNavBar(index: 3, image: 'radioIcon'),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            icon: buildItemBottomNavBar(index: 4, image: 'timesIcon'),
            label: 'Times',
          ),

        ],

      ),
    );

  }
  Widget buildItemBottomNavBar({required int index , required String image}) {
    var size = MediaQuery.of(context).size;
    return selectedIndex == index ?
    Container(
      padding: EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 19,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(66),
        color: MyColors.darkPrimary,
      ),
      child: ImageIcon(
        AssetImage('assets/icons/$image.png'),
        size: size.height * 0.03,
      ),
    ) :ImageIcon(
      AssetImage('assets/icons/$image.png'),
      size: size.height * 0.03,
    );
  }
}
