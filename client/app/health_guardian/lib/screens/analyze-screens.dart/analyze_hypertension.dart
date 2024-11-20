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
          padding: EdgeInsets.symmetric(horizontal: 2.67*SizeConfig.widthMultiplier, vertical: 1.05*SizeConfig.heightMultiplier),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 1.58*SizeConfig.heightMultiplier,
              ),

              //* title text
              descTextAnalyze(
                  "Complete the Health Form Below, Get",
                  2.6 * SizeConfig.heightMultiplier),
              descTextAnalyze("Your Hypertension Report Instantly!", 2.6 * SizeConfig.heightMultiplier),

              SizedBox(
                height: 3.16*SizeConfig.heightMultiplier,
              ),

              //* form fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnalyzeCard("Age", Icons.person, "28", 45.75*SizeConfig.widthMultiplier),
                  AnalyzeCard("Gender", Icons.male, "Male", 45.75*SizeConfig.widthMultiplier),
                ],
              ),
              SizedBox(
                height: 2.10*SizeConfig.heightMultiplier,
              ),

              //* cigsPerDay and BPMeds
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CigsCard("Cigarette Count", Icons.smoke_free, "10", 49.10*SizeConfig.widthMultiplier, controller),
                  MedsCard("BP Meds", Icons.medication, "10",42.41*SizeConfig.widthMultiplier, controller)
                ],
              ),

              SizedBox(
                height: 2.10*SizeConfig.heightMultiplier,
              ),

              //* Systolic BP and Diastolic BP
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnalyzeCard("Systolic BP", Icons.bloodtype, "140 pa", 45.75*SizeConfig.widthMultiplier,),
                  AnalyzeCard("Diastolic BP", Icons.bloodtype, "140 pa", 45.75*SizeConfig.widthMultiplier),
                ],
              ),
               SizedBox(
                height: 2.10*SizeConfig.heightMultiplier,
              ),

              //* BMI and Heart Rate
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnalyzeCard("BMI Index", Icons.bloodtype, "12.5 BMI", 45.75*SizeConfig.widthMultiplier),
                  AnalyzeCard("Heart Rate", Icons.monitor_heart_sharp, "86 bpm", 45.75*SizeConfig.widthMultiplier),
                ],
              ),
              SizedBox(
                height: 2.10*SizeConfig.heightMultiplier,
              ),

              //* Total Cholesterol
              Align(
                alignment: Alignment.bottomCenter,
                child: AnalyzeCard("Cholesterol Level", Icons.health_and_safety_outlined, "120 mg/dL", 52.45*SizeConfig.widthMultiplier),
              ),

              SizedBox(
                  height: 4.21*SizeConfig.heightMultiplier,
                ),

             //* Analyze Button
             authButton("Analyze", () {}),
                SizedBox(
                  height: 1.58*SizeConfig.heightMultiplier,
                ),
            ],
          ),
        ),
      ),
    ));
  }
}
