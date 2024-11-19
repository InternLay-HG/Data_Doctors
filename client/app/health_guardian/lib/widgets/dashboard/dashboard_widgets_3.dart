import 'package:flutter/material.dart';
import 'package:health_guardian/styling/colors.dart';
import 'package:health_guardian/styling/images.dart';

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
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    height: 110,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(6),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
            flex: 1,
            child: CircleAvatar(
                radius: 40, backgroundImage: AssetImage(Images.profileIcon))),
        Flexible(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Rohit Patel",
                  style: TextStyle(
                      fontFamily: "Poppins-Med",
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "rohit.2023ug2019@iiitranchi.ac.in",
                  style: TextStyle(
                      fontFamily: "Poppins-Med",
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.grey.shade700),
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
      borderRadius: BorderRadius.circular(6),
    ),
    height: 350,
    padding: EdgeInsets.symmetric(vertical: 12),
    child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            height: 65,
            child: ListTile(
              leading: Icon(
                iconDataList[index],
                color: iconDataList[index] == Icons.logout
                    ? Colours.buttonColorRed
                    : Colors.black,
                size: 30,
              ),
              title: Text(
                title[index],
                style: TextStyle(
                    fontFamily: "Poppins-Med",
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color:
                        title[index] == "Logout" ? Colors.red : Colors.black),
              ),
              trailing: index == 4
                  ? SizedBox()
                  : Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.black,
                      size: 24,
                    ),
            ),
          );
        }),
  );
}
