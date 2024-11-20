import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/getX_controllers/detail-screen/blood_sugar_controllers.dart';
import 'package:health_guardian/screens/detail-screens/blood-sugar/add_blood_sugar_record.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/auth/login_widgets.dart';
import 'package:health_guardian/widgets/detail-screen/blood-sugar/bs_widgets_1.dart';
import 'package:health_guardian/widgets/detail-screen/blood-sugar/bs_widgets_2.dart';

class BloodSugarDetail extends StatelessWidget {
  final BloodSugarControllers controller = Get.put(BloodSugarControllers());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 241, 241),
      //* AppBar
      appBar: appB(() {
        Get.back();
      }, () {}),

      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 1.5*SizeConfig.heightMultiplier, vertical: 0.1*SizeConfig.heightMultiplier),
            child: Column(
              children: [
                //* widget for showing blood sugar data
                bloodSugarDataWidget(),

                //* for buttons of stats and history
                SizedBox(
                  height: 3.68*SizeConfig.heightMultiplier,
                ),
                doubleButtonWidget(controller),
                SizedBox(
                  height: 3.68*SizeConfig.heightMultiplier,
                ),

                //* stats and history display widget
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 2.23*SizeConfig.widthMultiplier, vertical: 1.05*SizeConfig.heightMultiplier),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(1.05*SizeConfig.heightMultiplier),
                      // boxShadow: [
                      //   BoxShadow(
                      //       color: Color.fromARGB(255, 161, 153, 153),
                      //       spreadRadius: 2.5,
                      //       blurRadius: 2)
                      // ],
                    ),
                    height:47.40*SizeConfig.heightMultiplier,
                    child: dataWidget(controller,"","","")),
                SizedBox(
                  height:3.68*SizeConfig.heightMultiplier,
                ),

                //* button for a  dding new record
                authButton("+ Add", () {
                   Future.delayed(Duration(milliseconds: 200),(){
                    Get.to(()=>AddBloodSugarRecord(),transition: Transition.downToUp);
                   });
                   }),
                SizedBox(
                  height: 2.10*SizeConfig.heightMultiplier,
                ),
              ],
            )),
      ),
    ));
  }
}
