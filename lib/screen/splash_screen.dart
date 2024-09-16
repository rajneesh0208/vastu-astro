import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vastu/constants/color_file.dart';

import '../utils/appUtils.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    navigateToNext(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: screenGradient()
        ),
        height: screenHeight(context),
        width: screenWidth(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("asset/animation/astro_animation.json"),
            Text("Vastu-Astro",style: TextStyle(
              color: ColorFile.darkReddishBrown,
              fontSize: screenWidth(context) * 0.08,
              fontWeight: FontWeight.w600,
            ),)
          ],
        ),
      ),
    );
  }

  void navigateToNext(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () async {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    });
  }
}
