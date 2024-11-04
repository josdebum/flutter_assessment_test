import 'package:flutter/material.dart';
import 'package:flutter_assessment/core/utils/extensions.dart';



class AppFonts {
  static const String gilroy = 'Gilroy';
}
class AppStyle {
  static  TextStyle title =  TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 36,
      fontFamily: AppFonts.gilroy);

  static  TextStyle header2 = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 30,
      letterSpacing: -0.02,
      fontFamily: AppFonts.gilroy);

  static TextStyle header3 = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 24,
      letterSpacing: -0.02,
      fontFamily: AppFonts.gilroy
  );
  static TextStyle header = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 21,
      fontFamily: AppFonts.gilroy
  );

  static TextStyle subtitle = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14, fontFamily: AppFonts.gilroy);

  static  TextStyle body = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      // letterSpacing: 1.4,
      fontFamily: AppFonts.gilroy);

  static  TextStyle small = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14, fontFamily: AppFonts.gilroy);

  static const TextStyle preTitle = TextStyle(
      fontWeight: FontWeight.w500, fontSize: 14, fontFamily: AppFonts.gilroy);

  static const TextStyle buttonText = TextStyle(
      fontWeight: FontWeight.w500, fontSize: 16, fontFamily: AppFonts.gilroy);

  static const TextStyle link = TextStyle(
      fontWeight: FontWeight.w500, fontSize: 16, fontFamily: AppFonts.gilroy);
}