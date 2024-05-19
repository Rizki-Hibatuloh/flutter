import 'package:flutter/material.dart';

class AppColors {
  static const whiteColor = Color(0xFFFFFFFF);
  static const textColor = Color(0xFF1A0381);
  static const secondaryTextColor = Color(0xFF524B6B);
  static const buttonColor = Color(0xFFE6E1FF);
  static const primaryButtonColor = Color(0xFF130160);
  static const tncButtonColor = Color(0xFFFF9228);
  static const textField = Color(0xFF8685dd);
}

class TextStyles {
  static TextStyle title = const TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold,
    fontSize: 30,
    color: AppColors.textColor,
  );
  static TextStyle body = const TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold,
    fontSize: 13,
    color: AppColors.secondaryTextColor,
  );
  static TextStyle textField = const TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold,
    fontSize: 13,
    color: AppColors.textField,
  );
}
