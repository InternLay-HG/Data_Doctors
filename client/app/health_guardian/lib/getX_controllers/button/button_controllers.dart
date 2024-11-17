import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ButtonControllers extends GetxController {
  //* boolean for checking button state if pressed
  RxBool isPressed = false.obs;
  RxBool isPressed1 = false.obs;

  //* booleans for detail screen
  RxBool bloodSugarDetail = false.obs;
  RxBool bloodPressure = false.obs;
  RxBool weightDetail = false.obs;

  //* booleans for analyze screen
  RxBool heartAttack = false.obs;
  RxBool hyperTension = false.obs;
  RxBool bloodSugar = false.obs;

  //* Method to set pressed state
  void setPressed(bool value) {
    isPressed.value = value;
  }

  void setPressed1(bool value) {
    isPressed1.value = value;
  }

  //* for detail
  void setBloodSugar(bool value) {
    bloodSugarDetail.value = value;
  }

  void setBloodPressure(bool value) {
    bloodPressure.value = value;
  }

  void setWeightDetail(bool value) {
    weightDetail.value = value;
  }

  //* for analyze
  void setPressedHeartAttack(bool value) {
    heartAttack.value = value;
  }

  void setPressedHyperTension(bool value) {
    hyperTension.value = value;
  }

  void setPressedBloodSugar(bool value) {
    bloodSugar.value = value;
  }
}
