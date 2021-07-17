import 'package:flutter/material.dart';

const primaryColorWhite = Color(0xffFFBD34);
const textHeadline4White = Color(0xff3F3A57);
const textHeadline6White = Color(0xff443f5d);
const bottomBarColor = Color(0xff423E5B);

final whiteTheme = ThemeData(
    primaryColor: primaryColorWhite,
    textTheme: TextTheme(
        headline4: TextStyle(color: textHeadline4White),
        headline6: TextStyle(color: textHeadline6White),
        headline3: TextStyle(color: Colors.white)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(primary: primaryColorWhite)),
    buttonColor: primaryColorWhite,
    scaffoldBackgroundColor: Color(0xffffffff));
