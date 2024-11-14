import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/getX_controllers/detail-screen/weight_measure_controllers.dart';
import 'package:health_guardian/widgets/auth/login_widgets.dart';
import 'package:health_guardian/widgets/detail-screen/weight-measure/wm_widgets_3.dart';
import 'package:health_guardian/widgets/detail-screen/weight-measure/wm_widgets_4.dart';

class AddWeightMeasureRecord extends StatelessWidget {
  final WeightMeasureControllers controller =
      Get.put(WeightMeasureControllers());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appBAddRecordWeight(),
      backgroundColor: Color.fromARGB(255, 247, 241, 241),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          child: Column(
            children: [
              //* for user input of data
              userInputWeightWidget(controller),

              SizedBox(
                height: 35,
              ),

              //* Selecting the state of user
              stateSelectWeightWIdget(controller),

              SizedBox(
                height: 35,
              ),

              //* Adding a note
              addNoteWeightWidget(controller.noteController),

              SizedBox(
                height: 35,
              ),

              //* Sugar level Scale Widget
              weightScaleWidget(),

              SizedBox(
                height: 35,
              ),

              //* button for adding new record
              authButton("Add Record", () {}),

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
