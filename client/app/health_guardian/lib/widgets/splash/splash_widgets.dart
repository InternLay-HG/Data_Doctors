import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import '../../styling/images.dart';

Widget iconWidgetSplash() {
  return Transform.scale(
    //* 1.180
    scale: 0.124 * SizeConfig.heightMultiplier,
    child: SvgPicture.asset(Images.heartIconRed),
  );
}

Widget textWidgetSplash(String title, double size) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      FittedBox(
        child: Text(
          overflow: TextOverflow.ellipsis,
          title,
          style: style.copyWith(fontSize: size),
        ),
      ),
    ],
  );
}

TextStyle style = TextStyle(
    letterSpacing: 0,
    color: Colors.black,
    fontFamily: "Poppins-Med",
    fontWeight: FontWeight.bold);

Widget textWidgetSplash1(String title, double size, Color color) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        title,
        style: style.copyWith(fontSize: size, color: color),
      ),
    ],
  );
}
