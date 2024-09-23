import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final FontWeight? fontWeight;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * .05,
        width: MediaQuery.of(context).size.width * .35,
        decoration: BoxDecoration(
          color: Color(0xff3880EE),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.manrope(
                color: Colors.white,
                fontSize: 19,
                fontWeight: fontWeight ?? FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
