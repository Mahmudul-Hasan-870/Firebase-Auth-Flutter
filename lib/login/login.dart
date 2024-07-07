import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:plant_shop/widgets/custom_text_field.dart';
import 'package:plant_shop/register/signup.dart';

import '../controller/firebase_controller.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseController firebaseController = Get.put(FirebaseController());

  LoginScreen({super.key});

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
                  "Sign in",
                  style: GoogleFonts.ubuntu(
                    color: const Color(0xFF3f9377),
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    letterSpacing: .5,
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: emailController,
                  hintText: 'Enter your email',
                  icon: IconlyLight.message,
                  type: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: passwordController,
                  isPassword: true,
                  hintText: 'Enter your password',
                  icon: IconlyLight.lock,
                  type: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "Forget Password ?",
                    style: GoogleFonts.ubuntu(
                      color: const Color(0xFF3f9377),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: .5,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3f9377),
                  ),
                  onPressed: () {
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      Get.snackbar(
                        "Error",
                        "All fields are required",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    } else {
                      firebaseController.signIn(
                        emailController.text,
                        passwordController.text,
                      );
                    }
                  },
                  child: Container(
                    width: size.width * .8,
                    padding: const EdgeInsets.all(12),
                    child: Center(
                      child: Text(
                        'Sign in',
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
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: GoogleFonts.ubuntu(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: .5,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(SignupScreen());
                      },
                      child: Text(
                        "Register",
                        style: GoogleFonts.ubuntu(
                          color: const Color(0xFF3f9377),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: .5,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
