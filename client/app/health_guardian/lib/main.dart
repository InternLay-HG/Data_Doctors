import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_guardian/screens/dashboard/dashboard_screen.dart';
import 'package:health_guardian/screens/splash/splash_screen.dart';
import 'package:health_guardian/styling/sizeConfig.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
 // runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));
 runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        SizeConfig().init(constraints);
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Health Guardian",
            home: SplashScreen()
            );
      },
    );
  }
}
