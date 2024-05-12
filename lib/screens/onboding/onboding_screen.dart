
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';

import '../../components/animated_btn.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation("active");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              bottom: 200,
              left: 100,
              width: MediaQuery.of(context).size.width * 1.7,
              child: Image.asset("assets/Backgrounds/Spline.png")
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),

            ),
          ),
          const RiveAnimation.asset("assets/RiveAssets/shaped_me.riv"),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
              child: SizedBox(),
            ),
          ),
            SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  const SizedBox(
                    width: 260,
                    child: Column(
                    children: [
                      Text("Work towards brighter future" ,
                      style: TextStyle(
                        fontSize: 60,
                        fontFamily: "Poppins",
                        height: 1.2,
                      ) ,
                      ),
                      SizedBox(height: 16),
                      Text(
                          "Tired of procrastination? Need a boost to accomplish your daily tasks effectively? Say hello to fou-Rs"
                      ),
                    ],
                    ),
                  ),
                  const Spacer(flex: 2),
                  animatedButton(btnAnimationController: _btnAnimationController ,
                  press: (){
                    _btnAnimationController.isActive = true;
                  },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Text("Experience the power of productivity in just four hours"),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

