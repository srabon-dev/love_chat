import 'package:chat_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TBottomSheetTheme {
  TBottomSheetTheme._();

  static BottomSheetThemeData lightBottomSheetLightTheme = BottomSheetThemeData(
    backgroundColor: AppColors.pink100,
    modalBackgroundColor: AppColors.pink100,
    constraints: const BoxConstraints(maxWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  );

  static BottomSheetThemeData darkBottomSheetDarkTheme = BottomSheetThemeData(
    backgroundColor: AppColors.black100,
    modalBackgroundColor: AppColors.black100,
    constraints: const BoxConstraints(maxWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  );
}