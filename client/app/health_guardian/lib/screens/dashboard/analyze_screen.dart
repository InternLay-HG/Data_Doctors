import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/getX_controllers/button/button_controllers.dart';
import 'package:health_guardian/screens/analyze-screens.dart/analyze_hypertension.dart';
import 'package:health_guardian/screens/analyze-screens.dart/analyze_sugar.dart';
import 'package:health_guardian/styling/colors.dart';
import 'package:health_guardian/styling/images.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/auth/login_widgets.dart';
import 'package:health_guardian/widgets/dashboard/dashboard_widgets_2.dart';

class AnalyzeScreen extends StatelessWidget {
  final ButtonControllers controllers = Get.put(ButtonControllers());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //* title and description
        T1("Risk Assessment", Images.heartMeasureIcon),

        SizedBox(
          height: 1.58*SizeConfig.heightMultiplier,
        ),
        descTextAnalyze("Analyze your disease risk probability by\nfilling required health parameters and\nreceive your health report instantly.",2.35 * SizeConfig.heightMultiplier),

        SizedBox(
          height: 3.68*SizeConfig.heightMultiplier,
        ),

        //* diseaseCard Widgets
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           analyzeDiseaseCard("Heart Attack", Color.fromARGB(255, 245, 208, 204),Colours.buttonColorRed,Images.heartMeasureIcon,controllers.heartAttack,controllers.setPressedHeartAttack,(){}),
            analyzeDiseaseCard("Hypertension", Color.fromARGB(255, 164, 238, 183),Colors.green,Images.BloodPressureMeasureIcon2,controllers.hyperTension,controllers.setPressedHyperTension,(){Get.to( () => AnalyzeHypertension(),transition: Transition.fadeIn);}),
          ],
        ),
        SizedBox(height: 1.58*SizeConfig.heightMultiplier,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            analyzeDiseaseCard("Diabetes", Color.fromARGB(255, 245, 208, 204),Colours.buttonColorRed,Images.DiabetesIcon,controllers.bloodSugar,controllers.setPressedBloodSugar,(){Get.to( () => AnalyzeSugarScreen(),transition: Transition.fadeIn);}),
          ],
        ),
      ],
    );
  }
}
