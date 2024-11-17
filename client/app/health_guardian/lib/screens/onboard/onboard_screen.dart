import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/getX_controllers/onboard/onboard_controllers.dart';
import 'package:health_guardian/screens/auth/login_screen.dart';
import 'package:health_guardian/screens/splash/splash_screen.dart';
import 'package:health_guardian/styling/colors.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/styling/strings.dart';
import 'package:health_guardian/widgets/buttons/double_buttons.dart';
import 'package:health_guardian/widgets/onboard/onboard_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardScreen extends StatelessWidget {
  final PageViewController _pageViewController = Get.put(PageViewController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          //* images of pageView widget
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.67,
            child: Container(
              color: Colours.buttonColorRed,
            ),
          ),

          //* bottom card widget
          FractionallySizedBox(
            alignment: Alignment.bottomLeft,
            heightFactor: 0.44,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.50),
                        spreadRadius: 6,
                        blurRadius: 10)
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft:
                          Radius.circular(6.32 * SizeConfig.heightMultiplier),
                      topRight:
                          Radius.circular(6.32 * SizeConfig.heightMultiplier))),
              child: PageView(
                controller: _pageViewController.pageController,
                onPageChanged: (index) {
                  _pageViewController.changeIndex(index);
                },
                children: [
                  cardText(Strings.cardTitle1, Strings.cardDesc1),
                  cardText(Strings.cardTitle2, Strings.cardDesc2),
                  cardText(Strings.cardTitle3, Strings.cardDesc3),
                ],
              ),
            ),
          ),

          //* for color indicator
          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.2640,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 36.90 * SizeConfig.widthMultiplier),
              child: SmoothPageIndicator(
                count: 3,
                controller: _pageViewController.pageController,
                effect: ExpandingDotsEffect(
                    dotHeight: 1.85 * SizeConfig.heightMultiplier,
                    dotWidth: 4.00 * SizeConfig.widthMultiplier,
                    dotColor: Colors.grey,
                    activeDotColor: Colours.buttonColorRed),
              ),
            ),
          ),

          //*buttons for page controller
          FractionallySizedBox(
            alignment: Alignment.bottomLeft,
            heightFactor: 0.115,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Obx(
                      () => doubleButton1(
                          "Back",
                          _pageViewController.pageIndex.value == 0
                              ? () => Get.to(() => LoginScreen(),
                                  transition: Transition.upToDown)
                              : () => _pageViewController.previousPage(),
                          Color.fromARGB(255, 243, 233, 235),
                          Colours.buttonColorRed),
                    ),
                    Obx(
                      () => doubleButton2(
                          "Continue",
                          _pageViewController.pageIndex.value == 2
                              ? () => Get.to(() => LoginScreen(),
                                  transition: Transition.upToDown)
                              : () => _pageViewController.navigatePage(),
                          Colours.buttonColorRed,
                          Colors.white),
                    )
                  ],
                )),
          ),

          //* Back navigation
          FractionallySizedBox(
            alignment: Alignment.topLeft,
            heightFactor: 0.09,
            child: Padding(
              padding: EdgeInsets.only(top: 1.58 * SizeConfig.heightMultiplier),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      Get.off(() => SplashScreen(),
                          transition: Transition.upToDown);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 4.21 * SizeConfig.heightMultiplier,
                    )),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
