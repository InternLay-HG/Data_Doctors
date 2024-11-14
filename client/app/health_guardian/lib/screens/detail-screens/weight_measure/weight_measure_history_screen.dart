import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/detail-screen/weight-measure/wm_widgets_2.dart';

class WeightMeasureHistoryScreen extends StatelessWidget {
  const WeightMeasureHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 241, 241),

      //* AppBar
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 247, 241, 241),
        toolbarHeight: 80,
        centerTitle: true,
        leading:  IconButton(
        onPressed: (){Get.back();},
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 34,
        )),
        title: Text(
          "Weight Measure History",
          style: TextStyle(
              fontFamily: "CoreSansBold", color: Colors.black, fontSize: 34),
        ),
      ),

      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              height: 105,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 161, 153, 153),
                        spreadRadius: 2.5,
                        blurRadius: 2)
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 240, 237, 237)),
              child: Row(children: [
                Flexible(
                  flex: 2,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "75.6",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "CoreSansBold",
                                fontSize: 3.3 * SizeConfig.heightMultiplier),
                          ),
                          Text(
                            "kg",
                            style: TextStyle(
                                color: const Color.fromARGB(255, 80, 78, 78),
                                fontFamily: "CoreSansMed",
                                fontSize: 2.1 * SizeConfig.heightMultiplier),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                          height: 70,
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
                      Flexible(flex: 3, child: statsWidgetWeightMeasure("", "", "")),
                      Flexible(
                          flex: 1,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: 28,
                          )),
                    ],
                  ),
                )
              ]),
            );
          }),
    ));
  }
}