import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/getX_controllers/auth/forgot_pass_controllers.dart';
import 'package:health_guardian/getX_controllers/splash/splash_controller.dart';
import 'package:health_guardian/screens/auth/login_screen.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/auth/login_widgets.dart';
import 'package:health_guardian/widgets/splash/splash_widgets.dart';

class UserPasswordNotify extends StatelessWidget {
  final SplashController splashController = Get.put(SplashController());

  void submit(BuildContext context) {
    Future.delayed(Duration(milliseconds: 200), () async {
      //* navigate to login page
      Get.to(() => LoginScreen(), transition: Transition.rightToLeft);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: 3.34 * SizeConfig.widthMultiplier),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 26.23 * SizeConfig.heightMultiplier),
        
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
        
                SizedBox(height: 8 * SizeConfig.imageSizeMultiplier),
                textWidgetSplash(
                    "Your password has been", 3.5 * SizeConfig.textMultiplier),
        
                textWidgetSplash(
                    "changed successfully!", 3.5 * SizeConfig.textMultiplier),
        
                SizedBox(height: 32.23 * SizeConfig.heightMultiplier),
                authButton("Proceed", () {
                  submit(context);
                }),
                SizedBox(height: 2.23 * SizeConfig.heightMultiplier),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
