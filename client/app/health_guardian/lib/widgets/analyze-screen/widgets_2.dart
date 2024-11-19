import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  IconData icon
) {
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
        header(title, icon),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            Get.bottomSheet(
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buttonsDetail1(
                          buttonTitle1,
                          onTap1,
                          const Color.fromARGB(255, 246, 240, 241),
                          Colors.black,
                          60,
                          170,
                          30,
                          23,
                        ),
                        buttonsDetail1(
                          buttonTitle2,
                          onTap2,
                          const Color.fromARGB(255, 246, 240, 241),
                          Colors.black,
                          60,
                          170,
                          30,
                          23,
                        ),
                      ],
                    ),
                    const SizedBox(height: 45),
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
              style: const TextStyle(
                fontFamily: "CoreSansBold",
                fontSize: 25,
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
    double width,IconData icon
    ) {
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
        header(title, icon),
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
                    height: 290,
                    child: Column(children: [
                      SizedBox(
                        height: 20,
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
                                  55,
                                  180,
                                  30,
                                  22),
                              buttonsDetail1(
                                  buttonTitle2,
                                  onTap2,
                                  const Color.fromARGB(255, 246, 240, 241),
                                  Colors.black,
                                  55,
                                  180,
                                  30,
                                  22),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          buttonsACard(
                              buttonTitle3,
                              onTap3,
                              Color.fromARGB(255, 246, 240, 241),
                              Colors.black,
                              55,
                              180,
                              30,
                              22),
                          SizedBox(
                            height: 55,
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
