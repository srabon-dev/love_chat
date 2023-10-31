import 'package:chat_app/utils/constants/app_colors.dart';
import 'package:chat_app/utils/theme/app_bar_theme/app_bar_theme.dart';
import 'package:chat_app/utils/theme/bottom_navigation_theme/bottom_navigation_theme.dart';
import 'package:chat_app/utils/theme/bottom_sheet_theme/bottom_sheet_theme.dart';
import 'package:chat_app/utils/theme/button_theme/button_theme.dart';
import 'package:chat_app/utils/theme/text_field_theme/text_field_theme.dart';
import 'package:chat_app/utils/theme/text_theme/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme{
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: AppColors.pink100,
    scaffoldBackgroundColor: AppColors.white100,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TButtonTheme.lightElevatedButtonTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetLightTheme,
    inputDecorationTheme: TTextFieldTheme.lightInputDecorationTheme,
    bottomNavigationBarTheme: TBottomNavigationTheme.lightBottomNavigationBarTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: AppColors.pink100,
    scaffoldBackgroundColor: AppColors.black100,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TButtonTheme.darkElevatedButtonTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetDarkTheme,
    inputDecorationTheme: TTextFieldTheme.darkInputDecorationTheme,
    bottomNavigationBarTheme: TBottomNavigationTheme.darkBottomNavigationBarTheme,
  );
}