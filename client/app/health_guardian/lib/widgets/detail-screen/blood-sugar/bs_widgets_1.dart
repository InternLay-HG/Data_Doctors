import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:health_guardian/getX_controllers/detail-screen/blood_sugar_controllers.dart';
import 'package:health_guardian/styling/colors.dart';
import 'package:health_guardian/styling/images.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/buttons/detail_buttons.dart';

AppBar appB(void Function() onTap1, void Function() onTap2) {
  return AppBar(
    backgroundColor: Color.fromARGB(255, 245, 242, 242),
    toolbarHeight: 9.48*SizeConfig.heightMultiplier,
    leading: IconButton(
        onPressed: onTap1,
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 4.63*SizeConfig.heightMultiplier,
        )),
    actions: [
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert_outlined,
            color: Colors.black,
            size: 4.63*SizeConfig.heightMultiplier,
          ))
    ],
  );
}

Widget bloodSugarDataWidget() {
  return Container(
    height: 28.44*SizeConfig.heightMultiplier,
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0.63*SizeConfig.heightMultiplier),
        //  boxShadow: [
        //                 BoxShadow(color: Color.fromARGB(255, 161, 153, 153),spreadRadius: 2.5,blurRadius: 2)
        //               ],
            ),
    padding: EdgeInsets.symmetric(horizontal:1*SizeConfig.heightMultiplier, vertical: 0.52*SizeConfig.heightMultiplier),
    child: Column(
      children: [
        //* Upper Card
        Flexible(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //* for text
              Flexible(
                  flex: 9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 1.58*SizeConfig.heightMultiplier,
                      ),
                      Text(
                        "Blood Sugar",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "CoreSansBold",
                            fontSize: 4.2 * SizeConfig.heightMultiplier),
                      ),
                      SizedBox(
                        height: 0.52*SizeConfig.heightMultiplier,
                      ),
                      Text(
                        "Lifetime Summary",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 80, 78, 78),
                            fontFamily: "CoreSansBold",
                            fontSize: 2.4 * SizeConfig.heightMultiplier),
                      ),
                    ],
                  )),
              //* for vector image
              Flexible(
                  flex: 3,
                  child: SvgPicture.asset(Images.BloodSugarMeasureIcon))
            ],
          ),
        ),

        //* Bottom Data Card
        Flexible(
            flex: 1,
            child: Column(
              children: [
                SizedBox(
                  height: 0.737*SizeConfig.heightMultiplier
                ),
                Divider(
                  height: .52*SizeConfig.heightMultiplier,
                  color: const Color.fromARGB(255, 223, 214, 214),
                  thickness: 3,
                ),
                SizedBox(
                  height: 1.58*SizeConfig.heightMultiplier,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    dataCard("90.6", "Average"),
                    Container(
                        height: 9.48*SizeConfig.heightMultiplier,
                        child: VerticalDivider(
                          color: Color.fromARGB(255, 223, 214, 214),
                          width: 2.23*SizeConfig.widthMultiplier,
                          thickness: 3,
                        )),
                    dataCard("132.5", "Maximum"),
                    Container(
                        height: 9.48*SizeConfig.heightMultiplier,
                        child: VerticalDivider(
                          color: Color.fromARGB(255, 223, 214, 214),
                          width: 2.23*SizeConfig.widthMultiplier,
                          thickness: 3,
                        )),
                    dataCard("74.9", "Minimum"),
                  ],
                ),
              ],
            )),
      ],
    ),
  );
}

Widget dataCard(String value, String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(
                color: Colors.black,
                fontFamily: "CoreSansBold",
                fontSize: 3.4 * SizeConfig.heightMultiplier),
          ),
          Text(
            title,
            style: TextStyle(
                color: const Color.fromARGB(255, 80, 78, 78),
                fontFamily: "CoreSansMed",
                fontSize: 2.4 * SizeConfig.heightMultiplier),
          ),
        ],
      ),
    ],
  );
}

Widget doubleButtonWidget(BloodSugarControllers controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Obx(
        () => buttonsDetail(
            "Statistics",
            controller.previousPage,
            controller.pageIndex.value == 0
                ? Colours.buttonColorRed
                : Color.fromARGB(255, 211, 206, 206),
            controller.pageIndex.value == 0 ? Colors.white : Colors.black,
             5.79*SizeConfig.heightMultiplier,
            44.9*SizeConfig.widthMultiplier,
            1.26*SizeConfig.heightMultiplier),
      ),
      Obx(
        () => buttonsDetail(
            "History (260)",
            controller.navigatePage,
             controller.pageIndex.value == 1
                ? Colours.buttonColorRed
                : Color.fromARGB(255, 211, 206, 206),
            controller.pageIndex.value == 1? Colors.white : Colors.black,
            5.79*SizeConfig.heightMultiplier,
            44.9*SizeConfig.widthMultiplier,
            1.26*SizeConfig.heightMultiplier),
      ),
    ],
  );
}
