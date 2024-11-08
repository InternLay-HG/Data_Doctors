import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/screens/onboard/onboard_screen.dart';
import 'package:health_guardian/widgets/splash/splash_widgets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 230,
              ),
              iconWidgetSplash(),
              SizedBox(
                height: 50,
              ),
              textWidgetSplash("Welcome!", 46),
              textWidgetSplash("to", 46),
              textWidgetSplash("Health Guardian", 48),
              SizedBox(
                height: 160,
              ),
              buttonWidgetSplash("Let's Begin", () {
                Get.off(() => OnboardScreen(), transition: Transition.downToUp);
              })
            ],
          ),
        ),
      ),
    ));
  }
}
