//* This welcome screen shows when user has logged in already he just has to enter the app pin

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/getX_controllers/splash/splash_controller.dart';
import 'package:health_guardian/screens/dashboard/dashboard_screen.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/auth/login_widgets.dart';
import 'package:health_guardian/widgets/splash/splash_widgets.dart';

class WelcomeScreenUser extends StatelessWidget {
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
                        "Welcome Back!", 4.9 * SizeConfig.textMultiplier),
                    SizedBox(height: 1.8 * SizeConfig.heightMultiplier),
                    textWidgetSplash("Healthy Body, Happy Life",
                        3.5 * SizeConfig.textMultiplier),
                    SizedBox(height: 29.23 * SizeConfig.heightMultiplier),
                    authButton("Continue", Navigate),
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
