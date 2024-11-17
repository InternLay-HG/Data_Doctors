import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/getX_controllers/detail-screen/blood_sugar_controllers.dart';
import 'package:health_guardian/screens/detail-screens/blood-sugar/add_blood_sugar_record.dart';
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
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Column(
              children: [
                //* widget for showing blood sugar data
                bloodSugarDataWidget(),

                //* for buttons of stats and history
                SizedBox(
                  height: 35,
                ),
                doubleButtonWidget(controller),
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
                    child: dataWidget(controller,"","","")),
                SizedBox(
                  height: 35,
                ),

                //* button for a  dding new record
                authButton("+ Add", () {
                   Future.delayed(Duration(milliseconds: 200),(){
                    Get.to(()=>AddBloodSugarRecord(),transition: Transition.downToUp);
                   });
                   }),
                SizedBox(
                  height: 20,
                ),
              ],
            )),
      ),
    ));
  }
}
