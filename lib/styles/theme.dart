import 'package:ecommerce_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Themes{
  static ThemeData lightTheme=ThemeData(
      primarySwatch:Colors.blue,
      scaffoldBackgroundColor:Appcolors.white ,
      appBarTheme: AppBarTheme(
          color:Appcolors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Appcolors.black,
          ),
          textTheme: TextTheme(
            bodyText1: TextStyle(
                color: Appcolors.black,
                fontSize: 20
            ),
          ),
          titleTextStyle: TextStyle(
              color: Appcolors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20
          ),
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Appcolors.white,
              statusBarIconBrightness: Brightness.dark
          )
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          elevation: 20,
          backgroundColor: Appcolors.white,
          selectedItemColor: Colors.blue
      )
  );
  static ThemeData darkTheme=ThemeData(
      scaffoldBackgroundColor:Appcolors.night ,
      primarySwatch:Colors.blue,
      appBarTheme: AppBarTheme(
          color:Appcolors.night,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Appcolors.white,
          ),
          textTheme: TextTheme(
            bodyText1: TextStyle(
                color: Appcolors.white,
                fontSize: 20
            ),
          ),
          titleTextStyle: TextStyle(
              color: Appcolors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20
          ),
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Appcolors.night,
              statusBarIconBrightness: Brightness.light
          )
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          elevation: 20,
          backgroundColor: Appcolors.night,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Appcolors.white
      )
  );

}