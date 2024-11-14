import 'package:flutter/material.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/detail-screen/blood-sugar/bs_widgets_3.dart';

Widget addNoteWidget(TextEditingController controller) {
  return Container(
      height: 105,
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
        children: [
          header("Note", Icons.note_alt_outlined),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 50,
            child: TextField(
              style: TextStyle(
                  color: Color.fromARGB(255, 98, 94, 94),
                  fontSize: 18,
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
                        fontSize: 22),
                  )),
            ),
          )
        ],
      ));
}

Widget sugarScaleWidget() {
  return Container(
      height: 260,
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
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
            height: 15,
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
            height: 25,
          ),
          scaleText(Colors.blue, "Low", "< 72"),
          SizedBox(
            height: 5,
          ),
          scaleText(Colors.green, "Normal", "72 - 99"),
          SizedBox(
            height: 5,
          ),
          scaleText(Colors.orange, "Pre-Diabetes", "99 - 126"),
          SizedBox(
            height: 5,
          ),
          scaleText(Colors.red, "Diabetes", ">= 126"),
          SizedBox(
            height: 5,
          ),
        ],
      ));
}

Widget colorBar(Color color) {
  return Container(
    width: 90, // Adjust width as needed
    height: 12, // Adjust height as needed
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: color,
    ),
  );
}

Widget scaleText(Color color, String text, String range) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(color: color, fontFamily: "CoreSansMed", fontSize: 22),
        ),
        Text(
          range,
          style: TextStyle(
              color: Colors.black, fontFamily: "CoreSansMed", fontSize: 21),
        ),
      ],
    ),
  );
}
