
import 'package:chat_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TButtonTheme{

  static ElevatedButtonThemeData lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.white100,
      backgroundColor: AppColors.pink100,
      // side: const BorderSide(color: AppColors.black60),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(color: AppColors.white100,fontWeight: FontWeight.w600,fontSize: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  static ElevatedButtonThemeData darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.white100,
      backgroundColor: AppColors.black100,
      side: const BorderSide(color: AppColors.black40),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(color: AppColors.white100,fontWeight: FontWeight.w600,fontSize: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}