import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    double width) {
  return Container(
    height: 100,
    width: width,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(6),
    ),
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        header(title, Icons.star_border_outlined),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
            //* button color and text color changing logic based on their selection
            onTap: () {
              Get.bottomSheet(
                  backgroundColor: Colors.white,
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    height: 320,
                    child: Column(children: [
                      SizedBox(
                        height: 20,
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
                                  60,
                                  195,
                                  25,
                                  22),
                              buttonsDetail1(
                                  buttonTitle2,
                                  onTap2,
                                  Color.fromARGB(255, 246, 240, 241),
                                  Colors.black,
                                  65,
                                  225,
                                  25,
                                  20),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buttonsACard(
                                  buttonTitle3,
                                  onTap3,
                                  Color.fromARGB(255, 246, 240, 241),
                                  Colors.black,
                                  60,
                                  215,
                                  25,
                                  20),
                              buttonsACard(
                                  buttonTitle4,
                                  onTap4,
                                  Color.fromARGB(255, 246, 240, 241),
                                  Colors.black,
                                  60,
                                  200,
                                  25,
                                  24),
                            ],
                          ),
                          SizedBox(
                            height: 65,
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
                    fontSize: 25,
                    color: Colors.black),
              ),
            )),
      ],
    ),
  );
}
