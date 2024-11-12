import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/getX_controllers/splash/splash_controller.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/buttons/button_splash.dart';
import 'package:health_guardian/widgets/splash/splash_widgets.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: 3.34 * SizeConfig.widthMultiplier),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 24.23 * SizeConfig.heightMultiplier),

                //* Use AnimatedBuilder to animate iconWidgetSplash with the scaleAnimation
                AnimatedBuilder(
                  animation: splashController.scaleAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: splashController.scaleAnimation.value,
                      child: iconWidgetSplash(),
                    );
                  },
                ),

                SizedBox(height: 7.26 * SizeConfig.imageSizeMultiplier),
                textWidgetSplash("Welcome!", 4.84 * SizeConfig.textMultiplier),
                textWidgetSplash("to", 4.84 * SizeConfig.textMultiplier),
                textWidgetSplash(
                    "Health Guardian", 5.05 * SizeConfig.heightMultiplier),
                SizedBox(height: 16.85 * SizeConfig.heightMultiplier),
                buttonWidgetSplash(
                  "Let's Begin",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
