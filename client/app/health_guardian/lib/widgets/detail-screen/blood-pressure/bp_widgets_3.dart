import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/getX_controllers/detail-screen/blood_pressure_controllers.dart';
import 'package:health_guardian/styling/colors.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/auth/login_widgets.dart';
import 'package:health_guardian/widgets/buttons/detail_buttons.dart';
import 'package:health_guardian/widgets/detail-screen/blood-sugar/bs_widgets_3.dart';

Widget stateSelectWIdgetPressure(BloodPressureControllers controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Obx(() => cardBP(controller)),
      card1("Gender", Icons.male, "Male"),
      card1("Age", Icons.person, "28"),
    ],
  );
}
//* card for selecting state
Widget cardBP(BloodPressureControllers controller) {
  return Container(
    height: 10.53*SizeConfig.heightMultiplier,
    width: 28.57*SizeConfig.widthMultiplier,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(0.632*SizeConfig.heightMultiplier),
    ),
    padding: EdgeInsets.symmetric(horizontal: 2.67*SizeConfig.widthMultiplier, vertical: 1.05*SizeConfig.heightMultiplier),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        header("State", Icons.star_border_outlined),
        SizedBox(
          height: 1.05*SizeConfig.heightMultiplier,
        ),
        GestureDetector(
            //* button color and text color changing logic based on their selection
            onTap: () {
              Get.bottomSheet(
                  backgroundColor: Colors.white,
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 2.67*SizeConfig.widthMultiplier, vertical: 1.05*SizeConfig.heightMultiplier),
                    height: 47.40*SizeConfig.heightMultiplier,
                    child: Obx(
                      () => Column(
                        children: [
                          SizedBox(
                            height: 2.10*SizeConfig.heightMultiplier,
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
                                   5.79*SizeConfig.heightMultiplier,
                                  29.01*SizeConfig.widthMultiplier,
                                  3.16*SizeConfig.heightMultiplier,
                                  2.317*SizeConfig.heightMultiplier),
                              buttonsDetail1(
                                  "Fasting",
                                  controller.FastingSelect,
                                  controller.State.value == "Fasting"
                                      ? Colours.buttonColorRed
                                      : Color.fromARGB(255, 246, 240, 241),
                                  controller.State.value == "Fasting"
                                      ? Colors.white
                                      : Colors.black,
                                   5.79*SizeConfig.heightMultiplier,
                                  29.01*SizeConfig.widthMultiplier,
                                  3.16*SizeConfig.heightMultiplier,
                                  2.317*SizeConfig.heightMultiplier),
                              buttonsDetail1(
                                  "Before Eating",
                                  controller.BeforeEatingSelect,
                                  controller.State.value == "Before Eating"
                                      ? Colours.buttonColorRed
                                      : Color.fromARGB(255, 246, 240, 241),
                                  controller.State.value == "Before Eating"
                                      ? Colors.white
                                      : Colors.black,
                                  5.79*SizeConfig.heightMultiplier,
                                  29.01*SizeConfig.widthMultiplier,
                                  3.16*SizeConfig.heightMultiplier,
                                  2.317*SizeConfig.heightMultiplier),
                            ],
                          ),
                          SizedBox(
                            height: 2.10*SizeConfig.heightMultiplier,
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
                                  5.79*SizeConfig.heightMultiplier,
                                  29.01*SizeConfig.widthMultiplier,
                                  3.16*SizeConfig.heightMultiplier,
                                  2.317*SizeConfig.heightMultiplier),
                              buttonsDetail1(
                                  "After Eating (2h)",
                                  controller.AfterEating2h,
                                  controller.State.value == "After Eating (2h)"
                                      ? Colours.buttonColorRed
                                      : Color.fromARGB(255, 246, 240, 241),
                                  controller.State.value == "After Eating (2h)"
                                      ? Colors.white
                                      : Colors.black,
                                   5.79*SizeConfig.heightMultiplier,
                                  29.01*SizeConfig.widthMultiplier,
                                  3.16*SizeConfig.heightMultiplier,
                                  2.317*SizeConfig.heightMultiplier),
                            ],
                          ),
                          SizedBox(
                            height: 2.10*SizeConfig.heightMultiplier,
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
                                   5.79*SizeConfig.heightMultiplier,
                                  29.01*SizeConfig.widthMultiplier,
                                  3.16*SizeConfig.heightMultiplier,
                                  2.317*SizeConfig.heightMultiplier),
                              buttonsDetail1(
                                  "Before Workout",
                                  controller.BeforeWorkoutSelect,
                                  controller.State.value == "Before Workout"
                                      ? Colours.buttonColorRed
                                      : Color.fromARGB(255, 246, 240, 241),
                                  controller.State.value == "Before Workout"
                                      ? Colors.white
                                      : Colors.black,
                                  5.79*SizeConfig.heightMultiplier,
                                  29.01*SizeConfig.widthMultiplier,
                                  3.16*SizeConfig.heightMultiplier,
                                  2.317*SizeConfig.heightMultiplier),
                            ],
                          ),
                          SizedBox(
                            height: 2.10*SizeConfig.heightMultiplier,
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
                                   5.79*SizeConfig.heightMultiplier,
                                  29.01*SizeConfig.widthMultiplier,
                                  3.16*SizeConfig.heightMultiplier,
                                  2.317*SizeConfig.heightMultiplier),
                            ],
                          ),
                          SizedBox(
                            height: 5.79*SizeConfig.heightMultiplier,
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
                    fontSize:  2.63*SizeConfig.heightMultiplier,
                    color: Colors.black),
              ),
            )),
      ],
    ),
  );
}

Widget addNoteBPWidget(TextEditingController controller) {
  return Container(
      height: 11.06*SizeConfig.heightMultiplier,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0.63*SizeConfig.heightMultiplier),
      ),
      padding: EdgeInsets.symmetric(horizontal: 2.67*SizeConfig.widthMultiplier, vertical: 1.05*SizeConfig.heightMultiplier),
      child: Column(
        children: [
          header("Note", Icons.note_alt_outlined),
          SizedBox(
            height: 0.52*SizeConfig.heightMultiplier,
          ),
          SizedBox(
            height:  5.26*SizeConfig.heightMultiplier,
            child: TextField(
              style: TextStyle(
                  color: Color.fromARGB(255, 98, 94, 94),
                  fontSize:1.89*SizeConfig.heightMultiplier,
                  fontFamily: "CoreSansMed"),
              controller: controller,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 10),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: InputBorder.none,
                  label: Text(
                    "Add a Note Here.. (Max 30 Words)",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 98, 94, 94),
                        fontFamily: "CoreSansMed",
                        fontSize: 2.31*SizeConfig.heightMultiplier),
                  )),
            ),
          )
        ],
      ));
}