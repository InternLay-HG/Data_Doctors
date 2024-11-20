import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/getX_controllers/detail-screen/weight_measure_controllers.dart';
import 'package:health_guardian/styling/colors.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/buttons/detail_buttons.dart';

AppBar appBAddRecordWeight() {
  return AppBar(
    backgroundColor: Color.fromARGB(255, 247, 241, 241),
    toolbarHeight: 110,
    leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 38,
        )),
    centerTitle: true,
    title: Column(
      children: [
        Text(
          "Add New Record",
          style: TextStyle(
              color: Colors.black,
              fontFamily: "CoreSansBold",
              fontSize: 3.2 * SizeConfig.heightMultiplier),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "Dec 22, 2024 : 10:54 AM",
          style: TextStyle(
              color: const Color.fromARGB(255, 80, 78, 78),
              fontFamily: "CoreSansMed",
              fontSize: 1.9 * SizeConfig.heightMultiplier),
        ),
      ],
    ),
  );
}

Widget userInputWeightWidget(WeightMeasureControllers controller) {
  return Container(
    height: 18.3*SizeConfig.heightMultiplier,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(0.63*SizeConfig.heightMultiplier),
    ),
    padding: EdgeInsets.symmetric(horizontal: 3.34*SizeConfig.widthMultiplier, vertical: 2.10*SizeConfig.heightMultiplier),
    child: Column(
      children: [
        Center(
          child: buttonsDetail1("Enter your Weight in kg", () {},
              Colours.buttonColorRed, Colors.white, 5.26*SizeConfig.heightMultiplier,87.05*SizeConfig.widthMultiplier, 0.63*SizeConfig.heightMultiplier, 2.31*SizeConfig.heightMultiplier),
        ),
        SizedBox(
          height: 20,
        ),
        //* value display
        GestureDetector(
          onTap: () {
            Get.bottomSheet(
              Container(
                height: 26.34 * SizeConfig.heightMultiplier,
                color: Colors.white,
                child: CupertinoPicker(
                  itemExtent: 40,
                  scrollController: FixedExtentScrollController(
                    initialItem: (controller.weightValue.value * 2).toInt(),
                  ),
                  onSelectedItemChanged: (int index) {
                    double selectedWeight = (index + 1) * 0.5;
                    controller.changeLevel(selectedWeight);
                  },
                  children: List<Widget>.generate(200, (int index) {
                    double weight = (index + 1) * 0.5;
                    return Center(
                      child: Text(
                        "${weight.toStringAsFixed(1)} kg",
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
          child: Obx(() => Text(
                "${controller.weightValue.value} kg",
                style: TextStyle(
                  fontFamily: "CoreSansBold",
                  fontSize: 38,
                  color: Colors.black,
                ),
              )),
        )
      ],
    ),
  );
}

Widget userInputHeightWidget(WeightMeasureControllers controller) {
  return Container(
    height: 18.3*SizeConfig.heightMultiplier,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(0.63*SizeConfig.heightMultiplier),
    ),
    padding: EdgeInsets.symmetric(horizontal: 3.34*SizeConfig.widthMultiplier, vertical: 2.10*SizeConfig.heightMultiplier),
    child: Column(
      children: [
        Center(
          child: buttonsDetail1("Enter your Height in cms", () {},
              Colours.buttonColorRed, Colors.white, 5.26*SizeConfig.heightMultiplier,87.05*SizeConfig.widthMultiplier, 0.63*SizeConfig.heightMultiplier, 2.31*SizeConfig.heightMultiplier),
        ),
        SizedBox(
          height: 2.10*SizeConfig.heightMultiplier,
        ),
        //* value display
        GestureDetector(
          onTap: () {
            Get.bottomSheet(
              Container(
                height: 26.34 * SizeConfig.heightMultiplier,
                color: Colors.white,
                child: CupertinoPicker(
                  itemExtent: 40,
                  scrollController: FixedExtentScrollController(
                    initialItem: (controller.heightValue.value * 2).toInt(),
                  ),
                  onSelectedItemChanged: (int index) {
                    double selectedHeight = index * 0.5;
                    controller.changeLevelHeight(selectedHeight);
                  },
                  children: List<Widget>.generate(440, (int index) {
                    double height = index * 0.5;
                    return Center(
                      child: Text(
                        "${height.toStringAsFixed(1)} cms",
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
          child: Obx(() => Text(
                "${controller.heightValue.value.toStringAsFixed(1)} cms",
                style: TextStyle(
                  fontFamily: "CoreSansBold",
                  fontSize: 38,
                  color: Colors.black,
                ),
              )),
        )
      ],
    ),
  );
}

Widget stateSelectWeightWIdget(WeightMeasureControllers controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      card1Weight("Gender", Icons.male, "Male"),
      card1Weight("Age", Icons.person, "28"),
    ],
  );
}

Widget card1Weight(String title, IconData icon, String value) {
  return Container(
    height: 10.53*SizeConfig.heightMultiplier,
    width: 45.75*SizeConfig.widthMultiplier,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(0.632*SizeConfig.heightMultiplier),
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
        headerWeight(title, icon),
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

Widget headerWeight(String title, IconData icon) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Icon(
        icon,
        color: Colours.buttonColorRed,
        size:  2.73*SizeConfig.heightMultiplier,
      ),
      SizedBox(
        width: 1.11*SizeConfig.widthMultiplier,
      ),
      Text(
        title,
        style: TextStyle(
            fontFamily: "CoreSansMed",
            fontSize: 2.10*SizeConfig.heightMultiplier,
            color: const Color.fromARGB(255, 94, 92, 92)),
      )
    ],
  );
}
