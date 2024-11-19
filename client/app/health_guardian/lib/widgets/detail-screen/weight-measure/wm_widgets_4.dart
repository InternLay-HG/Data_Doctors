
import 'package:flutter/material.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/detail-screen/blood-sugar/bs_widgets_3.dart';

Widget addNoteWeightWidget(TextEditingController controller) {
  return Container(
      height: 11.06*SizeConfig.heightMultiplier,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0.63 * SizeConfig.heightMultiplier),
        // boxShadow: [
        //   BoxShadow(
        //       color: Color.fromARGB(255, 161, 153, 153),
        //       spreadRadius: 2.5,
        //       blurRadius: 2)
        // ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 2.67*SizeConfig.widthMultiplier, vertical: 1.05*SizeConfig.heightMultiplier),
      child: Column(
        children: [
          header("Note", Icons.note_alt_outlined),
          SizedBox(
            height: 0.52*SizeConfig.heightMultiplier,
          ),
          SizedBox(
            height: 5.26*SizeConfig.heightMultiplier,
            child: TextField(
              style: TextStyle(
                  color: Color.fromARGB(255, 98, 94, 94),
                  fontSize: 1.89*SizeConfig.heightMultiplier,
                  fontFamily: "CoreSansMed"),
              controller: controller,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 1.05*SizeConfig.heightMultiplier),
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

Widget weightScaleWidget() {
  return Container(
      height: 46.34*SizeConfig.heightMultiplier,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(1.33*SizeConfig.heightMultiplier),
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
            height: 1.58*SizeConfig.heightMultiplier,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              colorBarWeight(Colors.blue),
              colorBarWeight(Colors.blue.shade300),
              colorBarWeight(Colors.blue.shade200),
              colorBarWeight(Colors.green),
              colorBarWeight(Colors.yellow),
              colorBarWeight(Colors.yellow.shade800),
              colorBarWeight(Colors.orange),
              colorBarWeight(Colors.red)
            ],
          ),
          SizedBox(
            height: 3.16*SizeConfig.heightMultiplier,
          ),
          scaleTextWeight(Colors.blue, "Very Severely Underweight", "< 40 kg"),
          SizedBox(
            height: 1.05*SizeConfig.heightMultiplier,
          ),
          scaleTextWeight(Colors.blue.shade300, "Severely underweight", "40 - 45 kg"),
          SizedBox(
            height: 1.05*SizeConfig.heightMultiplier,
          ),
          scaleTextWeight(Colors.blue.shade200, "Underweight", "46 - 54 kg"),
          SizedBox(
            height: 1.05*SizeConfig.heightMultiplier,
          ),
          scaleTextWeight(Colors.green, "Normal", "55 - 70 kg"),
          SizedBox(
            height: 1.05*SizeConfig.heightMultiplier,
          ),
          scaleTextWeight(Colors.yellow, "Overweight", "71 - 85 kg"),
          SizedBox(
            height: 1.05*SizeConfig.heightMultiplier,
          ),
          scaleTextWeight(Colors.yellow.shade800, "Obese Class I", "86 - 100 kg"),
          SizedBox(
            height: 1.05*SizeConfig.heightMultiplier,
          ),
           scaleTextWeight(Colors.orange, "Obese Class II", "101 - 120 kg"),
          SizedBox(
            height: 1.05*SizeConfig.heightMultiplier,
          ),
           scaleTextWeight(Colors.red, "Obese Class Obese Class III", "> 120 kg"),
          SizedBox(
            height: 1.05*SizeConfig.heightMultiplier,
          ),
        ],
      ));
}

Widget colorBarWeight(Color color) {
  return Container(
    width: 9.821*SizeConfig.widthMultiplier, // Adjust width as needed
    height: 1.264*SizeConfig.heightMultiplier, // Adjust height as needed
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: color,
    ),
  );
}

Widget scaleTextWeight(Color color, String text, String range) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 1.11*SizeConfig.widthMultiplier),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(color: color, fontFamily: "CoreSansMed", fontSize: 2.10*SizeConfig.heightMultiplier),
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