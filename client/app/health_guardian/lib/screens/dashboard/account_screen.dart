import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:health_guardian/styling/images.dart';
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
        toolbarHeight: 80,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {Get.back();},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 42,
            )),
        title: Text(
          "Accounts",
          style: TextStyle(
              color: Colors.black, fontFamily: "CoreSansBold", fontSize: 34),
        ),
        actions: [
          SvgPicture.asset(
            Images.heartIconRed,
            height: 45,
            width: 45,
          ),
          SizedBox(
            width: 12,
          )
        ],
      ),

      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Column(
              children: [
                //* Profile Logo Widget
                profileWidgetAcc(),

                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          //* List for profile options
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: profileOptions(context))
        ],
      ),
    ));
  }
}
