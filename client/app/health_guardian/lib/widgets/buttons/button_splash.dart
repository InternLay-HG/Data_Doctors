import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/getX_controllers/button/button_controllers.dart';
import 'package:health_guardian/screens/onboard/onboard_screen.dart';
import 'package:health_guardian/styling/colors.dart';
import 'package:health_guardian/styling/sizeConfig.dart';

void _navigateAfterAnimation() async {
  //* Wait for the animation to complete
  await Future.delayed(const Duration(milliseconds: 200));

  //* Navigate to the new page
  Get.off(() => OnboardScreen(), transition: Transition.downToUp);
}

final ButtonControllers controller = Get.put(ButtonControllers());

Widget buttonWidgetSplash(String title) {
  return GestureDetector(
    onTapDown: (_) {
      controller.setPressed(true); //* Shrink the button when pressed
    },
    onTapUp: (_) {
      controller.setPressed(
          false); //* Return to original size when the tap is released

      _navigateAfterAnimation();
    },
    child: Obx(
      () => TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 100),
        tween: Tween<double>(
          begin: 1.0,
          end: controller.isPressed.value ? 0.85 : 1.0,
        ),
        builder: (context, scale, child) {
          return Transform.scale(
            scale: scale,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              height: 7.37 * SizeConfig.heightMultiplier,
              width: 58.03 * SizeConfig.widthMultiplier,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  controller.isPressed.value
                      ? 4.00 * SizeConfig.heightMultiplier
                      : 4.3 * SizeConfig.heightMultiplier,
                ),
                color: Colours.buttonColorRed,
              ),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: "Poppins-Med",
                    color: Colors.white,
                    fontSize: 3.37 * SizeConfig.heightMultiplier,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}

