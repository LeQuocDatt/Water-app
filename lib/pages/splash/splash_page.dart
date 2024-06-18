import 'dart:async';

import 'package:dummy_template/values/color.dart';
import 'package:dummy_template/values/images.dart';
import 'package:dummy_template/values/route.dart';
import 'package:dummy_template/widgets/wave.dart';
import 'package:dummy_template/widgets/wave_dots.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  void navigateToHome() {
    Future.delayed(const Duration(milliseconds: 5000), () {
      Navigator.pushNamed(context, onboardingPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlue,
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Image.asset(splashScreen),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.4,
            child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  LiquidLinearProgressIndicator(
                    borderWidth: 0.1,
                    borderColor: lightBlue,
                    value: 0.9,
                    // center: Text('${percentage.toStringAsFixed(0)}ml'),
                    valueColor: const AlwaysStoppedAnimation(sweetBlue),
                    backgroundColor: lightBlue,
                    borderRadius: 12.0,
                    direction: Axis.vertical,
                  ),
                  const Wave(
                    value: 0.8,
                    color: commonBlue,
                  ),
                  const Positioned(
                      bottom: 220,
                      child: WaveDots(color: Colors.white, size: 36)),
                ]),
          )
        ],
      ),
    );
  }
}
