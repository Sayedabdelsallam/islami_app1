import 'package:flutter/material.dart';
import 'package:islami_app/modules/splash_screen/splash_screen.dart';
import 'package:islami_app/shared/shared_pref.dart';
import 'package:provider/provider.dart';
import 'on_generate_route.dart';
import 'provider/radio_manger_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => RadioMangerProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashScreen.routeName,
    );
  }
}
