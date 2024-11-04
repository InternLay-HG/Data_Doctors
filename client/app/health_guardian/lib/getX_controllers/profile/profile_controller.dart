import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  //* controller fo entering name
  TextEditingController profileNameCOntroller = TextEditingController();

  //* variables for selecting gender
  RxInt female = 0.obs;
  RxInt male = 0.obs;
  RxInt selectedHeight = 150.obs;

  //* variables of scrollable date,weight and height
  Rx<DateTime> selectedDate = DateTime.now().obs;
  RxInt selectedWeight = 50.obs;

  //* on change of scrollable
  void changeTime(DateTime newDate) {
    selectedDate.value = newDate;
  }

  void changeWeight(int newWeight) {
    selectedWeight.value = newWeight;
  }

    void changeHeight(int newHeight) {
    selectedHeight.value = newHeight;
  }

  //* booleans for selecting disease
  RxBool heart_disease = false.obs;
  RxBool blood_pressure = false.obs;
  RxBool blood_sugar = false.obs;
  RxBool weight_bmi = false.obs;

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
