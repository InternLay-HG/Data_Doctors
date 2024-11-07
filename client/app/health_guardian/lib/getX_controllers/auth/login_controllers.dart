import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class function extends GetxController {
  //* initialize the controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  //*clear controllers
  void clear() {
    emailController.clear();
    passwordController.clear();
  }

  void otpClear() {
    otpController.clear();
  }

  //* bool for checkbox
  RxBool isCheck = false.obs;

  //* function or changing checkbox value
  void changeCheck(value) {
    isCheck.value = !isCheck.value;
  }

  RxBool obscureText = false.obs;

  @override
  void onClose() {
    super.onClose();
  }
}
