import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/getX_controllers/detail-screen/blood_pressure_controllers.dart';
import 'package:health_guardian/styling/colors.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/buttons/detail_buttons.dart';

Widget userInputWidgetSystolicPressure(BloodPressureControllers controller) {
  return Container(
    height:  18.2*SizeConfig.heightMultiplier,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(0.63*SizeConfig.heightMultiplier),
    ),
    padding: EdgeInsets.symmetric(horizontal: 3.34*SizeConfig.widthMultiplier, vertical: 2.10*SizeConfig.heightMultiplier),
    child: Column(
      children: [
        Center(
          child: buttonsDetail1("Enter your Systolic BP in mmHg", () {},
              Colours.buttonColorRed, Colors.white, 50, 400, 6, 21),
        ),
        SizedBox(
          height:2.10*SizeConfig.heightMultiplier,
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
                        ((controller.pressureLevelSystolic.value - 60) * 10)
                            .round(),
                  ),
                  onSelectedItemChanged: (int index) {
                    double selectedWeight = 60 + (index * 0.1);
                    controller.changeLevelSystolic(selectedWeight);
                  },
                  children: List<Widget>.generate(1910, (int index) {
                    double value = 60 + (index * 0.1);
                    return Center(
                      child: Text(
                        "${value.toStringAsFixed(1)} mmHg",
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
                "${controller.pressureLevelSystolic.value.toStringAsFixed(1)} mmHg",
                style: TextStyle(
                  fontFamily: "CoreSansBold",
                  fontSize: 4.00*SizeConfig.heightMultiplier,
                  color: Colors.black,
                ),
              )),
        )
      ],
    ),
  );
}

Widget userInputWidgetDiastolicPressure(BloodPressureControllers controller) {
  return Container(
    height: 18.2*SizeConfig.heightMultiplier,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(0.63*SizeConfig.heightMultiplier),
    ),
    padding: EdgeInsets.symmetric(horizontal: 3.34*SizeConfig.widthMultiplier, vertical: 2.10*SizeConfig.heightMultiplier),
    child: Column(
      children: [
        Center(
          child: buttonsDetail1("Enter your Diastolic BP in mmHg", () {},
              Colours.buttonColorRed, Colors.white, 50, 400, 6, 21),
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
                        ((controller.pressureLevelDiastolic.value - 60) * 10)
                            .round(),
                  ),
                  onSelectedItemChanged: (int index) {
                    double selectedWeight = 60 + (index * 0.1);
                    controller.changeLevelDiastolic(selectedWeight);
                  },
                  children: List<Widget>.generate(1910, (int index) {
                    double value = 60 + (index * 0.1);
                    return Center(
                      child: Text(
                        "${value.toStringAsFixed(1)} mmHg",
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
                "${controller.pressureLevelDiastolic.value.toStringAsFixed(1)} mmHg",
                style: TextStyle(
                  fontFamily: "CoreSansBold",
                  fontSize: 4.00*SizeConfig.heightMultiplier,
                  color: Colors.black,
                ),
              )),
        )
      ],
    ),
  );
}

Widget pulseLevelWidget(BloodPressureControllers controller) {
  return Container(
    height: 18.2*SizeConfig.heightMultiplier,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(0.63*SizeConfig.heightMultiplier),
    ),
    padding: EdgeInsets.symmetric(horizontal: 3.34*SizeConfig.widthMultiplier, vertical: 2.10*SizeConfig.heightMultiplier),
    child: Column(
      children: [
        Center(
          child: buttonsDetail1("Enter your Pulse Level in bpm", () {},
              Colours.buttonColorRed, Colors.white, 50, 400, 6, 21),
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
                    initialItem: controller.pulseLevel.value - 50,
                  ),
                  onSelectedItemChanged: (int index) {
                    int selectedPulse = 50 + index;
                    controller.changeLevelPulse(selectedPulse);
                  },
                  children: List<Widget>.generate(
                    121,
                    (int index) {
                      int value = 50 + index;
                      return Center(
                        child: Text(
                          "$value bpm",
                          style: TextStyle(
                            fontFamily: "CoreSansBold",
                            fontSize: 2.73 * SizeConfig.heightMultiplier,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          },
          child: Obx(() => Text(
                "${controller.pulseLevel.value} bpm",
                style: TextStyle(
                  fontFamily: "CoreSansBold",
                  fontSize:4.00*SizeConfig.heightMultiplier,
                  color: Colors.black,
                ),
              )),
        ),
      ],
    ),
  );
}
