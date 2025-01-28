import 'package:flutter/material.dart';
import 'package:islami_app/layout/home_layout.dart';
import 'package:islami_app/models/sura_data.dart';
import 'package:islami_app/modules/quran/quran_details_view.dart';
import 'package:islami_app/modules/splash_screen/splash_screen.dart';

import 'modules/on_boarding/on_boarding_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeLayout.routeName:
      return MaterialPageRoute(builder: (_) => HomeLayout());
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (_) => SplashScreen());
    case OnBoardingScreen.routeName:
      return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case QuranDetailsView.routeName:
        return MaterialPageRoute(builder: (_) => QuranDetailsView(
          suraData: settings.arguments as SuraData,
        ));
        default:
      return MaterialPageRoute(builder: (_) => Scaffold());
  }
}
