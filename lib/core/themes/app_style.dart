import 'package:flutter/material.dart';

class AppFonts {
  static const String gilroy = 'Gilroy';
}
class AppStyle {
  static  TextStyle title =  const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 36,
      fontFamily: AppFonts.gilroy);

  static  TextStyle header2 = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 30,
      letterSpacing: -0.02,
      fontFamily: AppFonts.gilroy);

  static TextStyle header3 = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 24,
      letterSpacing: -0.02,
      fontFamily: AppFonts.gilroy
  );
  static TextStyle header = const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 21,
      fontFamily: AppFonts.gilroy
  );

  static TextStyle subtitle = const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14, fontFamily: AppFonts.gilroy);

  static  TextStyle body = const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      // letterSpacing: 1.4,
      fontFamily: AppFonts.gilroy);

  static  TextStyle small = const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14, fontFamily: AppFonts.gilroy);

  static const TextStyle preTitle = TextStyle(
      fontWeight: FontWeight.w500, fontSize: 14, fontFamily: AppFonts.gilroy);

  static const TextStyle buttonText = TextStyle(
      fontWeight: FontWeight.w500, fontSize: 16, fontFamily: AppFonts.gilroy);

  static const TextStyle link = TextStyle(
      fontWeight: FontWeight.w500, fontSize: 16, fontFamily: AppFonts.gilroy);
}