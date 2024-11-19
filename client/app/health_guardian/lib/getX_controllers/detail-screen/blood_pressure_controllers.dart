import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class BloodPressureControllers extends GetxController{

  PageController pageControllerDate = PageController();
  TextEditingController noteController = TextEditingController();

  //* clear the note controller
  void noteClear() {
    noteController.clear();
  }
  
  //* declare index
  RxInt pageIndex = 0.obs;
  RxInt pageIndexDate = 0.obs;

  //* Navigate to next page
  void navigatePage() {
    pageIndex.value = 1;
  }

  void navigatePageDate() {
    pageControllerDate.nextPage(
        duration: Duration(milliseconds: 500), curve: Curves.linearToEaseOut);
    if (pageIndexDate.value < 1) {
      pageIndexDate.value++;
    }
  }

  //* Navigate to previous page
  void previousPage() {
    pageIndex.value = 0;
  }

  void previousPageDate() {
    pageControllerDate.previousPage(
        duration: Duration(milliseconds: 500), curve: Curves.linearToEaseOut);
    if (pageIndexDate.value > 0) {
      pageIndexDate.value--;
    }
  }
  //* Double for Pressure Level Entered By User
  RxDouble pressureLevelSystolic = 60.0.obs;

  void changeLevelSystolic(double value) {
    pressureLevelSystolic.value = value;
  }

  RxDouble pressureLevelDiastolic = 60.0.obs;

  void changeLevelDiastolic(double value) {
    pressureLevelDiastolic.value = value;
  }

   RxInt pulseLevel = 50.obs;

  void changeLevelPulse(int value) {
    pulseLevel.value = value;
  }

  //* for selecting state
  RxString State = "Default".obs;

  void DefaultSelect() {
    State.value = "Default";
  }

  void FastingSelect() {
    State.value = "Fasting";
  }

  void BeforeEatingSelect() {
    State.value = "Before Eating";
  }

  void AfterEating1h() {
    State.value = "After Eating (1h)";
  }

  void AfterEating2h() {
    State.value = "After Eating (2h)";
  }

  void AsleepSelect() {
    State.value = "Asleep";
  }

  void BeforeWorkoutSelect() {
    State.value = "Before Workout";
  }

  void AfterWorkoutSelect() {
    State.value = "After Workout";
  }
}