import 'package:flutter/material.dart';
import 'package:health_guardian/styling/colors.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import '../../styling/images.dart';

Widget iconWidgetSplash() {
  return Transform.scale(
    //* 1.180
    scale: 0.124 * SizeConfig.heightMultiplier,
    child: Image.asset(
      Images.heartIconRed,
    ),
  );
}

Widget textWidgetSplash(String title, double size) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        title,
        style: style.copyWith(fontSize: size),
      ),
    ],
  );
}

Widget buttonWidgetSplash(String title,void Function() onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 7.37 * SizeConfig.heightMultiplier,
      width: 58.03 * SizeConfig.widthMultiplier,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.21 *SizeConfig.heightMultiplier), color: Colours.buttonColorRed),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              fontFamily: "Poppins-Med", color: Colors.white, fontSize: 3.37*SizeConfig.heightMultiplier,fontWeight: FontWeight.w800),
        ),
      ),
    ),
  );
}

TextStyle style = TextStyle(
  letterSpacing: 0,
  color: Colors.black,
  fontFamily: "Poppins-Med",
  fontWeight: FontWeight.bold
);
