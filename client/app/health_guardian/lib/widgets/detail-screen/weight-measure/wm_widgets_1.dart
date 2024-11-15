import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:health_guardian/getX_controllers/detail-screen/weight_measure_controllers.dart';
import 'package:health_guardian/styling/colors.dart';
import 'package:health_guardian/styling/images.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/buttons/detail_buttons.dart';
import 'package:health_guardian/widgets/detail-screen/blood-sugar/bs_widgets_1.dart';

AppBar appBWm(void Function() onTap1, void Function() onTap2) {
  return AppBar(
    backgroundColor: Color.fromARGB(255, 245, 242, 242),
    toolbarHeight: 90,
    leading: IconButton(
        onPressed: onTap1,
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 44,
        )),
    actions: [
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert_outlined,
            color: Colors.black,
            size: 44,
          ))
    ],
  );
}

Widget wightMeasureDataWidget(){
  return Container(
    height: 270,
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
         boxShadow: [
                        BoxShadow(color: Color.fromARGB(255, 161, 153, 153),spreadRadius: 2.5,blurRadius: 2)
                      ],
            ),
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
                        height: 15,
                      ),
                      Text(
                        "Weight Measure",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "CoreSansBold",
                            fontSize: 3.6 * SizeConfig.heightMultiplier),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Lifetime Summary",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 80, 78, 78),
                            fontFamily: "CoreSansBold",
                            fontSize: 2.8 * SizeConfig.heightMultiplier),
                      ),
                    ],
                  )),
              //* for vector image
              Flexible(
                  flex: 3,
                  child: SvgPicture.asset(Images.WeightMeasureIcon))
            ],
          ),
        ),

        //* Bottom Data Card
        Flexible(
            flex: 1,
            child: Column(
              children: [
                SizedBox(
                  height: 7,
                ),
                Divider(
                  height: 5,
                  color: const Color.fromARGB(255, 223, 214, 214),
                  thickness: 3,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    dataCard("75.4", "Average"),
                    Container(
                        height: 90,
                        child: VerticalDivider(
                          color: Color.fromARGB(255, 223, 214, 214),
                          width: 10,
                          thickness: 3,
                        )),
                    dataCard("83.8", "Maximum"),
                    Container(
                        height: 90,
                        child: VerticalDivider(
                          color: Color.fromARGB(255, 223, 214, 214),
                          width: 10,
                          thickness: 3,
                        )),
                    dataCard("70.5", "Minimum"),
                  ],
                ),
              ],
            )),
      ],
    ),
  );
}

Widget doubleButtonWMWidget(WeightMeasureControllers controller){
  return  Row(
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
            55,
            210,
            12),
      ),
      Obx(
        () => buttonsDetail(
            "History (260)",
            controller.navigatePage,
             controller.pageIndex.value == 1
                ? Colours.buttonColorRed
                : Color.fromARGB(255, 211, 206, 206),
            controller.pageIndex.value == 1? Colors.white : Colors.black,
            55,
            210,
            12),
      ),
    ],
  );
}