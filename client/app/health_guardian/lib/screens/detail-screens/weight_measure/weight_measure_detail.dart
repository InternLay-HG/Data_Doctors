import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/getX_controllers/detail-screen/weight_measure_controllers.dart';
import 'package:health_guardian/screens/detail-screens/weight_measure/add_weight_measure_record.dart';
import 'package:health_guardian/widgets/auth/login_widgets.dart';
import 'package:health_guardian/widgets/detail-screen/weight-measure/wm_widgets_1.dart';
import 'package:health_guardian/widgets/detail-screen/weight-measure/wm_widgets_2.dart';

class WeightMeasureDetail extends StatelessWidget {
  final WeightMeasureControllers controllers =
      Get.put(WeightMeasureControllers());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appBWm(() {
        Get.back();
      }, () {}),
      backgroundColor: Color.fromARGB(255, 247, 241, 241),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Column(
            children: [
              //* Widget for showing weight data
              wightMeasureDataWidget(),

              //* for buttons of stats and history
              SizedBox(
                height: 35,
              ),
              doubleButtonWMWidget(controllers),
              SizedBox(
                height: 35,
              ),

              //* stats and history display widget
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    // boxShadow: [
                    //   BoxShadow(
                    //       color: Color.fromARGB(255, 161, 153, 153),
                    //       spreadRadius: 2.5,
                    //       blurRadius: 2)
                    // ],
                  ),
                  height: 450,
                  child: dataWidgetWeightMeasure(controllers, "", "", "")),
              SizedBox(
                height: 35,
              ),

              //* button for a  dding new record
                authButton("+ Add", () {
                   Future.delayed(Duration(milliseconds: 200),(){
                    Get.to(()=> AddWeightMeasureRecord(),transition: Transition.downToUp);
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
