import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle regular = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static const TextStyle medium = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static const TextStyle semiBold = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static const TextStyle bold = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static TextStyle get title => bold.copyWith(fontSize: 20);
  static TextStyle get subtitle => semiBold.copyWith(fontSize: 16);
  static TextStyle get body => regular.copyWith(fontSize: 14);
  static TextStyle get caption => medium.copyWith(fontSize: 12);
}
