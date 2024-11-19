import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/getX_controllers/analyze-screen/hypertension_controllers.dart';
import 'package:health_guardian/styling/images.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/analyze-hypertension/widgets_1.dart';
import 'package:health_guardian/widgets/analyze-screen/widgets_1.dart';
import 'package:health_guardian/widgets/auth/login_widgets.dart';
import 'package:health_guardian/widgets/dashboard/dashboard_widgets_2.dart';

class AnalyzeHypertension extends StatelessWidget {
  final HypertensionControllers controller = Get.put(HypertensionControllers());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 241, 241),
      appBar: appBAnalyze(() {
        Get.back();
      }, () {}, Images.BloodPressureMeasureIcon2),
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
                  "Complete the Health Form Below,Get\nYour Hypertension Report Instantly!",
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
                height: 20,
              ),

              //* cigsPerDay and BPMeds
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CigsCard("Cigarette Count", Icons.smoke_free, "10", 220, controller),
                  MedsCard("BP Meds", Icons.medication, "10",190, controller)
                ],
              ),

              SizedBox(
                height: 20,
              ),

              //* Systolic BP and Diastolic BP
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnalyzeCard("Systolic BP", Icons.bloodtype, "140 pa", 205,),
                  AnalyzeCard("Diastolic BP", Icons.bloodtype, "140 pa", 205),
                ],
              ),
               SizedBox(
                height: 20,
              ),

              //* BMI and Heart Rate
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnalyzeCard("BMI Index", Icons.bloodtype, "12.5 BMI", 205),
                  AnalyzeCard("Heart Rate", Icons.monitor_heart_sharp, "86 bpm", 205),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              //* Total Cholesterol
              Align(
                alignment: Alignment.bottomCenter,
                child: AnalyzeCard("Cholesterol Level", Icons.health_and_safety_outlined, "120 mg/dL", 235),
              ),

              SizedBox(
                  height: 40,
                ),

             //* Analyze Button
             authButton("Analyze", () {}),
                SizedBox(
                  height: 15,
                ),
            ],
          ),
        ),
      ),
    ));
  }
}
