import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/getX_controllers/button/button_controllers.dart';
import 'package:health_guardian/styling/sizeConfig.dart';

final ButtonControllers controller = Get.put(ButtonControllers());

Widget buttonsDisease(String title, void Function() onTap, Color color,
    Color textColor, double height, double width,RxBool buttonValue,void Function(bool) OnTap1) {
  return GestureDetector(
    onTapDown: (_) {
      OnTap1(true); //* Shrink the button when pressed
    },
    onTapUp: (_) {
      OnTap1(false); //* Return to original size when the tap is released
    },

    //* onTap is used to navigate to other screen
    onTap: onTap,
    child: Obx(
      () => TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 100),
        tween: Tween<double>(
          begin: 1.0,
          end: buttonValue.value ? 0.93 : 1.0,
        ),
        builder: (context, scale, child) {
          return Transform.scale(
            scale: scale,
            child:AnimatedContainer(
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
        },
      ),
    )
 );
}

Widget analyzeButton(String title, void Function() onTap, Color color,
    Color textColor, double height, double width,double radius,double textSize,RxBool buttonValue,void Function(bool) OnTap1){
 return GestureDetector(
    onTapDown: (_) {
      OnTap1(true); //* Shrink the button when pressed
    },
    onTapUp: (_) {
      OnTap1(false); //* Return to original size when the tap is released
    },

    //* onTap is used to navigate to other screen
    onTap: onTap,
    child: Obx(
      () => TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 100),
        tween: Tween<double>(
          begin: 1.0,
          end: buttonValue.value ? 0.93 : 1.0,
        ),
        builder: (context, scale, child) {
          return Transform.scale(
            scale: scale,
            child:AnimatedContainer(
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
        },
      ),
    )
 );
}

