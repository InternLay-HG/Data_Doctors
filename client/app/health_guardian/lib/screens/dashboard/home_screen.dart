import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/getX_controllers/button/button_controllers.dart';
import 'package:health_guardian/screens/detail-screens/blood-sugar/blood_sugar_detail.dart';
import 'package:health_guardian/screens/detail-screens/weight_measure/weight_measure_detail.dart';
import 'package:health_guardian/styling/images.dart';
import 'package:health_guardian/widgets/dashboard/dashboard_widgets_1.dart';
import 'package:health_guardian/widgets/dashboard/dashboard_widgets_2.dart';

class Home_D_Screen extends StatelessWidget {
  final ButtonControllers controller = Get.put(ButtonControllers());

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
        Color.fromARGB(255, 169, 207, 239), Colors.blue,(){},controller.bloodPressure,controller.setBloodPressure),
    SizedBox(
      height: 15,
    ),
    diseaseCard("Blood Sugar", Images.BloodSugarMeasureIcon,
        Color.fromARGB(255, 164, 238, 183), Colors.green,(){Get.to(() => BloodSugarDetail());},controller.bloodSugarDetail,controller.setBloodSugar)
        ,
    SizedBox(
      height: 15,
    ),
    diseaseCard("Weight & BMI", Images.WeightMeasureIcon,
        Color.fromARGB(255, 235, 245, 174), Color.fromARGB(255, 226, 207, 41),(){Get.to(() => WeightMeasureDetail());},controller.weightDetail,controller.setWeightDetail),

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

    //* AI Doctor
    aiDoctorWidget(),
    SizedBox(
      height: 30,
    )
  ]);
  }
}
