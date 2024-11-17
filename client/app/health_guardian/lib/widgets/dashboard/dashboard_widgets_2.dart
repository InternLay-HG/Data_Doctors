import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:health_guardian/styling/colors.dart';
import 'package:health_guardian/styling/images.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/buttons/dashboard_buttons.dart';

Widget historyText() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 3,
          child: Text(
            "Recorded History",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 26,
                fontFamily: "CoreSansBold"),
          ),
        ),
        Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "View All",
                  style: TextStyle(
                      color: Colours.buttonColorRed,
                      fontFamily: "CoreSansBold",
                      fontSize: 2.7 * SizeConfig.heightMultiplier),
                ),
              ],
            ))
      ],
    ),
  );
}

Widget historyRecordWidget() {
  return Container(
    height: 340,
    child: ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colours.buttonColorRed, width: 2)),
            ),
            SizedBox(
              height: 20,
            )
          ],
        );
      },
    ),
  );
}

Widget aiDoctorWidget() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    height: 130,
    decoration: BoxDecoration(
        color: Color.fromARGB(255, 228, 210, 135),
        borderRadius: BorderRadius.circular(10)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //* for text
        Flexible(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Your AI Doctor",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Poppins-Bold",
                      fontSize: 2.8 * SizeConfig.heightMultiplier),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Chat with AI Assistant",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 80, 78, 78),
                      fontFamily: "Poppins-Bold",
                      fontSize: 1.9 * SizeConfig.heightMultiplier),
                ),
                SizedBox(height: 25),
              ],
            )),
        //* for vector image
        Flexible(flex: 3, child: Image.asset(Images.AiDoctorIcon))
      ],
    ),
  );
}

Widget descTextAnalyze(String title,double fontSize) {
  return Row(
    children: [
      Text(
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        title,
        style: TextStyle(
            color: Color.fromARGB(255, 99, 92, 92),
            fontFamily: "CoreSansLight",
            fontWeight: FontWeight.bold,
            fontSize: fontSize),
      ),
    ],
  );
}

Widget analyzeDiseaseCard(String Disease, Color color, Color buttonColor,String Image,RxBool buttonValue,void Function(bool) OnTap1,void Function() OnTap) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
    height: 220,
    width: 200,
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(8), color: color),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         SizedBox(
          height: 5,
        ),
        Text(
          Disease,
          style: TextStyle(
              fontFamily: "Poppins-Bold", fontSize: 25, color: Colors.grey.shade900),
        ),
        SizedBox(
          height: 15,
        ),
        analyzeButton(
            "Analyze", OnTap, buttonColor, Colors.white, 45, 110, 30, 19,buttonValue,OnTap1),
        SizedBox(
          height: 20,
        ),
        Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              Image,
              height: 70,
              width: 70,
            ))
      ],
    ),
  );
}
