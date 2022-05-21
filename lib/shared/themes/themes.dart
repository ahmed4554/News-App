import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  iconTheme: const IconThemeData(
    color: Colors.deepOrange,
  ),
  textTheme: const TextTheme(
    headline3: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.deepOrange,
    ),
    headline1: TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline2: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: Colors.grey,
    ),
  ),
  primarySwatch: Colors.deepOrange,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.deepOrange,
    hoverColor: Colors.orange,
  ),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.deepOrange),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.deepOrange,
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    // ignore: deprecated_member_use
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedLabelStyle: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
    ),
    selectedItemColor: Colors.deepOrange,
    type: BottomNavigationBarType.fixed,
  ),
  scaffoldBackgroundColor: Colors.white,
);
ThemeData darkTheme = ThemeData(
  iconTheme: const IconThemeData(
    color: Colors.deepOrange,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
    border: OutlineInputBorder(),
    fillColor: Colors.white,
    filled: true,
  ),
  textTheme: const TextTheme(
    headline3: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: Colors.deepOrange,
    ),
    headline1: TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: Colors.grey,
    ),
  ),
  primarySwatch: Colors.deepOrange,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.deepOrange,
    hoverColor: Colors.orange,
  ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.deepOrange,
    ),
    backgroundColor: Colors.black26,
    elevation: 0,
    // ignore: deprecated_member_use
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black26,
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.black26,
    selectedLabelStyle: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
    ),
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.grey,
    type: BottomNavigationBarType.fixed,
  ),
  scaffoldBackgroundColor: Colors.black26,
);
