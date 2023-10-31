import 'package:chat_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TTextTheme{
  TTextTheme._();
  static TextTheme lightTextTheme = TextTheme(
    headlineSmall: const TextStyle().copyWith(
      fontWeight: FontWeight.w600,
      color: AppColors.pink100,
      fontSize: 24
    ),

    titleLarge: const TextStyle().copyWith(
      fontWeight: FontWeight.w500,
      color: AppColors.white100,
      fontSize: 18
    ),
    titleMedium: const TextStyle().copyWith(
      fontWeight: FontWeight.w500,
      color: AppColors.black100,
      fontSize: 16
    ),
    titleSmall: const TextStyle().copyWith(
        fontWeight: FontWeight.w500,
        color: AppColors.pink100,
    ),

    labelLarge: const TextStyle().copyWith(
      fontWeight: FontWeight.w500,
      color: AppColors.pink100,
      fontSize: 18
    ),
    labelMedium: const TextStyle().copyWith(
      fontWeight: FontWeight.w500,
      color: AppColors.black80,
      fontSize: 12
    ),
    labelSmall: const TextStyle().copyWith(
      fontWeight: FontWeight.w500,
      color: AppColors.black100,
      fontSize: 12
    ),

    bodyLarge: const TextStyle().copyWith(
        fontWeight: FontWeight.w500,
        color: AppColors.pink100,
        fontSize: 16
    ),


  );

  static TextTheme darkTextTheme = TextTheme(
    headlineSmall: const TextStyle().copyWith(
        fontWeight: FontWeight.w600,
        color: AppColors.white100,
        fontSize: 24
    ),

    titleLarge: const TextStyle().copyWith(
        fontWeight: FontWeight.w500,
        color: AppColors.white100,
        fontSize: 18
    ),
    titleMedium: const TextStyle().copyWith(
        fontWeight: FontWeight.w500,
        color: AppColors.white100,
        fontSize: 16
    ),
    titleSmall: const TextStyle().copyWith(
      fontWeight: FontWeight.w500,
      color: AppColors.white100,
    ),

    labelLarge: const TextStyle().copyWith(
        fontWeight: FontWeight.w500,
        color: AppColors.pink100,
        fontSize: 18
    ),
    labelMedium: const TextStyle().copyWith(
        fontWeight: FontWeight.w500,
        color: AppColors.white100,
        fontSize: 12
    ),
    labelSmall: const TextStyle().copyWith(
        fontWeight: FontWeight.w500,
        color: AppColors.white100,
        fontSize: 12
    ),

    bodyLarge: const TextStyle().copyWith(
        fontWeight: FontWeight.w500,
        color: AppColors.pink100,
        fontSize: 16
    ),
  );
}