import 'package:flutter/material.dart';

const primaryColorWhite = Color(0xffFFBD34);
const textHeadline4White = Color(0xff3F3A57);
const textHeadline6White = Color(0xff443f5d);

final whiteTheme = ThemeData(
    primaryColor: primaryColorWhite,
    textTheme: TextTheme(
        headline4: TextStyle(color: textHeadline4White),
        headline6: TextStyle(color: textHeadline6White)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(primary: primaryColorWhite)),
    buttonColor: primaryColorWhite,
    scaffoldBackgroundColor: Color(0xffffffff));
