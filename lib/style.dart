import 'package:flutter/material.dart';

class AppColors {
  static const whiteColor = Color(0xffffffff);
  static const textColor = Color.fromARGB(255, 26, 3, 129);
  static const secondaryTextColor = Color(0xff524B6B);
  static const buttonColor = Color(0xffE6E1FF);
  static const primaryButtonColor = Color(0xff130160);
  static const tncButtonColor = Color(0xffFF9228);
  static const textField = Color(0xFF868585dd);
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
