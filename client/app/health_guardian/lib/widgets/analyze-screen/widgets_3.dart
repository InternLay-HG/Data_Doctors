import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/analyze-screen/widgets_1.dart';
import 'package:health_guardian/widgets/auth/login_widgets.dart';
import 'package:health_guardian/widgets/buttons/detail_buttons.dart';
import 'package:health_guardian/widgets/detail-screen/blood-sugar/bs_widgets_3.dart';

Widget Four_Parameter_Card(
    String title,
    String content,
    void Function() onTap1,
    void Function() onTap2,
    void Function() onTap3,
    void Function() onTap4,
    String buttonTitle1,
    String buttonTitle2,
    String buttonTitle3,
    String buttonTitle4,
    double width,
    IconData icon) {
  return Container(
    height: 10.534 * SizeConfig.heightMultiplier,
    width: width,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(0.632 * SizeConfig.heightMultiplier),
    ),
    padding: EdgeInsets.symmetric(
        horizontal: 2.678 * SizeConfig.widthMultiplier,
        vertical: 1.053 * SizeConfig.heightMultiplier),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        header(title, icon),
        SizedBox(
          height: 1.053 * SizeConfig.heightMultiplier,
        ),
        GestureDetector(
            //* button color and text color changing logic based on their selection
            onTap: () {
              Get.bottomSheet(
                  backgroundColor: Colors.white,
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 2.232 * SizeConfig.widthMultiplier,
                        vertical: 1.264 * SizeConfig.heightMultiplier),
                    height: 33.709 * SizeConfig.heightMultiplier,
                    child: Column(children: [
                      SizedBox(
                        height: 2.106 * SizeConfig.heightMultiplier,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buttonsACard(
                                  buttonTitle1,
                                  onTap1,
                                  Color.fromARGB(255, 246, 240, 241),
                                  Colors.black,
                                  6.320 * SizeConfig.heightMultiplier,
                                  43.52 * SizeConfig.widthMultiplier,
                                  2.63 * SizeConfig.heightMultiplier,
                                  2.317 * SizeConfig.heightMultiplier),
                              buttonsDetail1(
                                  buttonTitle2,
                                  onTap2,
                                  Color.fromARGB(255, 246, 240, 241),
                                  Colors.black,
                                  6.320 * SizeConfig.heightMultiplier,
                                  43.52 * SizeConfig.widthMultiplier,
                                  2.63 * SizeConfig.heightMultiplier,
                                  2.317 * SizeConfig.heightMultiplier),
                            ],
                          ),
                          SizedBox(
                            height: 1.580 * SizeConfig.heightMultiplier,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buttonsACard(
                                  buttonTitle3,
                                  onTap3,
                                  Color.fromARGB(255, 246, 240, 241),
                                  Colors.black,
                                  6.320 * SizeConfig.heightMultiplier,
                                  43.52 * SizeConfig.widthMultiplier,
                                  2.63 * SizeConfig.heightMultiplier,
                                  2.317 * SizeConfig.heightMultiplier),
                              buttonsACard(
                                  buttonTitle4,
                                  onTap4,
                                  Color.fromARGB(255, 246, 240, 241),
                                  Colors.black,
                                  6.320 * SizeConfig.heightMultiplier,
                                  43.52 * SizeConfig.widthMultiplier,
                                  2.63 * SizeConfig.heightMultiplier,
                                  2.317 * SizeConfig.heightMultiplier),
                            ],
                          ),
                          SizedBox(
                            height: 6.847 * SizeConfig.heightMultiplier,
                          ),
                          authButton("OK", () {
                            Get.back();
                          })
                        ],
                      ),
                    ]),
                  ));
            },
            child: FittedBox(
              child: Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                content,
                style: TextStyle(
                    fontFamily: "CoreSansBold",
                    fontSize: 2.633 * SizeConfig.heightMultiplier,
                    color: Colors.black),
              ),
            )),
      ],
    ),
  );
}
