import 'package:flutter/material.dart';
import 'package:health_guardian/getX_controllers/auth/login_controllers.dart';
import 'package:health_guardian/styling/colors.dart';
import 'package:health_guardian/styling/sizeConfig.dart';
import 'package:pinput/pinput.dart';

Widget T1(String title, String image) {
  return Row(
    children: [
      Text(
        title,
        style: TextStyle(
            color: Colors.black,
            fontFamily: "CoreSansBold",
            fontSize: 3.8 * SizeConfig.heightMultiplier),
      ),
      SizedBox(
        width: 2.23 * SizeConfig.widthMultiplier,
      ),
      Image.asset(
        image,
        height: 4.74 * SizeConfig.heightMultiplier,
        width: 11.40 * SizeConfig.widthMultiplier,
      )
    ],
  );
}

Widget T2(String title) {
  return Row(
    children: [
      Text(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        title,
        style: TextStyle(
            color: Color.fromARGB(255, 99, 92, 92),
            fontFamily: "CoreSansLight",
            fontWeight: FontWeight.bold,
            fontSize: 2.45 * SizeConfig.heightMultiplier),
      ),
    ],
  );
}

Widget Authtext(String text) {
  return Row(
    children: [
      Text(
        text,
        style: TextStyle(
            color: Colors.black,
            fontFamily: "CoreSansMed",
            fontWeight: FontWeight.bold,
            fontSize: 2.63 * SizeConfig.heightMultiplier),
      ),
    ],
  );
}

Widget fieldText(String text, TextEditingController controller, IconData icon,
    TextInputType type) {
  return TextField(
    keyboardType: type,
    style: TextStyle(
        color: Color.fromARGB(255, 51, 49, 49),
        fontFamily: "CoreSansLight",
        fontSize: 2.31 * SizeConfig.heightMultiplier),
    controller: controller,
    decoration: InputDecoration(
        filled: true,
        fillColor: Color(0x66D9D9D9),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x66D9D9D9))),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius:
                BorderRadius.circular(0.80 * SizeConfig.heightMultiplier)),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding:
            EdgeInsets.symmetric(vertical: 2.10 * SizeConfig.heightMultiplier),
        label: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                  color: Color.fromARGB(255, 51, 49, 49),
                  fontFamily: "CoreSansLight",
                  fontSize: 2.31 * SizeConfig.heightMultiplier),
            ),
          ],
        ),
        prefixIcon: Icon(
          icon,
          size: 2.52 * SizeConfig.heightMultiplier,
          color: Color.fromARGB(255, 51, 49, 49),
        )),
  );
}

InputDecoration fieldPasswordDecoration(String text, IconData icon) {
  return InputDecoration(
      filled: true,
      fillColor: Color(0x66D9D9D9),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Color(0x66D9D9D9))),
      border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius:
              BorderRadius.circular(0.84 * SizeConfig.heightMultiplier)),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding:
          EdgeInsets.symmetric(vertical: 2.10 * SizeConfig.heightMultiplier),
      label: Row(
        children: [
          Text(
            text,
            style: TextStyle(
                color: Color.fromARGB(255, 51, 49, 49),
                fontFamily: "CoreSansLight",
                fontSize: 2.31 * SizeConfig.heightMultiplier),
          ),
        ],
      ),
      prefixIcon: Icon(
        icon,
        size: 2.52 * SizeConfig.heightMultiplier,
        color: Color.fromARGB(255, 51, 49, 49),
      ));
}

Widget authButton(String text, void Function() onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      height: 6.32 * SizeConfig.heightMultiplier,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius:
              BorderRadius.circular(3.37 * SizeConfig.heightMultiplier)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontFamily: "CoreSansMed",
              fontSize: 2.8 * SizeConfig.heightMultiplier),
        ),
      ),
    ),
  );
}

Widget T3(String text1, String text2, void Function() onTap) {
  return GestureDetector(
    onTap: onTap,
    child: RichText(
      text: TextSpan(
        text: text1,
        style: TextStyle(
                color: Colors.white,
                fontFamily: "CoreSansBold",
                fontSize: 2.40 * SizeConfig.heightMultiplier)
            .copyWith(color: Colors.white),
        children: <TextSpan>[
          TextSpan(
            text: text2,
            style: TextStyle(
                    color: Colors.white,
                    fontFamily: "CoreSansBold",
                    fontSize: 2.40 * SizeConfig.heightMultiplier)
                .copyWith(color: Colors.black), // Different color for 'Login'
          ),
        ],
      ),
    ),
  );
}

Widget orDivider() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Divider(
          color: Color.fromARGB(255, 185, 181, 181),
          thickness: 1,
          height: 10,
        ),
      ),
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 2.23 * SizeConfig.widthMultiplier),
        child: Text(
          "OR",
          style: TextStyle(
            color: Color.fromARGB(255, 185, 181, 181),
            fontFamily: "CoreSansBold",
            fontSize: 2.00 * SizeConfig.heightMultiplier,
          ),
        ),
      ),
      Expanded(
        child: Divider(
          color: Color.fromARGB(255, 185, 181, 181),
          thickness: 1,
          height: 10,
        ),
      ),
    ],
  );
}

Widget forgotPassWidget(function loginControllers) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Transform.scale(
            scale: 1.4,
            child: Checkbox(
                fillColor: WidgetStateProperty.all(Colors.white),
                focusColor: Colours.buttonColorRed,
                side: BorderSide(
                    color: loginControllers.isCheck.value
                        ? Colours.buttonColorRed
                        : Colours.buttonColorRed,
                    width: 2),
                checkColor: Colors.black,
                value: loginControllers.isCheck.value,
                onChanged: (value) => loginControllers.changeCheck(value)),
          ),
          Text(
            "Remember me",
            style: TextStyle(
                color: Colors.black,
                fontFamily: "CoreSansBold",
                fontSize: 2.20 * SizeConfig.heightMultiplier),
          ),
        ],
      ),
      Text(
        "Forgot Password?",
        style: TextStyle(
            color: Colours.buttonColorRed,
            fontFamily: "CoreSansBold",
            fontSize: 2.1 * SizeConfig.heightMultiplier),
      ),
    ],
  );
}

Widget OTPfield(TextEditingController controller) {
  return Pinput(
    controller: controller,
    length: 4,
    defaultPinTheme: pinTheme(),
    focusedPinTheme: pinTheme().copyWith(
      decoration: pinTheme().decoration!.copyWith(
            border: Border.all(color: Colors.white), // No border on focus
          ),
    ),
    submittedPinTheme: pinTheme(),
    showCursor: true,
    onTap: () {},
  );
}

PinTheme pinTheme() {
  return PinTheme(
    margin: EdgeInsets.symmetric(horizontal: 2.1 * SizeConfig.widthMultiplier),
    width: 17.85 * SizeConfig.widthMultiplier,
    height: 7.38 * SizeConfig.heightMultiplier,
    textStyle: TextStyle(
        color: Colors.black,
        fontFamily: "CoreSansMed",
        fontSize: 2.5* SizeConfig.heightMultiplier),
    decoration: BoxDecoration(
      boxShadow: const [
        BoxShadow(color: Color(0x66D9D9D9))
      ],
      color: Color(0x66D9D9D9),
      borderRadius: BorderRadius.circular(
          0.80 * SizeConfig.heightMultiplier), // Rounded corners
    ),
  );
}
