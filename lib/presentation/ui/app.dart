import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app_ui_challenge/presentation/constants/dimensions.dart';
import 'intro_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //primaryColor: Colors.white,
        accentColor: Color(0xFFfcd340),
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        buttonColor: Color(0xFFfcd340),
        appBarTheme: AppBarTheme(
          color: Colors.white,
        ),
        textTheme: TextTheme(
          headline1: const TextStyle(
            color: Colors.black,
            fontSize: kFontSizeLargest,
            fontWeight: FontWeight.bold,
          ),
          headline2: const TextStyle(
            color: Colors.black,
            fontSize: kFontSizeLarge,
            fontWeight: FontWeight.bold,
          ),
          button: const TextStyle(
            fontSize: kFontSizeLarge,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          bodyText1: const TextStyle(
            fontSize: kFontSizeMedium,
            color: Colors.black,
          ),
          bodyText2: const TextStyle(
            fontSize: kFontSizeSmall,
            color: Colors.white,
          ),
        ),
      ),
      home: IntroPage(),
    );
  }
}
