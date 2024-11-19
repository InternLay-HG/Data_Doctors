import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/getX_controllers/auth/forgot_pass_controllers.dart';
import 'package:health_guardian/screens/auth/reset_password_screen.dart';
import 'package:health_guardian/screens/auth/user_password_notify.dart';
import 'package:health_guardian/styling/images.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/auth/login_widgets.dart';

class ForgotCodeScreen extends StatelessWidget {
  final ForgotPassControllers controller = Get.put(ForgotPassControllers());

  void submit(BuildContext context) {
    controller.clear1();
    Future.delayed(Duration(milliseconds: 200), () async {
      //* navigate to login page
      Get.to(() => MyWidget(), transition: Transition.rightToLeft);
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
                  horizontal: 4 * SizeConfig.widthMultiplier,
                  vertical: 2.10 * SizeConfig.heightMultiplier),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 4.00 * SizeConfig.heightMultiplier,
                        )),
                  ),
                  SizedBox(
                    height: 3.16 * SizeConfig.heightMultiplier,
                  ),
                  T1(
                    "Enter Code",
                    Images.otpIcon,
                  ),
                  SizedBox(
                    height: 1.45 * SizeConfig.heightMultiplier,
                  ),
                  T2(
                    "Enter the 4-digit PIN sent to your email\nto continue.",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3.5 * SizeConfig.heightMultiplier,
            ),
            OTPfield(controller.otpController),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 4.91 * SizeConfig.widthMultiplier),
              child: Column(
                children: [
                  SizedBox(
                    height: 4.21 * SizeConfig.heightMultiplier,
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
                    height: 42.5 * SizeConfig.heightMultiplier,
                  ),
                  authButton("Continue", () {
                    submit(context);
                  })
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
