import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:health_guardian/styling/images.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/dashboard/dashboard_widgets_3.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 241, 241),
      //* AppBar
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 247, 241, 241),
        toolbarHeight: 8.427 * SizeConfig.heightMultiplier,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 4.424* SizeConfig.heightMultiplier,
            )),
        title: Text(
          "Accounts",
          style: TextStyle(
              color: Colors.black, fontFamily: "CoreSansBold", fontSize: 3.581*SizeConfig.heightMultiplier),
        ),
        actions: [
          SvgPicture.asset(
            Images.heartIconRed,
            height: 4.740*SizeConfig.heightMultiplier,
            width: 10.044*SizeConfig.widthMultiplier,
          ),
          SizedBox(
            width:2.678*SizeConfig.widthMultiplier,
          )
        ],
      ),

      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 2.232*SizeConfig.widthMultiplier, vertical: 1.264*SizeConfig.heightMultiplier),
            child: Column(
              children: [
                //* Profile Logo Widget
                profileWidgetAcc(),

                SizedBox(
                  height: 1.053*SizeConfig.heightMultiplier,
                ),
              ],
            ),
          ),
          //* List for profile options
          Container(
              padding: EdgeInsets.symmetric(horizontal: 2.232*SizeConfig.widthMultiplier, vertical: 1.264*SizeConfig.heightMultiplier),
              child: profileOptions(context))
        ],
      ),
    ));
  }
}
