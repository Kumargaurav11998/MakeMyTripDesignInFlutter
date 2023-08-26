// ignore_for_file: prefer_const_constructors

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flights_app/Provider/search_provider.dart';
import 'package:flights_app/shared/constant.dart';
import 'package:flights_app/shared/routes.dart';
import 'package:flights_app/shared/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'Provider/add_Traveler_Provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());

  // runApp(
  // DevicePreview(
  //   enabled: true,
  //   tools: const [...DevicePreview.defaultTools],
  //   builder: (context) =>const MyApp(),
  // ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SearchProvider(),),
        ChangeNotifierProvider(create: (context) => Add_Travelar_Provider(),),

      ],

        child: MaterialApp(
          title: appName,
          theme: ThemeData(
              primaryColor: Constant.primaryColor,
              iconTheme: IconThemeData(color: Constant.primaryColor)),
          home: SplashPage(),
          color: Constant.primaryColor,
          routes: routes,
          debugShowCheckedModeBanner: false,
          // initialRoute: AppRoutes.SearchFlightPage,
        ));
  }
}
