import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/screens/welcome/welcome_screen_user.dart';
import 'package:health_guardian/styling/colors.dart';
import 'package:health_guardian/styling/images.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:health_guardian/widgets/buttons/double_buttons.dart';
import 'package:health_guardian/widgets/profile/profile_screens.dart';
import 'package:health_guardian/widgets/profile/profile_screens_1.dart';
import 'package:health_guardian/widgets/profile/profile_screens_2.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProfileCompletionScreen extends StatefulWidget {
  @override
  _ProfileCompletionScreenState createState() =>
      _ProfileCompletionScreenState();
}

class _ProfileCompletionScreenState extends State<ProfileCompletionScreen> {
  PageController _pageController = PageController();
  int _currentIndex = 0;
  bool _animateProgress = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigateNextPage() {
    Future.delayed(Duration(milliseconds: 200), () async {
      if (_currentIndex < 3) {
        setState(() {
          _animateProgress = true;
        });
        _pageController.nextPage(
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      } else {
        //* show loading widget and navigate to home page
        await showDialog(
            context: context,
            barrierColor: Colors.black.withOpacity(0.7),
            builder: (context) {
              Future.delayed(Duration(seconds: 5), () {
                Navigator.of(context)
                    .pop(); //* Close the dialog after 5 seconds
              });

              return Dialog(
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          3.16 * SizeConfig.heightMultiplier)),
                  child: loaderWidget());
            });

        Get.to(() => WelcomeScreenUser(), transition: Transition.downToUp);
      }
    });
  }

  void _navigatePrevPage() {
    Future.delayed(Duration(milliseconds: 200), () {
      if (_currentIndex > 0) {
        setState(() {
          _animateProgress = true;
        });
        _pageController.previousPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
      _animateProgress = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double currentProgress = (_currentIndex + 1) / 4;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            //* Page indicator widget
            FractionallySizedBox(
              alignment: Alignment.topCenter,
              heightFactor: 0.1,
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 3.34 * SizeConfig.widthMultiplier),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //* icon for navigating back
                    InkWell(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 4.00 * SizeConfig.heightMultiplier,
                      ),
                    ),
                    //* indicator for pages
                    LinearPercentIndicator(
                      animation: _animateProgress,
                      animationDuration: 500,
                      progressColor: Colours.buttonColorRed,
                      percent: currentProgress,
                      barRadius:
                          Radius.circular(2.31 * SizeConfig.heightMultiplier),
                      curve: Curves.linear,
                      lineHeight: 1.89 * SizeConfig.heightMultiplier,
                      width: 61.38 * SizeConfig.widthMultiplier,
                      onAnimationEnd: () {
                        setState(() {
                          _animateProgress = false;
                        });
                      },
                    ),
                    //* current page text
                    Text(
                      "${_currentIndex + 1}/4",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 3.16 * SizeConfig.heightMultiplier,
                        fontFamily: "CoreSansBold",
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //* showing pages
            FractionallySizedBox(
              alignment: Alignment.bottomLeft,
              heightFactor: 0.880,
              child: PageView(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                children: [
                  screen1(),
                  screen2(),
                  screen3(context),
                  screen4(),
                ],
              ),
            ),

            //* bottom buttons
            FractionallySizedBox(
              heightFactor: 0.14,
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  doubleButton1(
                    "Back",
                    _navigatePrevPage,
                    Color.fromARGB(255, 243, 219, 222),
                    Colours.buttonColorRed,
                  ),
                  doubleButton2(
                    "Continue",
                    _navigateNextPage,
                    Colours.buttonColorRed,
                    Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget loaderWidget() {
  return Container(
    width: 40.17 * SizeConfig.widthMultiplier,
    height: 18.96 * SizeConfig.heightMultiplier,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(1.05 * SizeConfig.heightMultiplier)),
    child: Column(
      children: [
        SizedBox(
          height: 2.63 * SizeConfig.heightMultiplier,
        ),
        LottieBuilder.asset(
          Images.loadingAnimation,
          height: 8.42 * SizeConfig.heightMultiplier,
          width: 17.85 * SizeConfig.widthMultiplier,
        ),
        SizedBox(
          height: 1.05 * SizeConfig.heightMultiplier,
        ),
        Text(
          "Creating your account...",
          style: TextStyle(
              color: Colors.black,
              fontFamily: "CoreSansBold",
              fontSize: 2.21 * SizeConfig.heightMultiplier),
        )
      ],
    ),
  );
}
