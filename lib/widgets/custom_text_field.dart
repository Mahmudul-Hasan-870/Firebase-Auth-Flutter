import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:plant_shop/widgets/custom_text_field.dart'; // Ensure this import path is correct

class CustomTextField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final TextInputType type;
  final bool isPassword;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.type,
    this.isPassword = false,
    required this.controller,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: widget.type,
      obscureText: widget.isPassword ? _isObscured : false,
      decoration: InputDecoration(
        prefixIcon: Icon(
          widget.icon,
          color: const Color(0xFF3f9377),
        ),
        hintText: widget.hintText,
        hintStyle: GoogleFonts.ubuntu(), // Set the font style for the hint text
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Color(0xFF3f9377),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            width: 2,
            color: Color(0xFF3f9377),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            width: 2,
            color: Color(0xFF3f9377),
          ),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            _isObscured ? IconlyLight.hide : IconlyLight.show,
            color: const Color(0xFF3f9377),
          ),
          onPressed: () {
            setState(() {
              _isObscured = !_isObscured;
            });
          },
        )
            : null,
      ),
      style: GoogleFonts.ubuntu(), // Set the font style for the text input
    );
  }
}
