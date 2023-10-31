import 'package:chat_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TBottomNavigationTheme{
  TBottomNavigationTheme._();

  static BottomNavigationBarThemeData lightBottomNavigationBarTheme = BottomNavigationBarThemeData(
    elevation: 0,
    backgroundColor: AppColors.pink100,
    selectedIconTheme: const IconThemeData(color: AppColors.white100,size: 24),
    unselectedIconTheme: const IconThemeData(color: AppColors.white100,size: 24),
    selectedLabelStyle: const TextStyle().copyWith(color: AppColors.white100,fontSize: 16,fontWeight: FontWeight.w800),
    unselectedLabelStyle: const TextStyle().copyWith(color: AppColors.black40,fontSize: 16,fontWeight: FontWeight.w800)
  );


  static BottomNavigationBarThemeData darkBottomNavigationBarTheme = BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: AppColors.pink100,
      selectedIconTheme: const IconThemeData(color: AppColors.white100,size: 24),
      unselectedIconTheme: const IconThemeData(color: AppColors.white100,size: 24),
      selectedLabelStyle: const TextStyle().copyWith(color: AppColors.white100,fontSize: 16,fontWeight: FontWeight.w800),
      unselectedLabelStyle: const TextStyle().copyWith(color: AppColors.black40,fontSize: 16,fontWeight: FontWeight.w800)
  );


}