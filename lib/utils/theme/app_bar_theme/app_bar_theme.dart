import 'package:chat_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TAppBarTheme{
  TAppBarTheme._();

  static AppBarTheme lightAppBarTheme = const AppBarTheme(
    centerTitle: true,
    scrolledUnderElevation: 0,
    backgroundColor: AppColors.pink5,
    surfaceTintColor: AppColors.pink5,
    iconTheme: IconThemeData(color: AppColors.pink100,size: 24),
    titleTextStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AppColors.black100),
  );

  static AppBarTheme darkAppBarTheme = const AppBarTheme(
    centerTitle: true,
    scrolledUnderElevation: 0,
    backgroundColor: AppColors.black100,
    surfaceTintColor: AppColors.black100,
    iconTheme: IconThemeData(color: AppColors.white100,size: 24),
    titleTextStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AppColors.white100),
  );
}