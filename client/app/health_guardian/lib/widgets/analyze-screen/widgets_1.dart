import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:health_guardian/getX_controllers/analyze-screen/analyze_sugar_controllers.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/detail-screen/blood-sugar/bs_widgets_3.dart';

AppBar appBAnalyze(void Function() onTap1, void Function() onTap2,String Image) {
  return AppBar(
    backgroundColor: Color.fromARGB(255, 245, 242, 242),
    toolbarHeight: 9.48*SizeConfig.heightMultiplier,
    leading: IconButton(
        onPressed: onTap1,
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 4.63*SizeConfig.heightMultiplier,
        )),
    centerTitle: true,
    title: SvgPicture.asset(
      Image,
      height: 6.84*SizeConfig.heightMultiplier,
      width: 14.50*SizeConfig.widthMultiplier,
    ),
    actions: [
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert_outlined,
            color: Colors.black,
            size: 4.63*SizeConfig.heightMultiplier,
          ))
    ],
  );
}

Widget AnalyzeCard(String title, IconData icon, String value, double width) {
  return Container(
    height: 10.53*SizeConfig.heightMultiplier,
    width: width,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(0.63),
      // boxShadow: [
      //   BoxShadow(
      //       color: Color.fromARGB(255, 161, 153, 153),
      //       spreadRadius: 2.5,
      //       blurRadius: 2)
      // ],
    ),
    padding: EdgeInsets.symmetric(horizontal: 2.67*SizeConfig.widthMultiplier, vertical: 1.05*SizeConfig.heightMultiplier),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        header(title, icon),
        SizedBox(
          height: 1.05*SizeConfig.heightMultiplier,
        ),
        Text(
          value,
          style: TextStyle(
              fontFamily: "CoreSansBold", fontSize: 2.63*SizeConfig.heightMultiplier, color: Colors.black),
        )
      ],
    ),
  );
}

Widget SleepCard(String title, IconData icon, String value, double width,
    AnalyzeSugarControllers controller) {
  return Container(
    height: 100,
    width: width,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(6),
    ),
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        header(title, icon),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            Get.bottomSheet(
              Container(
                height: 26.34 * SizeConfig.heightMultiplier,
                color: Colors.white,
                child: CupertinoPicker(
                  itemExtent: 40,
                  scrollController: FixedExtentScrollController(
                    initialItem: controller.Sleep_Hours.value.toInt() - 1,
                  ),
                  onSelectedItemChanged: (int index) {
                    int selectedHour = index + 1; // Calculate the selected hour
                    controller.changeLevel(
                        selectedHour.toDouble()); // Update the value
                  },
                  children: List<Widget>.generate(12, (int index) {
                    int value = index + 1; // Generate values from 1 to 12
                    return Center(
                      child: Text(
                        "$value hours",
                        style: TextStyle(
                          fontFamily: "CoreSansBold",
                          fontSize: 2.73 * SizeConfig.heightMultiplier,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            );
          },
          child: Obx(
            () => Text(
              "${controller.Sleep_Hours.value} Hours",
              style: TextStyle(
                  fontFamily: "CoreSansBold",
                  fontSize: 25,
                  color: Colors.black),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buttonsACard(
    String title,
    void Function() onTap,
    Color color,
    Color textColor,
    double height,
    double width,
    double radius,
    double textSize) {
  return GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: Duration(milliseconds: 100),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(radius)),
      height: height,
      width: width,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontFamily: "CoreSansMed",
            fontWeight: FontWeight.bold,
          ).copyWith(fontSize: textSize),
        ),
      ),
    ),
  );
}

Widget PregnancyCard(String title, IconData icon, String value, double width,
    AnalyzeSugarControllers controller) {
  return Container(
    height: 100,
    width: width,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(6),
    ),
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        header(title, icon),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            Get.bottomSheet(
              Container(
                height: 26.34 * SizeConfig.heightMultiplier,
                color: Colors.white,
                child: CupertinoPicker(
                  itemExtent: 40,
                  scrollController: FixedExtentScrollController(
                    initialItem: controller.P_Count.value.toInt(),
                  ),
                  onSelectedItemChanged: (int index) {
                    int selectedNum= index + 1; // Calculate the selected hour
                    controller.P_Count_SetState(
                        selectedNum
                        ); // Update the value
                  },
                  children: List<Widget>.generate(6, (int index) {
                    int value = index ; // Generate values from 1 to 12
                    return Center(
                      child: Text(
                        "$value",
                        style: TextStyle(
                          fontFamily: "CoreSansBold",
                          fontSize: 2.73 * SizeConfig.heightMultiplier,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            );
          },
          child: Obx( ()=> Text(
                "${controller.P_Count.value}",
                style: TextStyle(
                    fontFamily: "CoreSansBold",
                    fontSize: 25,
                    color: Colors.black),
              ),
          ),
          
        ),
      ],
    ),
  );
}