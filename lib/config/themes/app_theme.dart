import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme()
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.blue,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Color(0xff000000)),
    titleTextStyle: TextStyle(color: Color(0xff000000), fontSize: 18)
  );
}