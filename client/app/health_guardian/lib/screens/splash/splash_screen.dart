import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/getX_controllers/splash/splash_controller.dart';
import 'package:health_guardian/screens/onboard/onboard_screen.dart';
import 'package:health_guardian/widgets/splash/splash_widgets.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 230),

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

                SizedBox(height: 50),
                textWidgetSplash("Welcome!", 46),
                textWidgetSplash("to", 46),
                textWidgetSplash("Health Guardian", 48),
                SizedBox(height: 160),
                buttonWidgetSplash("Let's Begin", () {
                  Get.off(() => OnboardScreen(),
                      transition: Transition.downToUp);
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
