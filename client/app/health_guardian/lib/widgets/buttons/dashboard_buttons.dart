import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/getX_controllers/button/button_controllers.dart';
import 'package:health_guardian/styling/sizeConfig.dart';

final ButtonControllers controller = Get.put(ButtonControllers());

Widget buttonsDisease(String title, void Function() onTap, Color color,
    Color textColor, double height, double width) {
  return InkWell(
    splashColor: Colors.black,
    highlightColor: Colors.black.withOpacity(0.5),
    onTap: onTap,
    child: AnimatedContainer(
      duration: Duration(milliseconds: 100),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(controller.isPressed1.value
              ? 3.00 * SizeConfig.heightMultiplier
              : 3.16 * SizeConfig.heightMultiplier)),
      height: height,
      width: width,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontFamily: "CoreSansMed",
            fontWeight: FontWeight.bold,
          ).copyWith(fontSize: 2.6 * SizeConfig.heightMultiplier),
        ),
      ),
    ),
  );
}


