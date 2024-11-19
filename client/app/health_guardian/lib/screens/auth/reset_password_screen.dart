import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:health_guardian/getX_controllers/auth/forgot_pass_controllers.dart';
import 'package:health_guardian/screens/auth/user_password_notify.dart';
import 'package:health_guardian/styling/images.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/auth/login_widgets.dart';

class MyWidget extends StatelessWidget {
  final ForgotPassControllers controller = Get.put(ForgotPassControllers());

  void submit() async {
    Future.delayed(Duration(milliseconds: 200), () {
      controller.clear2();
      print("Nav");
      Get.to(() => UserPasswordNotify(), transition: Transition.rightToLeft);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
              T1("Change Password", Images.lockIcon),
              SizedBox(
                height: 1.45 * SizeConfig.heightMultiplier,
              ),
              T2(
                "Create your new password to continue",
              ),
              SizedBox(
                height: 5.21 * SizeConfig.heightMultiplier,
              ),
              Authtext(
                "New Password",
              ),
              SizedBox(
                height: 1.9 * SizeConfig.heightMultiplier,
              ),
              Obx(
                () => TextField(
                  style: TextStyle(
                    color: Color.fromARGB(255, 51, 49, 49),
                    fontFamily: "CoreSansLight",
                    fontSize: 2.31 * SizeConfig.heightMultiplier,
                  ),
                  obscureText: controller.obscureText.value,
                  controller: controller.passwordController,
                  decoration: fieldPasswordDecoration(
                    "Enter your password",
                    Icons.lock_outline,
                  ).copyWith(
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.obscureText.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Color.fromARGB(255, 51, 49, 49),
                        size: 2.63 * SizeConfig.heightMultiplier,
                      ),
                      onPressed: () {
                        controller.obscureText.value =
                            !controller.obscureText.value;
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 3.5 * SizeConfig.heightMultiplier,
              ),
               Authtext(
                "Confirm New Password",
              ),
              SizedBox(
                height: 1.9 * SizeConfig.heightMultiplier,
              ),
              Obx(
                () => TextField(
                  style: TextStyle(
                    color: Color.fromARGB(255, 51, 49, 49),
                    fontFamily: "CoreSansLight",
                    fontSize: 2.31 * SizeConfig.heightMultiplier,
                  ),
                  obscureText: controller.obscureText1.value,
                  controller: controller.ConfirmPasswordController,
                  decoration: fieldPasswordDecoration(
                    "Re-Enter your password",
                    Icons.lock_outline,
                  ).copyWith(
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.obscureText1.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Color.fromARGB(255, 51, 49, 49),
                        size: 2.63 * SizeConfig.heightMultiplier,
                      ),
                      onPressed: () {
                        controller.obscureText1.value =
                            !controller.obscureText1.value;
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height:30.8* SizeConfig.heightMultiplier,
              ),
              authButton(
                "Change Password",
                (){submit();},
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
