import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/getX_controllers/analyze-screen/analyze_sugar_controllers.dart';
import 'package:health_guardian/getX_controllers/detail-screen/blood_sugar_controllers.dart';
import 'package:health_guardian/styling/colors.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/analyze-screen/widgets_1.dart';
import 'package:health_guardian/widgets/analyze-screen/widgets_2.dart';
import 'package:health_guardian/widgets/analyze-screen/widgets_3.dart';
import 'package:health_guardian/widgets/auth/login_widgets.dart';
import 'package:health_guardian/widgets/dashboard/dashboard_widgets_2.dart';

class AnalyzeSugarScreen extends StatelessWidget {
  final AnalyzeSugarControllers controller = Get.put(AnalyzeSugarControllers());
  final BloodSugarControllers controllers = Get.put(BloodSugarControllers());

  Color getBackgroundColor(bool condition) =>
      condition ? Colours.buttonColorRed : Color.fromARGB(255, 246, 240, 241);

  Color getTextColor(bool condition) => condition ? Colors.white : Colors.black;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 247, 241, 241),
        appBar: appBAnalyzeSugar(() {
          Get.back();
        }, () {}),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 15,
                ),

                //* title text
                descTextAnalyze(
                    "Complete the Health Form Below,Get\nYour Diabetes Stage Report Instantly!",
                    2.50 * SizeConfig.heightMultiplier),

                SizedBox(
                  height: 30,
                ),

                //* form fields
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnalyzeCard("Age", Icons.person, "28", 205),
                    AnalyzeCard("Gender", Icons.male, "Male", 205),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),

                //* family diabetes and high BP cards
                Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Double_Parameter_Card(
                        "Family Diabetes",
                        controller.FD_State.value,
                        () => controller.FD_SetState("Yes"),
                        () => controller.FD_SetState("No"),
                        "Yes",
                        "No",
                        controller.FD_State.value == "Yes",
                        controller.FD_State.value == "No",
                        220,
                      ),
                      Double_Parameter_Card(
                        "High BP",
                        controller.HB_State.value,
                        () => controller.HB_SetState("Yes"),
                        () => controller.HB_SetState("No"),
                        "Yes",
                        "No",
                        controller.HB_State.value == "Yes",
                        controller.HB_State.value == "No",
                        190,
                      ),
                    ],
                  );
                }),
                SizedBox(height: 15),

                //* personal diabetes and physical activity cards
                Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Double_Parameter_Card(
                        "P Diabetes",
                        controller.P_D_State.value,
                        () => controller.P_D_State_SetState("Yes"),
                        () => controller.P_D_State_SetState("No"),
                        "Yes",
                        "No",
                        controller.P_D_State.value == "Yes",
                        controller.P_D_State.value == "No",
                        195,
                      ),
                      Four_Parameter_Card(
                        "Physically Active",
                        controller.PA_State.value,
                        () => controller.PA_SetState('One Hr or more'),
                        () => controller.PA_SetState('More than half an hr'),
                        () => controller.PA_SetState('Less than half an hr'),
                        () => controller.PA_SetState('None'),
                        'One Hr or more',
                        'More than half an hr',
                        'Less than half an hr',
                        'None',
                        215,
                      ),
                    ],
                  );
                }),
                SizedBox(height: 15),

                //* smoking and alcohol cards
                Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Double_Parameter_Card(
                        "Smoking",
                        controller.Smoking_State.value,
                        () => controller.Smoking_SetState("Yes"),
                        () => controller.Smoking_SetState("No"),
                        "Yes",
                        "No",
                        controller.Smoking_State.value == "Yes",
                        controller.Smoking_State.value == "No",
                        205,
                      ),
                      Double_Parameter_Card(
                        "Alcohol",
                        controller.Alchohol_State.value,
                        () => controller.Alchohol_SetState("Yes"),
                        () => controller.Alchohol_SetState("No"),
                        "Yes",
                        "No",
                        controller.Alchohol_State.value == "Yes",
                        controller.Alchohol_State.value == "No",
                        205,
                      ),
                    ],
                  );
                }),
                SizedBox(height: 15),

                //* BMI and Sleep cards
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnalyzeCard("BMI", Icons.person, "28.3", 205),
                    SleepCard("Sleep", Icons.night_shelter_outlined, "10 Hours",
                        205, controller),
                  ],
                ),
                SizedBox(height: 15),

                //* Sound sleep and pregnancies cards
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => Double_Parameter_Card(
                        "Sound Sleep",
                        controller.SoundSleep_State.value,
                        () => controller.SoundSleep_SetState("Yes"),
                        () => controller.SoundSleep_SetState("No"),
                        "Yes",
                        "No",
                        controller.SoundSleep_State.value == "Yes",
                        controller.SoundSleep_State.value == "No",
                        205,
                      ),
                    ),
                    PregnancyCard("Pregnancies", Icons.pregnant_woman, "2", 205,
                        controller),
                  ],
                ),
                SizedBox(height: 15),

                //* Junk food and stress cards
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Four_Parameter_Card(
                        "Junk Food",
                        controller.JF_State.value,
                        () => controller.JF_SetState("Occasionally"),
                        () => controller.JF_SetState("Often"),
                        () => controller.JF_SetState("Very Often"),
                        () => controller.JF_SetState("Always"),
                        "Occasionally",
                        "Often",
                        "Very Often",
                        "Always",
                        205,
                      ),
                      Four_Parameter_Card(
                        "Stress",
                        controller.Stress_State.value,
                        () => controller.Stress_SetState('Not at all'),
                        () => controller.Stress_SetState('Sometimes'),
                        () => controller.Stress_SetState('Very Often'),
                        () => controller.Stress_SetState('Always'),
                        'Not at all',
                        'Sometimes',
                        'Very Often',
                        'Always',
                        205,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),

                //* BP Level And Urination freq
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      triple_Parameter_Card(
                          "BP Level",
                          controller.BP_level_State.value,
                          () => controller.BP_level_SetState("Low"),
                          () => controller.BP_level_SetState("Normal"),
                          () => controller.BP_level_SetState("High"),
                          "Low",
                          "Normal",
                          "High",
                          205),
                      Double_Parameter_Card(
                          "Urination Freq",
                          controller.UF_State.value,
                          () => controller.UF_SetState('Not Much'),
                          () => controller.UF_SetState('Quite Often'),
                          'Not Much',
                          'Quite Often',
                          controller.UF_State.value == 'Not Much',
                          controller.UF_State.value == 'Quite Often',
                          205),
                    ],
                  ),
                ),

                //* Regular Medicine
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Obx(
                    () => Double_Parameter_Card(
                        "Regular Medicine",
                        controller.RM_State.value,
                        () => controller.RM_SetState("Yes"),
                        () => controller.RM_SetState("No"),
                        "Yes",
                        "No",
                        controller.RM_State.value == "Yes",
                        controller.RM_State.value == "No",
                        235),
                  ),
                ),

                //*Analyze button
                SizedBox(
                  height: 55,
                ),
                authButton("Analyze", () {}),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
