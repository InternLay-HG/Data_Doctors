import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:health_guardian/styling/colors.dart';
import 'package:health_guardian/styling/images.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/buttons/dashboard_buttons.dart';
import 'package:health_guardian/widgets/detail-screen/blood-pressure/bp_widgets_2.dart';

Widget historyText() {
  return Container(
    padding:
        EdgeInsets.symmetric(horizontal: 1.11 * SizeConfig.widthMultiplier),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 5,
          child: Text(
            "Recorded History",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 2.73 * SizeConfig.heightMultiplier,
                fontFamily: "CoreSansBold"),
          ),
        ),
        SizedBox(width: 11.160*SizeConfig.widthMultiplier,),
        Flexible(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "View All",
                  overflow: TextOverflow.ellipsis,
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
    padding: EdgeInsets.symmetric(
      horizontal: 1.11 * SizeConfig.widthMultiplier,
    ),
    height: 36.86 * SizeConfig.heightMultiplier,
    child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(
                vertical: 1.58 * SizeConfig.heightMultiplier,
                horizontal: 2.67 * SizeConfig.widthMultiplier),
            margin: EdgeInsets.symmetric(
                vertical: 0.84 * SizeConfig.heightMultiplier),
            height: 11.06 * SizeConfig.heightMultiplier,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(1.05 * SizeConfig.heightMultiplier),
                color: Colors.grey.shade200),
            child: Row(children: [
              Flexible(
                flex: 2,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "105",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "CoreSansBold",
                              fontSize: 3.3 * SizeConfig.heightMultiplier),
                        ),
                        Text(
                          "mmHg",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 80, 78, 78),
                              fontFamily: "CoreSansMed",
                              fontSize: 2.1 * SizeConfig.heightMultiplier),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 4.46 * SizeConfig.widthMultiplier,
                    ),
                    Container(
                        height: 7.37 * SizeConfig.heightMultiplier,
                        child: VerticalDivider(
                          color: Color.fromARGB(255, 229, 222, 222),
                          thickness: 3,
                        )),
                  ],
                ),
              ),
              Flexible(
                flex: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(flex: 3, child: statsWidgetBP("", "state", "")),
                    Flexible(
                        flex: 1,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 2.94 * SizeConfig.heightMultiplier,
                        )),
                  ],
                ),
              )
            ]),
          );
        }),
  );
}

Widget aiDoctorWidget() {
  return Container(
    padding:
        EdgeInsets.symmetric(horizontal: 4.46 * SizeConfig.widthMultiplier),
    height: 13.69 * SizeConfig.heightMultiplier,
    decoration: BoxDecoration(
        color: Color.fromARGB(255, 228, 210, 135),
        borderRadius:
            BorderRadius.circular(1.05 * SizeConfig.heightMultiplier)),
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
                  height: 2.63 * SizeConfig.heightMultiplier,
                ),
                Text(
                  "Your AI Doctor",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Poppins-Bold",
                      fontSize: 2.8 * SizeConfig.heightMultiplier),
                ),
                SizedBox(
                  height: 1.05 * SizeConfig.heightMultiplier,
                ),
                Text(
                  "Chat with AI Assistant",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 80, 78, 78),
                      fontFamily: "Poppins-Bold",
                      fontSize: 1.9 * SizeConfig.heightMultiplier),
                ),
                SizedBox(height: 2.63 * SizeConfig.heightMultiplier),
              ],
            )),
        //* for vector image
        Flexible(flex: 3, child: Image.asset(Images.AiDoctorIcon))
      ],
    ),
  );
}

Widget descTextAnalyze(String title, double fontSize) {
  return FittedBox(
    child: Text(
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      title,
      style: TextStyle(
          color: Color.fromARGB(255, 99, 92, 92),
          fontFamily: "CoreSansLight",
          fontWeight: FontWeight.bold,
          fontSize: fontSize),
    ),
  );
}

Widget analyzeDiseaseCard(
    String Disease,
    Color color,
    Color buttonColor,
    String Image,
    RxBool buttonValue,
    void Function(bool) OnTap1,
    void Function() OnTap) {
  return Container(
    padding: EdgeInsets.symmetric(
        vertical: 1.26 * SizeConfig.heightMultiplier,
        horizontal: 2.23 * SizeConfig.widthMultiplier),
    height: 23.17 * SizeConfig.heightMultiplier,
    width: 45.11 * SizeConfig.widthMultiplier,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0.84 * SizeConfig.heightMultiplier),
        color: color),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 0.52 * SizeConfig.heightMultiplier,
        ),
        FittedBox(
          child: Text(
            Disease,
            style: TextStyle(
                fontFamily: "Poppins-Bold",
                fontSize: 2.63 * SizeConfig.heightMultiplier,
                color: Colors.grey.shade900),
          ),
        ),
        SizedBox(
          height: 1.58 * SizeConfig.heightMultiplier,
        ),
        analyzeButton(
            "Analyze",
            OnTap,
            buttonColor,
            Colors.white,
            4.74 * SizeConfig.heightMultiplier,
            24.55 * SizeConfig.widthMultiplier,
            3.16 * SizeConfig.heightMultiplier,
            2.00 * SizeConfig.heightMultiplier,
            buttonValue,
            OnTap1),
        SizedBox(
          height: 2.10 * SizeConfig.heightMultiplier,
        ),
        Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              Image,
              height: 7.37 * SizeConfig.heightMultiplier,
              width: 15.625 * SizeConfig.widthMultiplier,
            ))
      ],
    ),
  );
}
