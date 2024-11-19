import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/getX_controllers/detail-screen/blood_sugar_controllers.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/auth/login_widgets.dart';
import 'package:health_guardian/widgets/detail-screen/blood-sugar/bs_widgets_3.dart';
import 'package:health_guardian/widgets/detail-screen/blood-sugar/bs_widgets_4.dart';

class AddBloodSugarRecord extends StatelessWidget {
 final BloodSugarControllers controllers = Get.put(BloodSugarControllers());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 241, 241),
      appBar: appBAddRecord(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 2.67*SizeConfig.widthMultiplier, vertical: 1.58*SizeConfig.heightMultiplier),
          child: Column(
            children: [
              //* for user input of data
              userInputWidget(controllers),

              SizedBox(height: 3.68*SizeConfig.heightMultiplier,),

              //* Selecting the state of user
              stateSelectWIdget(controllers),

              SizedBox(height: 3.68*SizeConfig.heightMultiplier,),

              //* Adding a note
              addNoteWidget(controllers.noteController),

               SizedBox(height: 3.68*SizeConfig.heightMultiplier,),

               //* Sugar level Scale Widget
               sugarScaleWidget(),

              SizedBox(height: 3.68*SizeConfig.heightMultiplier),

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
