import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:health_guardian/getX_controllers/profile/profile_controller.dart';
import 'package:health_guardian/styling/colors.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/profile/profile_screens.dart';

final ProfileController profileController = Get.put(ProfileController());

Widget screen3(BuildContext context) {
  return Container(
    padding:
        EdgeInsets.symmetric(horizontal: 2.67 * SizeConfig.widthMultiplier),
    child: Column(
      children: [
        //* select the birthday date

        SizedBox(height: 1.58 * SizeConfig.heightMultiplier),
        profileScreenText("When is your birthday?"),
        SizedBox(height: 2.107 * SizeConfig.heightMultiplier),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            button("Date", () {
              Get.bottomSheet(
                Container(
                    height: 26.34 * SizeConfig.heightMultiplier,
                    color: Colors.white,
                    child: CupertinoDatePicker(
                      initialDateTime: profileController.selectedDate.value,
                      mode: CupertinoDatePickerMode.date,
                      minimumDate: DateTime(1900),
                      maximumDate: DateTime.now(),
                      onDateTimeChanged: (DateTime newDate) {
                        profileController.changeTime(newDate);
                      },
                    )),
              );
            }, Colours.buttonColorRed, Colors.white),
            Icon(
              Icons.arrow_forward_rounded,
              color: Colours.buttonColorRed,
              size: 3.79 * SizeConfig.heightMultiplier,
            ),
            Obx(
              () => valueBox(
                  "${profileController.selectedDate.value.day}/${profileController.selectedDate.value.month}/${profileController.selectedDate.value.year}"),
            ),
          ],
        ),
        SizedBox(height: 4.74 * SizeConfig.heightMultiplier),

        //* select the weight

        profileScreenText("What's your weight?"),
        SizedBox(height: 2.107 * SizeConfig.heightMultiplier),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            button("Weight", () {
              Get.bottomSheet(
                Container(
                  height: 26.34 * SizeConfig.heightMultiplier,
                  color: Colors.white,
                  child: CupertinoPicker(
                    itemExtent: 40,
                    scrollController: FixedExtentScrollController(
                      initialItem: profileController.selectedWeight.value - 1,
                    ),
                    onSelectedItemChanged: (int index) {
                      profileController.changeWeight(index + 1);
                    },
                    children: List<Widget>.generate(100, (int index) {
                      return Center(
                        child: Text(
                          "${index + 1} kg",
                          style: TextStyle(
                              fontFamily: "CoreSansBold", fontSize:2.73 * SizeConfig.heightMultiplier),
                        ),
                      );
                    }),
                  ),
                ),
              );
            }, Colours.buttonColorRed, Colors.white),
            Icon(
              Icons.arrow_forward_rounded,
              color: Colours.buttonColorRed,
              size: 3.79 * SizeConfig.heightMultiplier,
            ),
            Obx(
              () => valueBox("${profileController.selectedWeight.value} kg"),
            ),
          ],
        ),
        SizedBox(height: 4.74 * SizeConfig.heightMultiplier),

        //* select the height

        profileScreenText("How tall are you?"),
        SizedBox(height:  2.107 * SizeConfig.heightMultiplier),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            button("Height", () {
              Get.bottomSheet(
                Container(
                  height: 26.34 * SizeConfig.heightMultiplier,
                  color: Colors.white,
                  child: CupertinoPicker(
                    itemExtent: 40,
                    scrollController: FixedExtentScrollController(
                      initialItem: profileController.selectedHeight.value,
                    ),
                    onSelectedItemChanged: (int index) {
                      profileController.changeHeight(index);
                    },
                    children: List<Widget>.generate(301, (int index) {
                      return Center(
                        child: Text(
                          "$index cm",
                          style: TextStyle(
                              fontFamily: "CoreSansBold", fontSize: 2.73 * SizeConfig.heightMultiplier),
                        ),
                      );
                    }),
                  ),
                ),
              );
            }, Colours.buttonColorRed, Colors.white),
            Icon(
              Icons.arrow_forward_rounded,
              color: Colours.buttonColorRed,
              size: 3.79 * SizeConfig.heightMultiplier,
            ),
            Obx(
              () => valueBox("${profileController.selectedHeight.value} cm"),
            )
          ],
        ),
      ],
    ),
  );
}

Widget button(
    String title, void Function() onTap, Color color, Color textColor) {
  return InkWell(
    onTap: onTap,
    child: Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(35)),
      height: 5.79 * SizeConfig.heightMultiplier,
      width: 35.71 * SizeConfig.widthMultiplier,
      child: Center(
        child: FittedBox(
          child: Text(
            title,
            style: TextStyle(
              color: textColor,
              fontFamily: "CoreSansLight",
              fontWeight: FontWeight.bold,
            ).copyWith(fontSize: 2.52 * SizeConfig.heightMultiplier),
          ),
        ),
      ),
    ),
  );
}

Widget valueBox(String value) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        color: Colors.white,
        borderRadius: BorderRadius.circular(1.05 * SizeConfig.heightMultiplier)),
    height: 6.32 * SizeConfig.heightMultiplier,
    width:44.64 * SizeConfig.widthMultiplier,
    child: Center(
      child: Text(
        value,
        style: TextStyle(
          color: Color.fromARGB(255, 49, 48, 48),
          fontFamily: "CoreSansLight",
          fontWeight: FontWeight.bold,
        ).copyWith(fontSize: 2.42 * SizeConfig.heightMultiplier),
      ),
    ),
  );
}
