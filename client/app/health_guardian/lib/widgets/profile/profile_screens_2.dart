import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/getX_controllers/profile/profile_controller.dart';
import 'package:health_guardian/styling/colors.dart';
import 'package:health_guardian/widgets/profile/profile_screens.dart';

final ProfileController profileController = Get.put(ProfileController());

Widget screen4() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12),
    child: Column(
      children: [
        SizedBox(height: 15),
        Text(
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          'Are You Currently Diagnosed with Any of These Diseases?',
          style: TextStyle(
              color: Colors.black, fontFamily: "CoreSansBold", fontSize: 29.5),
        ),
        SizedBox(
          height: 50,
        ),
        //* for selecting diseases

        //* heart and blood sugar
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    profileController.heart_disease.value =
                        !profileController.heart_disease.value;
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                            color: profileController.heart_disease.value
                                ? Colours.buttonColorRed
                                : Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 120, 118, 118))),
                        child: Icon(
                          Icons.favorite,
                          color: profileController.heart_disease.value
                              ? Colors.white
                              : Colors.black,
                          size: 80,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      profileScreenText("Heart")
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    profileController.blood_sugar.value =
                        !profileController.blood_sugar.value;
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                            color: profileController.blood_sugar.value
                                ? Colours.buttonColorRed
                                : Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 120, 118, 118))),
                        child: Icon(
                          Icons.bloodtype,
                          color: profileController.blood_sugar.value
                              ? Colors.white
                              : Colors.black,
                          size: 80,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      profileScreenText("Sugar")
                    ],
                  ),
                ),
              ],
            )),

        SizedBox(
          height: 20,
        ),

        //* pressure and weight
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    profileController.blood_pressure.value =
                        !profileController.blood_pressure.value;
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                            color: profileController.blood_pressure.value
                                ? Colours.buttonColorRed
                                : Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 120, 118, 118))),
                        child: Icon(
                          Icons.health_and_safety,
                          color: profileController.blood_pressure.value
                              ? Colors.white
                              : Colors.black,
                          size: 80,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      profileScreenText("Pressure")
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    profileController.weight_bmi.value =
                        !profileController.weight_bmi.value;
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                            color: profileController.weight_bmi.value
                                ? Colours.buttonColorRed
                                : Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 120, 118, 118))),
                        child: Icon(
                          Icons.monitor_weight_outlined,
                          color: profileController.weight_bmi.value
                              ? Colors.white
                              : Colors.black,
                          size: 80,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      profileScreenText("Weight")
                    ],
                  ),
                ),
              ],
            ))
      ],
    ),
  );
}
