import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movieui/pages/home_pages.dart';
import 'package:movieui/pages/profile_page.dart';
import 'package:movieui/pages/profile_piture.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 1500,
        ));
    _animation = CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceOut,
        reverseCurve: Curves.bounceInOut);
    _animationController.forward();
    Timer(
        Duration(milliseconds: 2500),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            )));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: ScaleTransition(
            scale: _animation,
            child: Image.asset(
              "lib/img/mianlogo.png",
              color: Colors.white,
              width: 250,
            ),
          ),
        ),
      ),
    );
  }
}
