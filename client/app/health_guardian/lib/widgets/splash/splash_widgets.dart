import 'package:flutter/material.dart';
import 'package:health_guardian/styling/colors.dart';
import '../../styling/images.dart';

Widget iconWidgetSplash() {
  return Transform.scale(
    scale: 1.180,
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
      height: 70,
      width: 260,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40), color: Colours.buttonColorRed),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              fontFamily: "Poppins-Med", color: Colors.white, fontSize: 32,fontWeight: FontWeight.w800),
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
