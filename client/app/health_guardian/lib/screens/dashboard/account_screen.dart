import 'package:flutter/material.dart';
import 'package:health_guardian/styling/images.dart';
import 'package:health_guardian/widgets/dashboard/dashboard_widgets_1.dart';
import 'package:health_guardian/widgets/dashboard/dashboard_widgets_2.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //* Title Widget
      titleWidget(),
      SizedBox(
        height: 30,
      ),

      //* Disease Cards
      heartMeasureCard(() {}),
      SizedBox(
        height: 30,
      ),
      diseaseCard("Blood Pressure", Images.BloodPressureMeasureIcon,
          Color.fromARGB(255, 169, 207, 239), Colors.blue),
      SizedBox(
        height: 15,
      ),
      diseaseCard("Blood Sugar", Images.BloodSugarMeasureIcon,
          Color.fromARGB(255, 164, 238, 183), Colors.green),
      SizedBox(
        height: 15,
      ),
      diseaseCard(
          "Weight & BMI",
          Images.WeightMeasureIcon,
          Color.fromARGB(255, 235, 245, 174),
          Color.fromARGB(255, 161, 153, 74)),

      //* history records
      SizedBox(
        height: 40,
      ),
      historyText(),
      SizedBox(
        height: 20,
      ),
      historyRecordWidget(),

      SizedBox(
        height: 30,
      ),
      aiDoctorWidget(),
      SizedBox(
        height: 30,
      )
    ]);
  }
}
