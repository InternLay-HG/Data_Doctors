import 'package:flutter/material.dart';
import 'package:health_guardian/styling/colors.dart';
import 'package:health_guardian/styling/images.dart';
import 'package:health_guardian/styling/sizeConfig.dart';

List<IconData> iconDataList = [
  Icons.account_circle_outlined,
  Icons.alarm,
  Icons.privacy_tip_outlined,
  Icons.help_outline_outlined,
  Icons.logout,
];

List<String> title = [
  "Edit Profile",
  "Reminder",
  "Account & Security",
  "Help & Security",
  "Logout"
];

Widget profileWidgetAcc() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 3.348*SizeConfig.widthMultiplier, vertical: 0.526*SizeConfig.heightMultiplier),
    height: 12.4*SizeConfig.heightMultiplier,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(0.632*SizeConfig.heightMultiplier),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
            flex: 1,
            child: CircleAvatar(
                radius: 4.213*SizeConfig.heightMultiplier, backgroundImage: AssetImage(Images.profileIcon))),
        Flexible(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 1.5*SizeConfig.heightMultiplier,
                ),
                Text(
                  "Rohit Patel",
                  style: TextStyle(
                      fontFamily: "Poppins-Med",
                      fontWeight: FontWeight.bold,
                      fontSize: 2.738*SizeConfig.heightMultiplier,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 1.053*SizeConfig.heightMultiplier,
                ),
                FittedBox(
                  child: Text(
                    "rohit.2023ug2019@iiitranchi.ac.in",
                    style: TextStyle(
                        fontFamily: "Poppins-Med",
                        fontWeight: FontWeight.bold,
                        fontSize: 1.790*SizeConfig.heightMultiplier,
                        color: Colors.grey.shade700),
                  ),
                )
              ],
            )),
      ],
    ),
  );
}

Widget profileOptions(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(0.632*SizeConfig.heightMultiplier),
    ),
    height: 36.869*SizeConfig.heightMultiplier,
    padding: EdgeInsets.symmetric(vertical: 1.264*SizeConfig.heightMultiplier),
    child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            height: 6.847*SizeConfig.heightMultiplier,
            child: ListTile(
              leading: Icon(
                iconDataList[index],
                color: iconDataList[index] == Icons.logout
                    ? Colours.buttonColorRed
                    : Colors.black,
                size: 3.160*SizeConfig.heightMultiplier,
              ),
              title: Text(
                title[index],
                style: TextStyle(
                    fontFamily: "Poppins-Med",
                    fontWeight: FontWeight.bold,
                    fontSize: 2.317*SizeConfig.heightMultiplier,
                    color:
                        title[index] == "Logout" ? Colors.red : Colors.black),
              ),
              trailing: index == 4
                  ? SizedBox()
                  : Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.black,
                      size: 2.528*SizeConfig.heightMultiplier,
                    ),
            ),
          );
        }),
  );
}
