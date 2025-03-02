import 'package:flutter/material.dart';
import 'package:islami_app/layout/home_layout.dart';
import 'package:islami_app/modules/on_boarding/widgets/on_boarding_item.dart';
import 'package:islami_app/shared/shared_pref.dart';
import 'package:islami_app/shared/shared_pref_keys.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../res/font_res.dart';
import '../../shared/colors.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  static const String routeName = 'onBoarding';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController controller = PageController();
  @override
  void initState() {
    SharedPref.setBool(SharedPrefKeys.isFirstTimeRun, false);
    super.initState();
  }

  final List<Widget> items = [
    OnBoardingItem(
      title: 'Welcome To Islami App',
      image: 'assets/images/onBoardingCenter.png',
      description: '',
    ),
    OnBoardingItem(
      title: 'Welcome To Islami',
      image: 'assets/images/oBc2.png',
      description: 'We Are Very Excited To Have You In Our\nCommunity',
    ),
    OnBoardingItem(
      title: 'Reading the Quran',
      image: 'assets/images/oBc3.png',
      description: 'Read, and your Lord is the Most Generous.',
    ),
    OnBoardingItem(
      title: 'Bearish',
      image: 'assets/images/oBc4.png',
      description: 'Praise the name of your Lord, the Most High.',
    ),
    OnBoardingItem(
      title: 'Holy Quran Radio',
      image: 'assets/images/oBc5.png',
      description: 'You can listen to the Holy Quran Radio\nthrough the application for free and easily.',
    ),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF202020),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top background image
            Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/images/onBoardingTop.png',
                    height: size.height * 0.18,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            // PageView
            Expanded(
              child: PageView.builder(
                controller: controller,
                physics: const BouncingScrollPhysics(),
                itemCount: items.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return items[index];
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      if (currentIndex > 0) {
                        controller.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: const Text(
                      'Back',
                      style: TextStyle(
                          color: MyColors.primary,
                          fontFamily: FontRes.janna,
                          fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  const Spacer(),
                  SmoothPageIndicator(
                    controller: controller,
                    count: items.length,
                    effect: const WormEffect(
                      dotColor: Colors.grey,
                      activeDotColor: MyColors.primary,
                      dotHeight: 8.0,
                      dotWidth: 8.0,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      if (currentIndex < items.length - 1) {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.pushReplacementNamed(context, HomeLayout.routeName);
                      }
                    },
                    child:  Text(
                      currentIndex == items.length - 1 ? 'Finish' : 'Next',
                      style: TextStyle(
                          color: MyColors.primary,
                          fontFamily: FontRes.janna,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
