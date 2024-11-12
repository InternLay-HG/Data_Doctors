import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/getX_controllers/button/button_controllers.dart';
import 'package:health_guardian/styling/sizeConfig.dart';

final ButtonControllers controller = Get.put(ButtonControllers());

Widget doubleButton1(
    String title, void Function() onTap, Color color, Color textColor) {
  return GestureDetector(
    onTapDown: (_) {
      controller.setPressed(true); //* Shrink the button when pressed
    },
    onTapUp: (_) {
      controller.setPressed(
          false); //* Return to original size when the tap is released
    },

    //* onTap is used to navigate to other screen
    onTap: onTap,
    child: Obx(
      () => TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 100),
        tween: Tween<double>(
          begin: 1.0,
          end: controller.isPressed.value ? 0.93 : 1.0,
        ),
        builder: (context, scale, child) {
          return Transform.scale(
            scale: scale,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 100),
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(
                      3.16 * SizeConfig.heightMultiplier)),
              height: 6.32 * SizeConfig.heightMultiplier,
              width: 43.64 * SizeConfig.widthMultiplier,
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
    ),
  );
}

Widget doubleButton2(
    String title, void Function() onTap, Color color, Color textColor) {
  return GestureDetector(
    onTapDown: (_) {
      controller.setPressed1(true); //* Shrink the button when pressed
    },
    onTapUp: (_) {
      controller.setPressed1(
          false); //* Return to original size when the tap is released
    },

    //* onTap is used to navigate to other screen
    onTap: onTap,
    child: Obx(
      () => TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 100),
        tween: Tween<double>(
          begin: 1.0,
          end: controller.isPressed1.value ? 0.93 : 1.0,
        ),
        builder: (context, scale, child) {
          return Transform.scale(
            scale: scale,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 100),
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(
                      3.16 * SizeConfig.heightMultiplier)),
              height: 6.32 * SizeConfig.heightMultiplier,
              width: 43.64 * SizeConfig.widthMultiplier,
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
    ),
  );
}
