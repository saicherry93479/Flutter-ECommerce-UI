import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_three/SCREENS/SPLASHSCEEEN/SplashScreen.dart';

import 'package:learning_three/Utils/utils.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: kprimaryColor,
          scaffoldBackgroundColor: Colors.white,
          // brightness: Brightness.light,
          fontFamily: "Muli",
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            toolbarHeight: 70,
            iconTheme: IconThemeData(color: kappBarIconColor),
            titleTextStyle: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 148, 146, 146),
                fontFamily: "Muli",
                fontWeight: FontWeight.w500),
            centerTitle: true,
            color: Colors.white,
            shadowColor: Colors.white,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
            ),
          ),
          textTheme: TextThemeD()),
      home: const SplashScreen(),
    );
  }
}

TextTheme TextThemeD() {
  return TextTheme(
      headline1: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 35, color: kprimaryColor),
      headline3: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: Color.fromARGB(255, 196, 194, 194),
      ),
      headline4: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: Color.fromARGB(255, 196, 194, 194),
      ),
      headline2: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      headline5: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Color.fromARGB(255, 95, 94, 94)));
}
