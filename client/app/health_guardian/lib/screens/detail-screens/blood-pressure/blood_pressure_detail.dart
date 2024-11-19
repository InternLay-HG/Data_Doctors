import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/getX_controllers/detail-screen/blood_pressure_controllers.dart';
import 'package:health_guardian/screens/detail-screens/blood-pressure/add_blood_pressure_record.dart';
import 'package:health_guardian/screens/detail-screens/blood-sugar/add_blood_sugar_record.dart';
import 'package:health_guardian/widgets/auth/login_widgets.dart';
import 'package:health_guardian/widgets/detail-screen/blood-pressure/bp_widgets_1.dart';
import 'package:health_guardian/widgets/detail-screen/blood-pressure/bp_widgets_2.dart';

class BloodPressureDetail extends StatelessWidget {
  final BloodPressureControllers controller =
      Get.put(BloodPressureControllers());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 241, 241),
      appBar: appB_BP(() {
        Get.back();
      }, () {}),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Column(
            children: [
              //* widget for showing blood pressure data
              bloodPressureDataWidget(),

              //* for buttons of stats and history
              SizedBox(
                height: 35,
              ),
              doubleButtonWidgetBP(controller),
              SizedBox(
                height: 35,
              ),

              //* stats and history display widget
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 520,
                  child: dataWidgetBP(controller, "", "", "")),
              SizedBox(
                height: 45,
              ),

              //* button for a  dding new record
              authButton("+ Add", () {
                Future.delayed(Duration(milliseconds: 200), () {
                  Get.to(() => AddBloodPressureRecord(),
                      transition: Transition.downToUp);
                });
              }),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
