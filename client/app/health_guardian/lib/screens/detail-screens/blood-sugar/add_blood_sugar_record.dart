import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/getX_controllers/detail-screen/blood_sugar_controllers.dart';
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
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          child: Column(
            children: [
              //* for user input of data
              userInputWidget(controllers),

              SizedBox(height: 35,),

              //* Selecting the state of user
              stateSelectWIdget(controllers),

              SizedBox(height: 35,),

              //* Adding a note
              addNoteWidget(controllers.noteController),

               SizedBox(height: 35,),

               //* Sugar level Scale Widget
               sugarScaleWidget(),

              SizedBox(height: 35,),

              //* Button for adding record
              authButton("Add Record", (){}),

              SizedBox(height: 15,),
            ],
          ),
        ),
      ),
    ));
  }
}
