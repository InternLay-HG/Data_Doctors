import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HypertensionControllers extends GetxController{

  //* Cigs Per Day
  RxInt Cigs_Count = 0.obs;

  void change(int value){
    Cigs_Count.value = value;
  }

  //* BP Meds Count
  RxInt Meds_Count = 0.obs;

  void change_Meds(int value){
    Meds_Count.value = value;
  }

  //* BMI Count
  RxInt BMI_Count = 0.obs;

  void change_BMI(int value){
    BMI_Count.value = value;
  }
}