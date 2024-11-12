import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ButtonControllers extends GetxController {
  //* boolean for checking button state if pressed
  RxBool isPressed = false.obs;
  RxBool isPressed1 = false.obs;

  // Method to set pressed state
  void setPressed(bool value) {
    isPressed.value = value;
  }

  void setPressed1(bool value) {
    isPressed1.value = value;
  }
}
