import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:plant_shop/controller/auth_controller.dart';

import '../controller/firebase_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseController firebaseController = Get.find<FirebaseController>();
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            IconlyLight.category,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              IconlyLight.notification,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () async {
              await authController.logout();
            },
            icon: const Icon(
              IconlyLight.logout,
              color: Colors.white,
            ),
          ),
        ],
        title: Text(
          'Home',
          style: GoogleFonts.ubuntu(
              color: Colors.white,
              letterSpacing: .5,
              fontWeight: FontWeight.w600),
        ),
        backgroundColor: const Color(0xFF3f9377),
      ),
      body: Center(
        child: Obx(() {
          final user = firebaseController.userData.value;
          return Text(
            'Welcome, ${user['name']}',
            style: GoogleFonts.ubuntu(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF3f9377),
            ),
          );
        }),
      ),
    );
  }
}
