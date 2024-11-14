import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:health_guardian/styling/sizeConfig.dart';

Widget buttonsDetail(String title, void Function() onTap, Color color,
    Color textColor, double height, double width,double radius) {
  return GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: Duration(milliseconds: 100),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius)),
      height: height,
      width: width,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontFamily: "CoreSansMed",
            fontWeight: FontWeight.bold,
          ).copyWith(fontSize: 2.4 * SizeConfig.heightMultiplier),
        ),
      ),
    ),
  );
}

Widget buttonsDetail1(String title, void Function() onTap, Color color,
    Color textColor, double height, double width,double radius,double textSize) {
  return GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: Duration(milliseconds: 100),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius)),
      height: height,
      width: width,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontFamily: "CoreSansMed",
            fontWeight: FontWeight.bold,
          ).copyWith(fontSize: textSize),
        ),
      ),
    ),
  );
}