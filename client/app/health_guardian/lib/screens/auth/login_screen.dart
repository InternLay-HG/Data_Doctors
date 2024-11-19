import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/getX_controllers/auth/login_controllers.dart';
import 'package:health_guardian/screens/auth/otp_screen.dart';
import 'package:health_guardian/styling/images.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/auth/login_widgets.dart';

class LoginScreen extends StatelessWidget {
  final function loginControllers = Get.put(function());

  void signin() async {
    Future.delayed(Duration(milliseconds: 200), () {
      loginControllers.clear();
      print("Nav");
      Get.to(() => OtpScreen(), transition: Transition.rightToLeft);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: 4.5 * SizeConfig.widthMultiplier,
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
                height: 2.9 * SizeConfig.heightMultiplier,
              ),
              T1(
                "Welcome Back!",
                Images.welcomeIcon,
              ),
              SizedBox(
                height: 1.45 * SizeConfig.heightMultiplier,
              ),
              T2(
                "Login to continue your health journey.",
              ),
              SizedBox(
                height: 5.21 * SizeConfig.heightMultiplier,
              ),
              Authtext(
                "Email",
              ),
              SizedBox(
                height: 1.9 * SizeConfig.heightMultiplier,
              ),
              fieldText(
                "Enter your email",
                loginControllers.emailController,
                Icons.email_outlined,
                TextInputType.emailAddress,
              ),
              SizedBox(
                height: 3.16 * SizeConfig.heightMultiplier,
              ),
              Authtext(
                "Password",
              ),
              SizedBox(
                height: 1.9 * SizeConfig.heightMultiplier,
              ),
              Obx(
                () => TextField(
                  onChanged: (value) {
                    //* Validate password length
                    loginControllers.isPasswordValid.value = value.length >= 6;
                  },
                  style: TextStyle(
                    color: Color.fromARGB(255, 51, 49, 49),
                    fontFamily: "CoreSansLight",
                    fontSize: 2.31 * SizeConfig.heightMultiplier,
                  ),
                  obscureText: loginControllers.obscureText.value,
                  controller: loginControllers.passwordController,
                  decoration: fieldPasswordDecoration(
                    "Enter your password",
                    Icons.lock_outline,loginControllers.isPasswordValid.value
                  ).copyWith(
                    suffixIcon: IconButton(
                      icon: Icon(
                        loginControllers.obscureText.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Color.fromARGB(255, 51, 49, 49),
                        size: 2.63 * SizeConfig.heightMultiplier,
                      ),
                      onPressed: () {
                        loginControllers.obscureText.value =
                            !loginControllers.obscureText.value;
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5 * SizeConfig.heightMultiplier,
              ),
              forgotPassWidget(loginControllers),
              SizedBox(
                height: 23.6* SizeConfig.heightMultiplier,
              ),
              authButton(
                "Sign in",
                signin,
              ),
              SizedBox(
                height: 1.7 * SizeConfig.heightMultiplier,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
