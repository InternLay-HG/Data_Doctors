import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:health_guardian/getX_controllers/auth/forgot_pass_controllers.dart';
import 'package:health_guardian/screens/auth/forgot_code_screen.dart';
import 'package:health_guardian/styling/images.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/auth/login_widgets.dart';

class ForgotPassword extends StatelessWidget {
  final ForgotPassControllers controller = Get.put(ForgotPassControllers());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: 4.3 * SizeConfig.widthMultiplier,
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
              T1("Forgot Password", Images.lockIcon),
              SizedBox(
                height: 1.45 * SizeConfig.heightMultiplier,
              ),
              T2(
                "A 4-digit verification code will be sent\nto your email address.",
              ),
              SizedBox(
                height: 2.8 * SizeConfig.heightMultiplier,
              ),
              fieldText("Enter your email", controller.controller, Icons.email,
                  TextInputType.emailAddress),
              
              SizedBox(
                height: 52.5 * SizeConfig.heightMultiplier,
              ),
              authButton("Send Code", () {
                Get.to(() => ForgotCodeScreen(),
                    transition: Transition.rightToLeft);
              })
            ],
          ),
        ),
      ),
    ));
  }
}
