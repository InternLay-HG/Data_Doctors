import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PageViewController extends GetxController {
  //* initialize the controller
  PageController pageController = PageController();

  //* declare index
  RxInt pageIndex = 0.obs;

  //* function to change index
  void changeIndex(index) {
    pageIndex.value = index;
    print(pageIndex);
  }

  //* Navigate to next page
  void navigatePage(){
    pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.linearToEaseOut);
  }

  //* Navigate to previous page
  void previousPage(){
     pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.linearToEaseOut);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
