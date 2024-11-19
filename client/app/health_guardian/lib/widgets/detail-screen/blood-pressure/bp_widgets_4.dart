import 'package:flutter/material.dart';
import 'package:health_guardian/styling/sizeConfig.dart';

Widget PressureScaleWidget() {
  return Container(
      height: 35.81*SizeConfig.heightMultiplier,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(.63*SizeConfig.heightMultiplier),
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
          Text(
            "Scale",
            style: TextStyle(
                color: Colors.black,
                fontFamily: "CoreSansMed",
                fontWeight: FontWeight.bold,
                fontSize: 3.2 * SizeConfig.heightMultiplier),
          ),
          SizedBox(
            height: 2.10*SizeConfig.heightMultiplier,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              colorBarBP(Colors.blue),
              colorBarBP(Colors.green),
              colorBarBP(Colors.yellow.shade400),
              colorBarBP(Colors.orange),
              colorBarBP(Colors.orange.shade800),
              colorBarBP(Colors.red)
            ],
          ),
          SizedBox(
            height:2.63*SizeConfig.heightMultiplier,
          ),
          scaleTextBP(Colors.blue, "Hypotension", "SYS<90 & DIA<60"),
          SizedBox(
            height: 0.52*SizeConfig.heightMultiplier,
          ),
          scaleTextBP(Colors.green, "Normal", "SYS 90-119 & DIA 60-79"),
          SizedBox(
            height: 0.52*SizeConfig.heightMultiplier,
          ),
          scaleTextBP(Colors.yellow.shade400, "Elevated", "SYS 120-129 & DIA 60-79"),
          SizedBox(
            height: 0.52*SizeConfig.heightMultiplier,
          ),
          scaleTextBP(Colors.orange, "HP - Stage 1", "SYS 130-139 & DIA 80-89"),
          SizedBox(
            height: 0.52*SizeConfig.heightMultiplier,
          ),
          scaleTextBP(Colors.orange.shade800, "HP - Stage 2", "SYS 140-180 & DIA 90-120"),
          SizedBox(
            height: 0.52*SizeConfig.heightMultiplier,
          ),
          scaleTextBP(Colors.red, "Hypertensive", "SYS>180 & DIA<120"),
          SizedBox(
            height: 0.52*SizeConfig.heightMultiplier,
          ),
        ],
      ));
}

Widget colorBarBP(Color color) {
  return Container(
    width: 6.32*SizeConfig.heightMultiplier, // Adjust width as needed
    height: 2.67*SizeConfig.widthMultiplier, // Adjust height as needed
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(1.58*SizeConfig.heightMultiplier),
      color: color,
    ),
  );
}

Widget scaleTextBP(Color color, String text, String range) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style:
              TextStyle(color: color, fontFamily: "CoreSansMed", fontSize: 2.10*SizeConfig.heightMultiplier),
        ),
        Text(
          range,
          style: TextStyle(
              color: Colors.black, fontFamily: "CoreSansMed", fontSize: 1.89*SizeConfig.heightMultiplier),
        ),
      ],
    ),
  );
}
