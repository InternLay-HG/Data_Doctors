import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/getX_controllers/button/button_controllers.dart';
import 'package:health_guardian/styling/sizeConfig.dart';

final ButtonControllers controller = Get.put(ButtonControllers());

Widget cardText(String title, String desc) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.only(
            top: 4.74 * SizeConfig.heightMultiplier,
            left: 6.69 * SizeConfig.widthMultiplier,
            right: 6.69 * SizeConfig.widthMultiplier),
        child: FittedBox(
          child: Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.black,
                fontFamily: "CoreSansBold",
                fontWeight: FontWeight.bold,
                fontSize: 4.21 * SizeConfig.heightMultiplier),
          ),
        ),
      ),
      SizedBox(
        height: 2.4 * SizeConfig.heightMultiplier,
      ),
      Container(
          padding: EdgeInsets.symmetric(
            horizontal: 4.46 * SizeConfig.widthMultiplier,
          ),
          child: Text(
            overflow: TextOverflow.ellipsis,
            desc,
            maxLines: 4,
            style: TextStyle(
                color: Colors.grey.shade900,
                fontFamily: "CoreSansMed",
                fontSize: 2.3 * SizeConfig.heightMultiplier),
          )),
    ],
  );
}

Widget buttonsSample(String title, void Function() onTap, Color color,
    Color textColor, double height, double width) {
  return InkWell(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius:
              BorderRadius.circular(3.16 * SizeConfig.heightMultiplier)),
      height: height,
      width: width,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontFamily: "CoreSansMed",
            fontWeight: FontWeight.bold,
          ).copyWith(fontSize: 2.6 * SizeConfig.heightMultiplier),
        ),
      ),
    ),
  );
}
