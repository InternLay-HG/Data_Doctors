import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/getX_controllers/detail-screen/blood_sugar_controllers.dart';
import 'package:health_guardian/styling/colors.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/auth/login_widgets.dart';
import 'package:health_guardian/widgets/buttons/detail_buttons.dart';

AppBar appBAddRecord() {
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

Widget userInputWidget(BloodSugarControllers controller) {
  return Container(
    height: 170,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(6),
      boxShadow: [
        BoxShadow(
            color: Color.fromARGB(255, 161, 153, 153),
            spreadRadius: 2.5,
            blurRadius: 2)
      ],
    ),
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
    child: Column(
      children: [
        Center(
          child: buttonsDetail1("Enter your Sugar Level in mg/dL", () {},
              Colours.buttonColorRed, Colors.white, 50, 390, 6, 22),
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
                    initialItem:
                        ((controller.sugarLevel.value - 100.1) * 10).round(),
                  ),
                  onSelectedItemChanged: (int index) {
                    double selectedWeight = 100.1 + (index * 0.1);
                    controller.changeLevel(selectedWeight);
                  },
                  children: List<Widget>.generate(409, (int index) {
                    double value = 100.1 + (index * 0.1);
                    return Center(
                      child: Text(
                        "${value.toStringAsFixed(1)} mg/dL",
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
                "${controller.sugarLevel.value.toStringAsFixed(1)} mg/dL",
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

Widget stateSelectWIdget(BloodSugarControllers controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Obx(() => card(controller)),
      card1("Gender", Icons.male, "Male"),
      card1("Age", Icons.person, "28"),
    ],
  );
}

//* card for selecting state
Widget card(BloodSugarControllers controller) {
  return Container(
    height: 100,
    width: 128,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(6),
      boxShadow: [
        BoxShadow(
            color: Color.fromARGB(255, 161, 153, 153),
            spreadRadius: 2.5,
            blurRadius: 2)
      ],
    ),
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        header("State", Icons.star_border_outlined),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
            //* button color and text color changing logic based on their selection
            onTap: () {
              Get.bottomSheet(
                  backgroundColor: Colors.white,
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    height: 450,
                    child: Obx(
                      () => Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              buttonsDetail1(
                                  "Default",
                                  controller.DefaultSelect,
                                  controller.State.value == "Default"
                                      ? Colours.buttonColorRed
                                      : Color.fromARGB(255, 246, 240, 241),
                                  controller.State.value == "Default"
                                      ? Colors.white
                                      : Colors.black,
                                  55,
                                  130,
                                  30,
                                  22),
                              buttonsDetail1(
                                  "Fasting",
                                  controller.FastingSelect,
                                  controller.State.value == "Fasting"
                                      ? Colours.buttonColorRed
                                      : Color.fromARGB(255, 246, 240, 241),
                                  controller.State.value == "Fasting"
                                      ? Colors.white
                                      : Colors.black,
                                  55,
                                  130,
                                  30,
                                  22),
                              buttonsDetail1(
                                  "Before Eating",
                                  controller.BeforeEatingSelect,
                                  controller.State.value == "Before Eating"
                                      ? Colours.buttonColorRed
                                      : Color.fromARGB(255, 246, 240, 241),
                                  controller.State.value == "Before Eating"
                                      ? Colors.white
                                      : Colors.black,
                                  55,
                                  130,
                                  30,
                                  16),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              buttonsDetail1(
                                  "After Eating (1h)",
                                  controller.AfterEating1h,
                                  controller.State.value == "After Eating (1h)"
                                      ? Colours.buttonColorRed
                                      : Color.fromARGB(255, 246, 240, 241),
                                  controller.State.value == "After Eating (1h)"
                                      ? Colors.white
                                      : Colors.black,
                                  55,
                                  205,
                                  30,
                                  22),
                              buttonsDetail1(
                                  "After Eating (2h)",
                                  controller.AfterEating2h,
                                  controller.State.value == "After Eating (2h)"
                                      ? Colours.buttonColorRed
                                      : Color.fromARGB(255, 246, 240, 241),
                                  controller.State.value == "After Eating (2h)"
                                      ? Colors.white
                                      : Colors.black,
                                  55,
                                  210,
                                  30,
                                  22),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buttonsDetail1(
                                  "Asleep",
                                  controller.AsleepSelect,
                                  controller.State.value == "Asleep"
                                      ? Colours.buttonColorRed
                                      : Color.fromARGB(255, 246, 240, 241),
                                  controller.State.value == "Asleep"
                                      ? Colors.white
                                      : Colors.black,
                                  55,
                                  150,
                                  30,
                                  22),
                              buttonsDetail1(
                                  "Before Workout",
                                  controller.BeforeWorkoutSelect,
                                  controller.State.value == "Before Workout"
                                      ? Colours.buttonColorRed
                                      : Color.fromARGB(255, 246, 240, 241),
                                  controller.State.value == "Before Workout"
                                      ? Colors.white
                                      : Colors.black,
                                  55,
                                  210,
                                  30,
                                  22),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buttonsDetail1(
                                  "After Workout",
                                  controller.AfterWorkoutSelect,
                                  controller.State.value == "After Workout"
                                      ? Colours.buttonColorRed
                                      : Color.fromARGB(255, 246, 240, 241),
                                  controller.State.value == "After Workout"
                                      ? Colors.white
                                      : Colors.black,
                                  55,
                                  210,
                                  30,
                                  22),
                            ],
                          ),
                          SizedBox(
                            height: 55,
                          ),
                          authButton("OK", () {
                            Get.back();
                          })
                        ],
                      ),
                    ),
                  ));
            },
            child: FittedBox(
              child: Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                controller.State.value,
                style: TextStyle(
                    fontFamily: "CoreSansBold",
                    fontSize: 25,
                    color: Colors.black),
              ),
            )),
      ],
    ),
  );
}

Widget card1(String title, IconData icon, String value) {
  return Container(
    height: 100,
    width: 128,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(6),
      boxShadow: [
        BoxShadow(
            color: Color.fromARGB(255, 161, 153, 153),
            spreadRadius: 2.5,
            blurRadius: 2)
      ],
    ),
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       header(title, icon),
        SizedBox(
          height: 10,
        ),
        Text(
          value,
          style: TextStyle(
              fontFamily: "CoreSansBold", fontSize: 25, color: Colors.black),
        )
      ],
    ),
  );
}

Widget header(String title, IconData icon) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Icon(
        icon,
        color: Colours.buttonColorRed,
        size: 26,
      ),
      SizedBox(
        width: 5,
      ),
      Text(
        title,
        style: TextStyle(
            fontFamily: "CoreSansMed",
            fontSize: 20,
            color: const Color.fromARGB(255, 94, 92, 92)),
      )
    ],
  );
}
