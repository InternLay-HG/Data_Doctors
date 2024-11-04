import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:health_guardian/getX_controllers/auth/login_controllers.dart';
import 'package:health_guardian/screens/auth/login_screen.dart';

import 'package:health_guardian/screens/onboard/onboard_screen.dart';
import 'package:health_guardian/screens/profile/profile_completion_screen.dart';
import 'package:health_guardian/screens/splash/splash_screen.dart';
import 'package:health_guardian/styling/images.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/auth/login_widgets.dart';

class OtpScreen extends StatelessWidget {
  final function controller = Get.put(function());

  void submit(){
    controller.otpClear();
    Get.off(()=>ProfileCompletionScreen(),transition: Transition.upToDown);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                        onTap: () => Get.off(() => LoginScreen()),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 38,
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  T1(
                    "Enter your App Pin",
                    Images.otpIcon,
                  ),
                  SizedBox(
                    height: 1.45 * SizeConfig.heightMultiplier,
                  ),
                  T2(
                    "Enter your 4 digit pin to continue.",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3.5 * SizeConfig.heightMultiplier,
            ),
            OTPfield(controller.otpController),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  FittedBox(
                    child: Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      "Please check your PIN before submitting",
                      style: TextStyle(
                          color: Color.fromARGB(255, 99, 92, 92),
                          fontFamily: "CoreSansLight",
                          fontWeight: FontWeight.bold,
                          fontSize: 2.25 * SizeConfig.heightMultiplier),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  authButton("Continue", submit)
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
