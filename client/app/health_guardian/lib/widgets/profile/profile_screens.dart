import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:health_guardian/getX_controllers/profile/profile_controller.dart';
import 'package:health_guardian/styling/colors.dart';
import 'package:health_guardian/widgets/onboard/onboard_widgets.dart';

final ProfileController profileController = Get.put(ProfileController());

Widget profileScreenText(String title) {
  return Text(
    overflow: TextOverflow.ellipsis,
    maxLines: 2,
    title,
    style: TextStyle(
        color: Colors.black, fontFamily: "CoreSansBold", fontSize: 34),
  );
}

Widget screen1() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12),
    child: Column(
      children: [
        SizedBox(
          height: 10,
        ),
        profileScreenText("Let's Know you More, Enter Your Full Name."),
        SizedBox(
          height: 80,
        ),
        //* field or entering name for profile
        TextField(
          style: TextStyle(
              color: const Color.fromARGB(255, 144, 138, 138),
              fontFamily: "CoreSansBold",
              fontSize: 40),
          controller: profileController.profileNameCOntroller,
          decoration: InputDecoration(
            label: Center(
              child: Text(
                "Your Name",
                style: TextStyle(
                    color: const Color.fromARGB(255, 144, 138, 138),
                    fontFamily: "CoreSansBold",
                    fontSize: 45),
              ),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            contentPadding: EdgeInsets.symmetric(horizontal: 90, vertical: 30),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(
                    width: 5, color: const Color.fromARGB(255, 154, 147, 147))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                    width: 2, color: const Color.fromARGB(255, 154, 147, 147))),
          ),
        )
      ],
    ),
  );
}

Widget screen2() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12),
    child: Column(
      children: [
        SizedBox(
          height: 15,
        ),
        profileScreenText("What's your Gender ?"),
        SizedBox(
          height: 50,
        ),
        // * for selecting male and female genders and changing colours
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: (){profileController.male.value = 1; profileController.female.value = 0;},
                child: Column(
                  children: [
                    Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                          color: profileController.male.value == 1 ? Colours.buttonColorRed : Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: const Color.fromARGB(255, 120, 118, 118))),
                        child: Icon(
                          Icons.male,
                          color: profileController.male.value == 1 ? Colors.white : Colors.black,
                          size: 80,
                        ),
                      ),
                    SizedBox(
                      height: 20,
                    ),
                    profileScreenText("Male")
                  ],
                ),
              ),
               GestureDetector(
                onTap: (){profileController.female.value = 1; profileController.male.value = 0;},
                 child: Column(
                  children: [
                    Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        color: profileController.female.value == 1 ? Colours.buttonColorRed : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: const Color.fromARGB(255, 120, 118, 118))),
                      child: Icon(
                        Icons.female,
                        color: profileController.female.value == 1 ? Colors.white : Colors.black,
                        size: 80,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    profileScreenText("Female")
                  ],
                             ),
               )
            ],
          ),
        ),
         SizedBox(
          height: 60,
        ),
        Center(child: buttonsSample("Prefer not to say", (){profileController.male.value = 0; profileController.female.value =0;}, Color.fromARGB(255, 243, 219, 222), Colors.black,60, 280),)
      ],
    ),
  );
}
