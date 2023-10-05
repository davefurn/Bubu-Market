import 'package:bubu_market/constants/colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: GlobalVariables.scaffoldBackGroundColor,
  brightness: Brightness.light,
  primaryColor: GlobalVariables.colorPrimary,
  iconTheme: const IconThemeData(color: GlobalVariables.colorSecondary),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: GlobalVariables.colorAccent,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      backgroundColor:
          MaterialStateProperty.all<Color>(GlobalVariables.colorSecondary),
      minimumSize: MaterialStateProperty.all<Size>(
        const Size.fromHeight(57),
      ),
    ),
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      color: Colors.white,
      fontSize: 45,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: TextStyle(
      color: Colors.white,
      fontSize: 17,
      fontWeight: FontWeight.w400,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: const TextStyle(fontSize: 14, color: Color(0xffb5b9bc)),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: GlobalVariables.colorPrimary),
      borderRadius: BorderRadius.circular(10),
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
);
