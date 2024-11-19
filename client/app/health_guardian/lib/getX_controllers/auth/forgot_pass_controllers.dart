import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ForgotPassControllers extends GetxController {
  TextEditingController controller = TextEditingController();
  TextEditingController otpController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController ConfirmPasswordController = TextEditingController();

  var isPasswordValid1 = true.obs;
  var isPasswordValid2 = true.obs;


  void clear() {
    controller.clear();
  }

  void clear1() {
    otpController.clear();
  }

  void clear2() {
    passwordController.clear();
    ConfirmPasswordController.clear();
  }

  RxBool obscureText = false.obs;
  RxBool obscureText1 = false.obs;
}
