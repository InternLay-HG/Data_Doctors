//* This welcome screen will be shown when user logs in via email or password

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:health_guardian/getX_controllers/splash/splash_controller.dart';
import 'package:health_guardian/screens/dashboard/dashboard_screen.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/auth/login_widgets.dart';
import 'package:health_guardian/widgets/splash/splash_widgets.dart';

class WelcomeScreenNew extends StatelessWidget {
  final SplashController splashController = Get.put(SplashController());

  void Navigate() {
    Future.delayed(Duration(milliseconds: 200), () {
      Get.offAll(() => DashboardScreen(),transition: Transition.rightToLeft);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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

                    SizedBox(height: 11.26 * SizeConfig.imageSizeMultiplier),
                    textWidgetSplash(
                        "Your Profile", 4.84 * SizeConfig.textMultiplier),
                    textWidgetSplash(
                        "has been Created !", 4.50 * SizeConfig.textMultiplier),
                    SizedBox(height: 2.1 * SizeConfig.heightMultiplier),
                    textWidgetSplash1(
                        "Click to Proceed !",
                        3.8 * SizeConfig.textMultiplier,
                        const Color.fromARGB(255, 81, 79, 79)),
                    SizedBox(height: 22.23 * SizeConfig.heightMultiplier),
                    authButton("Proceed", Navigate),
                     SizedBox(height: 2.23 * SizeConfig.heightMultiplier),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
