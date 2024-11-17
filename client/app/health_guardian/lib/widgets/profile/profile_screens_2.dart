import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/getX_controllers/profile/profile_controller.dart';
import 'package:health_guardian/styling/colors.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/profile/profile_screens.dart';

final ProfileController profileController = Get.put(ProfileController());

Widget screen4() {
  return Container(
    padding:
        EdgeInsets.symmetric(horizontal: 2.67 * SizeConfig.widthMultiplier),
    child: Column(
      children: [
        SizedBox(height: 1.58 * SizeConfig.heightMultiplier),
        FittedBox(
          child: Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            'Are You Currently Diagnosed\nwith Any of These Diseases?',
            style: TextStyle(
                color: Colors.black, fontFamily: "CoreSansBold", fontSize: 29.5),
          ),
        ),
        SizedBox(
          height: 5.26 * SizeConfig.heightMultiplier,
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
                        height: 13.69 * SizeConfig.heightMultiplier,
                        width: 29.01 * SizeConfig.widthMultiplier,
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
                          size: 8.42 * SizeConfig.heightMultiplier,
                        ),
                      ),
                      SizedBox(
                        height: 2.10 * SizeConfig.heightMultiplier,
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
                        height: 13.69 * SizeConfig.heightMultiplier,
                        width: 29.01 * SizeConfig.widthMultiplier,
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
                          size: 8.42 * SizeConfig.heightMultiplier,
                        ),
                      ),
                      SizedBox(
                        height: 2.10 * SizeConfig.heightMultiplier,
                      ),
                      profileScreenText("Sugar")
                    ],
                  ),
                ),
              ],
            )),

        SizedBox(
          height: 2.107 * SizeConfig.heightMultiplier
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
                            height: 13.69 * SizeConfig.heightMultiplier,
                        width: 29.01 * SizeConfig.widthMultiplier,
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
                          size: 8.42 * SizeConfig.heightMultiplier,
                        ),
                      ),
                      SizedBox(
                        height: 2.10 * SizeConfig.heightMultiplier,
                      ),
                      profileScreenText("B.P")
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
                        height: 13.69 * SizeConfig.heightMultiplier,
                        width: 29.01 * SizeConfig.widthMultiplier,
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
                          size: 8.42 * SizeConfig.heightMultiplier,
                        ),
                      ),
                      SizedBox(
                        height: 2.10 * SizeConfig.heightMultiplier,
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
