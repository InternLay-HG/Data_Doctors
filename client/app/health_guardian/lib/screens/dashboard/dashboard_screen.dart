import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:health_guardian/getX_controllers/dashboard/dashboard_controllers.dart';
import 'package:health_guardian/screens/dashboard/account_screen.dart';
import 'package:health_guardian/screens/dashboard/diet_screen.dart';
import 'package:health_guardian/screens/dashboard/home_screen.dart';
import 'package:health_guardian/screens/dashboard/measure_screen.dart';
import 'package:health_guardian/screens/dashboard/report_screen.dart';
import 'package:health_guardian/styling/colors.dart';
import 'package:health_guardian/widgets/dashboard/dashboard_widgets_1.dart';

List<dynamic> pages = [
  Text("Hello"),
  Home_D_Screen(),
  MeasureScreen(),
  DietScreen(),
  ReportScreen(),
  AccountScreen()
];

class DashboardScreen extends StatelessWidget {
  final DashboardControllers controllers = Get.put(DashboardControllers());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      //* AppBar for my screen
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: currentTimeWidget(),
        toolbarHeight: 95,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                color: Colours.buttonColorRed,
                size: 42,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.solidBell,
                color: const Color.fromARGB(255, 103, 101, 101),
                size: 41,
              )),
        ],
      ),

      body: Obx(
        () => SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: pages[controllers.currentPage.value + 1],
          ),
        ),
      ),

      //* bottomBar for navigation
      bottomNavigationBar: Obx(() => Theme(
          data: ThemeData(splashFactory: NoSplash.splashFactory),
          child: bottomBar(controllers, context))),
    ));
  }
}
