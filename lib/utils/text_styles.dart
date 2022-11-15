import 'package:flutter/material.dart';

class TextStyles{
  static TextStyle? heading1;
  static TextStyle? textStyle1;

  static init() {
    initHeadings();
  }

  static void initHeadings() {
    heading1 = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    );
    textStyle1 = const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 15
    );
  }
}