import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/state_manager.dart';

class AnalyzeSugarControllers extends GetxController {
  //* Family Diabetes
  RxString FD_State = "No".obs;

  void FD_SetState(String value) {
    FD_State.value = value;
  }

  //* High BP
  RxString HB_State = "Yes".obs;

  void HB_SetState(String value) {
    HB_State.value = value;
  }

  //* Physically Active
  RxString PA_State = "one hr or more".obs;

  void PA_SetState(String value) {
    PA_State.value = value;
  }

  //* BMI
  RxString BMI_State = "Yes".obs;

  void BMI_SetState(String value) {
    BMI_State.value = value;
  }

  //* Smoking
  RxString Smoking_State = "No".obs;

  void Smoking_SetState(String value) {
    Smoking_State.value = value;
  }

  //* Alchohol
  RxString Alchohol_State = "No".obs;

  void Alchohol_SetState(String value) {
    Alchohol_State.value = value;
  }

  //* Sleep
  RxDouble Sleep_Hours = 12.0.obs;

  void changeLevel(double newLevel) {
    Sleep_Hours.value = newLevel;
  }

  //* Sound Sleep
  RxString SoundSleep_State = "No".obs;

  void SoundSleep_SetState(String value) {
    SoundSleep_State.value = value;
  }

  //* Regular Medicine
  RxString RM_State = "No".obs;

  void RM_SetState(String value) {
    RM_State.value = value;
  }

  //* JunkFood
  RxString JF_State = "Often".obs;

  void JF_SetState(String value) {
    JF_State.value = value;
  }

  //* Stress
  RxString Stress_State = "Not At All".obs;

  void Stress_SetState(String value) {
    Stress_State.value = value;
  }

  //*  BP Level
  RxString BP_level_State = "Low".obs;

  void BP_level_SetState(String value) {
    BP_level_State.value = value;
  }

  //* Pregnancies Count
  RxInt P_Count = 0.obs;

  void P_Count_SetState(int value) {
    P_Count.value = value;
  }

  //* P_Diabetes
  RxString P_D_State = "Yes".obs;

  void P_D_State_SetState(String value) {
    P_D_State.value = value;
  }

  //* Urination_Freq
  RxString UF_State = "Not Much".obs;

  void UF_SetState(String value) {
    UF_State.value = value;
  }
}
