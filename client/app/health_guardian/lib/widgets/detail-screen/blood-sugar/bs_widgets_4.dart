import 'package:flutter/material.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/detail-screen/blood-sugar/bs_widgets_3.dart';

Widget addNoteWidget(TextEditingController controller) {
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
            height: 5.26*SizeConfig.heightMultiplier,
            child: TextField(
              style: TextStyle(
                  color: Color.fromARGB(255, 98, 94, 94),
                  fontSize: 1.89*SizeConfig.heightMultiplier,
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

Widget sugarScaleWidget() {
  return Container(
      height: 27.38 * SizeConfig.heightMultiplier,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0.63*SizeConfig.heightMultiplier),
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
              colorBar(Colors.blue),
              colorBar(Colors.green),
              colorBar(Colors.orange),
              colorBar(Colors.red)
            ],
          ),
          SizedBox(
            height: 2.63*SizeConfig.heightMultiplier,
          ),
          scaleText(Colors.blue, "Low", "< 72"),
          SizedBox(
            height: 0.52*SizeConfig.heightMultiplier,
          ),
          scaleText(Colors.green, "Normal", "72 - 99"),
          SizedBox(
            height: 0.52*SizeConfig.heightMultiplier,
          ),
          scaleText(Colors.orange, "Pre-Diabetes", "99 - 126"),
          SizedBox(
            height: 0.52*SizeConfig.heightMultiplier,
          ),
          scaleText(Colors.red, "Diabetes", ">= 126"),
          SizedBox(
            height: 0.52*SizeConfig.heightMultiplier,
          ),
        ],
      ));
}

Widget colorBar(Color color) {
  return Container(
    width: 20.08*SizeConfig.widthMultiplier, 
    height: 1.26*SizeConfig.heightMultiplier, // Adjust height as needed
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(1.58*SizeConfig.heightMultiplier),
      color: color,
    ),
  );
}

Widget scaleText(Color color, String text, String range) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 1.11*SizeConfig.widthMultiplier),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style:
              TextStyle(color: color, fontFamily: "CoreSansMed", fontSize: 2.31*SizeConfig.heightMultiplier),
        ),
        Text(
          range,
          style: TextStyle(
              color: Colors.black, fontFamily: "CoreSansMed", fontSize: 2.21*SizeConfig.heightMultiplier),
        ),
      ],
    ),
  );
}
