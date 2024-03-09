import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


 const DefaultColor = Colors.teal;


ThemeData  themesDark = ThemeData(
  textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.white,fontSize: 16 ,fontWeight: FontWeight.w600 ) ),
  appBarTheme:  const AppBarTheme(
    /*  backgroundColor: Color(0xff464646),*/
      elevation: 0,iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Color(0xff464646),
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      )),
  backgroundColor: const Color(0xff464646),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xff464646), elevation: 5 ,selectedIconTheme: IconThemeData(color: Colors.deepOrange ),
      type: BottomNavigationBarType.fixed, selectedItemColor: Colors.deepOrange , unselectedItemColor: Colors.grey
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData( ),
  scaffoldBackgroundColor: const Color(0xff464646),
  cardTheme: const CardTheme(color: Color(0xff464646), elevation: 10),
  iconTheme: const IconThemeData(color: Colors.white),
) ;


ThemeData themesLight = ThemeData(
/*  buttonColor: DefaultColor,*/
     primaryColor: DefaultColor,
    textTheme: const TextTheme(bodyText1: TextStyle(color: DefaultColor,fontSize: 16 ,fontWeight: FontWeight.w600 ) ),
    appBarTheme: const AppBarTheme(

        titleTextStyle: TextStyle(color: Colors.blue),
        color: Colors.white,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white, elevation: 5 ,selectedIconTheme: IconThemeData(color: Colors.deepOrange ),
        type: BottomNavigationBarType.fixed, selectedItemColor: Colors.deepOrange , unselectedItemColor: Colors.black
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.deepOrange),
    iconTheme: const IconThemeData(color: Colors.black));