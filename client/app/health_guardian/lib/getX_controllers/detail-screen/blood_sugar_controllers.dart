import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BloodSugarControllers extends GetxController {
  //* initialize the controller
  PageController pageController = PageController();
  PageController pageControllerDate = PageController();
  TextEditingController noteController = TextEditingController();

  //* clear the note controller
  void noteClear() {
    noteController.clear();
  }

  //* declare index
  RxInt pageIndex = 0.obs;
  RxInt pageIndexDate = 0.obs;

  //* function to change index
  void changeIndex(index) {
    pageIndex.value = index;
    print(pageIndex);
  }

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

  //* Double for Sugar Level Entered By User
  RxDouble sugarLevel = 0.0.obs;

  void changeLevel(double value) {
    sugarLevel.value = value;
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
