import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:health_guardian/getX_controllers/dashboard/dashboard_controllers.dart';
import 'package:health_guardian/styling/colors.dart';
import 'package:health_guardian/styling/images.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/buttons/dashboard_buttons.dart';
import 'package:health_guardian/widgets/onboard/onboard_widgets.dart';

Widget currentTimeWidget() {
  return Text.rich(
    TextSpan(
      children: [
        TextSpan(
          text: "Nov 02",
          style: style.copyWith(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        WidgetSpan(
          child: Transform.translate(
            offset: const Offset(6, -20),
            child: Text(
              'Sat',
              style: style.copyWith(fontSize: 24, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget titleWidget() {
  return Row(
    children: [
      Text(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        "Hello, Nikhil !",
        style: TextStyle(
            color: Colors.black,
            fontFamily: "Poppins-Med",
            fontWeight: FontWeight.w700,
            fontSize: 34),
      ),
      SizedBox(
        width: 2.4 * SizeConfig.widthMultiplier,
      ),
      SvgPicture.asset(
        Images.welcomeIcon,
        height: 4.24 * SizeConfig.heightMultiplier,
        width: 10.80 * SizeConfig.widthMultiplier,
      )
    ],
  );
}

TextStyle style = TextStyle(
    color: const Color.fromARGB(255, 103, 101, 101), fontFamily: "Poppins-Med");

BottomNavigationBar bottomBar(
     DashboardControllers controller, BuildContext context) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    selectedIconTheme: icontheme().copyWith(color: Colours.buttonColorRed),
    unselectedIconTheme: icontheme().copyWith(color: Colors.grey.shade800),
    selectedItemColor: Colours.buttonColorRed,
    unselectedItemColor:  Colors.grey.shade800,
    unselectedLabelStyle: labelStyle(),
    selectedLabelStyle: labelStyle(),
    currentIndex: controller.currentPage.value,
    onTap: (value) {
      controller.changeIndex(value);
    },
    items: [
      BottomNavigationBarItem(
        label: "Home",
        icon: Icon(Icons.home),
      ),
      BottomNavigationBarItem(
        label: "Analyze",
        icon: Icon(FontAwesomeIcons.heartCirclePlus),
      ),
      BottomNavigationBarItem(
        label: "Diet",
        icon: Icon(FontAwesomeIcons.bowlFood),
      ),
      BottomNavigationBarItem(
        label: "Reports",
        icon: Icon(Icons.assignment),
      ),
      BottomNavigationBarItem(
        label: "Account",
        icon: Icon(Icons.account_circle),
      ),
    ],
  );
}

Widget heartMeasureCard(void Function() onTap) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    height: 230,
    decoration: BoxDecoration(
        color: Color.fromARGB(255, 245, 208, 204),
        borderRadius: BorderRadius.circular(10)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //* for text
        Flexible(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Heart Rate",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Poppins-Bold",
                      fontSize: 3.4 * SizeConfig.heightMultiplier),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "150 Records",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 80, 78, 78),
                      fontFamily: "Poppins-Bold",
                      fontSize: 2.5 * SizeConfig.heightMultiplier),
                ),
                SizedBox(height: 25),
                buttonsSample("Measure", onTap, Colours.buttonColorRed,
                    Colors.white, 55, 160)
              ],
            )),
        //* for vector image
        Flexible(flex: 3, child: SvgPicture.asset(Images.heartMeasureIcon))
      ],
    ),
  );
}

Widget diseaseCard(
    String disease, String image, Color cardColor, Color buttonColor,void Function() onTap,RxBool buttonValue,void Function(bool) OnTap1) {
  return Container(
    height: 100,
    padding: EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
        color: cardColor, borderRadius: BorderRadius.circular(10)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Text(
                    disease,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 21,
                        fontFamily: "Poppins-Bold"),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: SvgPicture.asset(
                    image,
                    height: 60,
                    width: 60,
                  ),
                ),
              ],
            )),
        SizedBox(width: 5,),
        Flexible(
            flex: 1,
            child: buttonsDisease(
                "Record", onTap, buttonColor, Colors.white, 55, 170,buttonValue,OnTap1),)
      ],
    ),
  );
}

TextStyle labelStyle() {
  return TextStyle(
    fontFamily: "CoreSansBold",
    color: Colours.buttonColorRed,
    fontSize: 1.89 * SizeConfig.heightMultiplier,
  );
}

IconThemeData icontheme() {
  return IconThemeData(
    size: 4.00 * SizeConfig.heightMultiplier,
  );
}
