
import 'package:flutter/material.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/detail-screen/blood-sugar/bs_widgets_3.dart';

Widget addNoteWeightWidget(TextEditingController controller) {
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

Widget weightScaleWidget() {
  return Container(
      height: 440,
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
            height: 30,
          ),
          scaleTextWeight(Colors.blue, "Very Severely Underweight", "< 40 kg"),
          SizedBox(
            height: 10,
          ),
          scaleTextWeight(Colors.blue.shade300, "Severely underweight", "40 - 45 kg"),
          SizedBox(
            height: 10,
          ),
          scaleTextWeight(Colors.blue.shade200, "Underweight", "46 - 54 kg"),
          SizedBox(
            height: 10,
          ),
          scaleTextWeight(Colors.green, "Normal", "55 - 70 kg"),
          SizedBox(
            height: 10,
          ),
          scaleTextWeight(Colors.yellow, "Overweight", "71 - 85 kg"),
          SizedBox(
            height: 10,
          ),
          scaleTextWeight(Colors.yellow.shade800, "Obese Class I", "86 - 100 kg"),
          SizedBox(
            height: 10,
          ),
           scaleTextWeight(Colors.orange, "Obese Class II", "101 - 120 kg"),
          SizedBox(
            height: 10,
          ),
           scaleTextWeight(Colors.red, "Obese Class Obese Class III", "> 120 kg"),
          SizedBox(
            height: 10,
          ),
        ],
      ));
}

Widget colorBarWeight(Color color) {
  return Container(
    width: 44, // Adjust width as needed
    height: 12, // Adjust height as needed
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: color,
    ),
  );
}

Widget scaleTextWeight(Color color, String text, String range) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(color: color, fontFamily: "CoreSansMed", fontSize: 20),
        ),
        Text(
          range,
          style: TextStyle(
              color: Colors.black, fontFamily: "CoreSansMed", fontSize: 18),
        ),
      ],
    ),
  );
}