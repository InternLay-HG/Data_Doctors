import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/analyze-screen/widgets_1.dart';
import 'package:health_guardian/widgets/auth/login_widgets.dart';
import 'package:health_guardian/widgets/buttons/detail_buttons.dart';
import 'package:health_guardian/widgets/detail-screen/blood-sugar/bs_widgets_3.dart';

Widget Double_Parameter_Card(
    String title,
    String content,
    void Function() onTap1,
    void Function() onTap2,
    String buttonTitle1,
    String buttonTitle2,
    bool condition1,
    bool condition2,
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
        SizedBox(height: 1.053 * SizeConfig.heightMultiplier),
        GestureDetector(
          onTap: () {
            Get.bottomSheet(
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 2.232 * SizeConfig.widthMultiplier,
                    vertical: 1.264 * SizeConfig.heightMultiplier),
                height: 23.174 * SizeConfig.heightMultiplier,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                      1.264 * SizeConfig.heightMultiplier),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 2.106 * SizeConfig.heightMultiplier),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buttonsDetail1(
                          buttonTitle1,
                          onTap1,
                          const Color.fromARGB(255, 246, 240, 241),
                          Colors.black,
                          6.320 * SizeConfig.heightMultiplier,
                          37.94 * SizeConfig.widthMultiplier,
                          3.160 * SizeConfig.heightMultiplier,
                          2.42 * SizeConfig.heightMultiplier,
                        ),
                        buttonsDetail1(
                          buttonTitle2,
                          onTap2,
                          const Color.fromARGB(255, 246, 240, 241),
                          Colors.black,
                          6.320 * SizeConfig.heightMultiplier,
                          37.94 * SizeConfig.widthMultiplier,
                          3.160 * SizeConfig.heightMultiplier,
                          2.42 * SizeConfig.heightMultiplier,
                        ),
                      ],
                    ),
                    SizedBox(height: 4.740 * SizeConfig.heightMultiplier),
                    authButton("OK", () {
                      Get.back();
                    }),
                  ],
                ),
              ),
            );
          },
          child: FittedBox(
            child: Text(
              content,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                fontFamily: "CoreSansBold",
                fontSize: 2.633 * SizeConfig.heightMultiplier,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget triple_Parameter_Card(
    String title,
    String content,
    void Function() onTap1,
    void Function() onTap2,
    void Function() onTap3,
    String buttonTitle1,
    String buttonTitle2,
    String buttonTitle3,
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
                    height: 30.54 * SizeConfig.heightMultiplier,
                    child: Column(children: [
                      SizedBox(
                        height: 2.106 * SizeConfig.heightMultiplier,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              buttonsACard(
                                  buttonTitle1,
                                  onTap1,
                                  const Color.fromARGB(255, 246, 240, 241),
                                  Colors.black,
                                  5.793 * SizeConfig.heightMultiplier,
                                  40.17 * SizeConfig.widthMultiplier,
                                  3.160 * SizeConfig.heightMultiplier,
                                  2.317 * SizeConfig.heightMultiplier),
                              buttonsDetail1(
                                  buttonTitle2,
                                  onTap2,
                                  const Color.fromARGB(255, 246, 240, 241),
                                  Colors.black,
                                  5.793 * SizeConfig.heightMultiplier,
                                  40.17 * SizeConfig.widthMultiplier,
                                  3.160 * SizeConfig.heightMultiplier,
                                  2.317 * SizeConfig.heightMultiplier),
                            ],
                          ),
                          SizedBox(
                            height: 1.580 * SizeConfig.heightMultiplier,
                          ),
                          buttonsACard(
                              buttonTitle3,
                              onTap3,
                              Color.fromARGB(255, 246, 240, 241),
                              Colors.black,
                              5.793 * SizeConfig.heightMultiplier,
                              40.17 * SizeConfig.widthMultiplier,
                              3.160 * SizeConfig.heightMultiplier,
                              2.317 * SizeConfig.heightMultiplier),
                          SizedBox(
                            height: 5.793 * SizeConfig.heightMultiplier,
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
