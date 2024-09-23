import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String svgIconPath;
  final InputDecoration? decoration;
  final bool obscureText;
  final Widget? suffixIcon;

  CustomTextFormField({
    required this.controller,
    required this.hintText,
    required this.svgIconPath,
    this.decoration,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 45.0,
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: (decoration ?? InputDecoration()).copyWith(
            hintText: hintText,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                svgIconPath,
                width: 18.0,
                height: 18.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Color(0xff3880EE), width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
          ),
        ),
      ),
    );
  }
}
