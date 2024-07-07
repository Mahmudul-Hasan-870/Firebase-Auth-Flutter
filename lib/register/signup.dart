import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import '../controller/firebase_controller.dart';
import '../widgets/custom_text_field.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseController firebaseController = Get.put(FirebaseController());

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
          child: Center(
            child: Column(
              children: [
                Text(
                  "Sign up",
                  style: GoogleFonts.ubuntu(
                    color: const Color(0xFF3f9377),
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    letterSpacing: .5,
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hintText: 'Enter your name',
                  icon: IconlyLight.profile,
                  type: TextInputType.name,
                  controller: nameController,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hintText: 'Enter your email',
                  icon: IconlyLight.message,
                  type: TextInputType.emailAddress,
                  controller: emailController,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  isPassword: true,
                  hintText: 'Enter your password',
                  icon: IconlyLight.lock,
                  type: TextInputType.visiblePassword,
                  controller: passwordController,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3f9377),
                  ),
                  onPressed: () {
                    if (nameController.text.isEmpty ||
                        emailController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      Get.snackbar(
                        "Error",
                        "All fields are required",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    } else {
                      firebaseController.signUp(nameController.text,
                          emailController.text, passwordController.text);
                    }
                  },
                  child: Container(
                    width: size.width * .8,
                    padding: const EdgeInsets.all(12),
                    child: Center(
                      child: Text(
                        'Sign up',
                        style: GoogleFonts.ubuntu(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          letterSpacing: .5,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
