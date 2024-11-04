import 'package:flutter/material.dart';

class Colours {
  Colours._();

  static const backgroundColor = Color(0xFF181A20);
  static const buttonColorDarkBlue = Color(0xFF006DB6);
  static const blueGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF0066CC), // Light blue
      Color(0xFF003366), // Dark blue
    ],
  );
  static const buttonColorLightBlue = Color(0xFFBFE3FB);

  static const buttonColorRed =  Color(0xFFFD4452);
}
