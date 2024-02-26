import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:klikli/helpers/images.dart';

import 'package:klikli/screens/login_screen/login_screen.dart';
import 'package:klikli/widgets/app_container.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      upperBound: 0.5,
    );
    controller.forward(from: 0);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Get.offAll(() => const LoginScreen(),
            transition: Transition.circularReveal);
      }
    });

    // Listen for the end of the animation
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Center(
        child: ScaleTransition(
          scale: Tween(begin: 0.0, end: 2.0).animate(controller),
          child: RotationTransition(
            turns: Tween(begin: 0.0, end: 2.0).animate(controller),
            child: SizedBox(
              width: 150,
              height: 150,
              child: Image.asset(Images.logo),
            ),
          ),
        ),
      ),
    );
  }
}
