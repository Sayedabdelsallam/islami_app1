import 'package:flutter/material.dart';
import 'package:islami_app/layout/home_layout.dart';
import 'package:islami_app/modules/on_boarding/on_boarding_screen.dart';
import 'package:islami_app/shared/shared_pref.dart';

import '../../shared/shared_pref_keys.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      var isFirstTimeRun = SharedPref.getBool(SharedPrefKeys.isFirstTimeRun) ?? true;
      Navigator.pushReplacementNamed(context, isFirstTimeRun ? OnBoardingScreen.routeName : HomeLayout.routeName,);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/splash/splashBk.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.05,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/images/splash/MosqueTop.png',
                    height: size.height * 0.18,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/images/splash/icon.png',
                    width: size.width * 0.4,
                    height: size.height * 0.8,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    'assets/images/splash/Islami.png',
                    width: size.width * 0.3,
                    // width: size.width * 0.3,
                    height: size.height * 0.99,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                'assets/images/splash/GlowTop.png',
                height: size.height * 0.25,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.2,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    'assets/images/splash/LeftShape.png',
                    fit: BoxFit.cover,
                    width: size.width * 0.2,
                    height: size.height * 0.2,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    'assets/images/splash/rightShape.png',
                    fit: BoxFit.cover,
                    width: size.width * 0.2,
                    height: size.height * 0.2,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.08,
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/splash/routegold.png',
                // fit: BoxFit.cover,
                width: size.width * 0.4,
                height: size.height * 0.15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
