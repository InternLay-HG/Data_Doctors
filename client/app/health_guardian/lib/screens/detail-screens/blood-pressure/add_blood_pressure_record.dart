import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/getX_controllers/detail-screen/blood_pressure_controllers.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/auth/login_widgets.dart';
import 'package:health_guardian/widgets/detail-screen/blood-pressure/bp_widgets_3.dart';
import 'package:health_guardian/widgets/detail-screen/blood-pressure/bp_widgets_4.dart';
import 'package:health_guardian/widgets/detail-screen/blood-pressure/bp_widgets_5.dart';
import 'package:health_guardian/widgets/detail-screen/blood-sugar/bs_widgets_3.dart';

class AddBloodPressureRecord extends StatelessWidget {
  final BloodPressureControllers controller = Get.put(BloodPressureControllers());

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 241, 241),
      appBar: appBAddRecord(),
      body: SingleChildScrollView(
        child: Container(
           padding: EdgeInsets.symmetric(horizontal: 2.67*SizeConfig.widthMultiplier, vertical: 1.58*SizeConfig.heightMultiplier),
           child: Column(
            children: [
              //* for user input of data
              userInputWidgetSystolicPressure(controller),

              SizedBox(height:  3.68*SizeConfig.heightMultiplier,),

              userInputWidgetDiastolicPressure(controller),

              SizedBox(height:  3.68*SizeConfig.heightMultiplier,),

              pulseLevelWidget(controller),

              SizedBox(height:  3.68*SizeConfig.heightMultiplier),

              //* Selecting the state of user
              stateSelectWIdgetPressure(controller),

              SizedBox(height:  3.68*SizeConfig.heightMultiplier,),

             //* add a note
              addNoteBPWidget(controller.noteController)

              , SizedBox(height:  3.68*SizeConfig.heightMultiplier,),

              //* Pressure level Scale Widget
               PressureScaleWidget(),

              SizedBox(height:  3.68*SizeConfig.heightMultiplier,),

              //* Button for adding record
              authButton("Add Record", (){}),

              SizedBox(height: 1.58*SizeConfig.heightMultiplier,),
            ],
           ),
        ),
      ),
    ));
  }
}