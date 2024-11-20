import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/getX_controllers/detail-screen/blood_pressure_controllers.dart';
import 'package:health_guardian/screens/detail-screens/blood-pressure/blood_sugar_history_screen.dart';
import 'package:health_guardian/screens/detail-screens/blood-pressure/pressure_graph_report.dart';
// ignore: unused_import
import 'package:health_guardian/screens/detail-screens/blood-sugar/sugar_graph_report.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/buttons/detail_buttons.dart';

Widget dataWidgetBP(
    BloodPressureControllers controller, String value, String state, String type) {
  return Column(
    children: [
      Center(
        child: Text("Blood Pressure (mmHg)",
            style: TextStyle(
              fontSize: 3.054*SizeConfig.heightMultiplier,
              color: Colors.black,
              fontFamily: "CoreSansBold",
            )),
      ),
      SizedBox(
        height: 0.842*SizeConfig.heightMultiplier,
      ),
      Divider(
        color: Color.fromARGB(255, 229, 222, 222),
        thickness: 2,
      ),
      SizedBox(
        height: 1.053*SizeConfig.heightMultiplier,
      ),

      //* For displaying graph and history
      Obx(() => controller.pageIndex.value == 0
          ? graphDataBP(controller)
          : historyListBP(controller, value, state, type,(){Get.to(()=>BloodPressureHistoryScreen(),transition: Transition.rightToLeft);})),
    ],
  );
}

Widget graphDataBP(BloodPressureControllers controller) {
  return Column(children: [
    SizedBox(
      height: 0,
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 2.528*SizeConfig.heightMultiplier,
          ),
          onPressed: controller.previousPageDate,
          color: Colors.black,
        ),
        Text("Dec 16 - Dec 22, 2024",overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 2.4*SizeConfig.heightMultiplier,
                color: Colors.black,
                fontFamily: "Poppins-Med",
                fontWeight: FontWeight.bold)),
        IconButton(
          icon: Icon(
            Icons.arrow_forward_ios_outlined,
            size:2.528*SizeConfig.heightMultiplier,
          ),
          onPressed: controller.navigatePageDate,
          color: Colors.black,
        )
      ],
    ),
    SizedBox(
      height: 2.633*SizeConfig.heightMultiplier,
    ),
    Container(
      color: Colors.white,
      height:27.5*SizeConfig.heightMultiplier,
      width: 91.517*SizeConfig.widthMultiplier,
      child: PageView(
        controller: controller.pageControllerDate,
        children: [
          BarChartExample(),
          BarChartExample(),
        ],
      ),
    ),
    SizedBox(height:2.106*SizeConfig.heightMultiplier,),
     FittedBox(
       child: Text("Systolic Pressure, Diastolic Pressure",
       overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 21.5*SizeConfig.heightMultiplier,
                  color: Colors.black,
                  fontFamily: "Poppins-Med",
                  fontWeight: FontWeight.bold)),
     ),
   SizedBox(height: 2.633*SizeConfig.heightMultiplier,),
  ]);
}

Widget historyListBP(
    BloodPressureControllers controller, String value, String state, String type,void Function() onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(
        horizontal: 1.116*SizeConfig.widthMultiplier,
      ),
      height: 36.869*SizeConfig.heightMultiplier,
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 1.580*SizeConfig.heightMultiplier, horizontal: 2.678*SizeConfig.widthMultiplier),
              margin: EdgeInsets.symmetric(vertical: 0.842*SizeConfig.heightMultiplier),
              height: 105,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1.05*SizeConfig.heightMultiplier),
                  color: Color.fromARGB(255, 240, 237, 237)),
              child: Row(children: [
                Flexible(
                  flex: 2,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "105",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "CoreSansBold",
                                fontSize: 3.3 * SizeConfig.heightMultiplier),
                          ),
                          Text(
                            "mmHg",
                            style: TextStyle(
                                color: const Color.fromARGB(255, 80, 78, 78),
                                fontFamily: "CoreSansMed",
                                fontSize: 2.1 * SizeConfig.heightMultiplier),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 4.464*SizeConfig.widthMultiplier,
                      ),
                      Container(
                          height: 7.373*SizeConfig.heightMultiplier,
                          child: VerticalDivider(
                            color: Color.fromARGB(255, 229, 222, 222),
                            thickness: 3,
                          )),
                    ],
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(flex: 3, child: statsWidgetBP(value, state, type)),
                      Flexible(
                          flex: 1,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: 2.949*SizeConfig.heightMultiplier,
                          )),
                    ],
                  ),
                )
              ]),
            );
          }),
    ),
  );
}

Widget statsWidgetBP(String value, String state, String type) {
  return Column(
    children: [
      Flexible(
        flex: 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buttonsDetail1(
                "Normal", () {}, Colors.green, Colors.white,4.740*SizeConfig.heightMultiplier, 22.321*SizeConfig.widthMultiplier, 0.632*SizeConfig.heightMultiplier, 2.001*SizeConfig.heightMultiplier),
            Text(
              "Sitting",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "CoreSansBold",
                  fontSize: 2.6 * SizeConfig.heightMultiplier),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 1.053*SizeConfig.heightMultiplier,
      ),
      Flexible(
        flex: 1,
        child: Text(
          "Dec 22, 2024 : 10:54 AM",
          style: TextStyle(
              color: const Color.fromARGB(255, 80, 78, 78),
              fontFamily: "CoreSansMed",
              fontSize: 1.65 * SizeConfig.heightMultiplier),
        ),
      ),
    ],
  );
}