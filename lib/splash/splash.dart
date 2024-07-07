import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_shop/home/home.dart';
import 'package:plant_shop/login/login.dart';
import '../controller/auth_controller.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      if (authController.isLoggedIn.value) {
        Get.offAll(() => const HomeScreen());
      } else {
        Get.offAll(() => LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF7bc089), Color(0xFF3f9377)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/plant.png',
                width: 300,
                height: 300,
              ),
              Text(
                "Farm City",
                style: GoogleFonts.ubuntu(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                    letterSpacing: .5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
