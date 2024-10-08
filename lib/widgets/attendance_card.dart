import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AttendanceElements extends StatelessWidget {
  final Color shadowColor;
  final Color decorationColor;
  final String mainText;
  final String subText;
  final double height;
  final double width;
  final VoidCallback onPressed;
  final Color maintextColor;
  final Color subtextColor;

  const AttendanceElements({
    Key? key,
    this.shadowColor = const Color(0xff297FBB),
    this.decorationColor = const Color(0xffF1F0FE),
    this.mainText = '08',
    this.subText = 'Early leave',
    this.height = 80,
    this.width = 130,
    this.maintextColor = Colors.blue,
    this.subtextColor = Colors.blueAccent,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: decorationColor,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            offset: Offset(0, -3),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mainText,
              style: GoogleFonts.manrope(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: maintextColor,
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Text(
                  subText,
                  style: GoogleFonts.manrope(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: subtextColor,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: Colors.grey,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
