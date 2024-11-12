import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class SplashController extends GetxController with SingleGetTickerProviderMixin {
  late AnimationController animationController;
  late Animation<double> scaleAnimation;

  @override
  void onInit() {
    super.onInit();

    // Initialize the AnimationController and Tween Animation
    animationController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );

    // Define a Tween that animates between scale values
    scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );

    // Add a listener to repeat the animation in reverse
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });

    // Start the animation
    animationController.forward();
  }

  @override
  void onClose() {
    // Dispose of the AnimationController to free up resources
    animationController.dispose();
    super.onClose();
  }
}
