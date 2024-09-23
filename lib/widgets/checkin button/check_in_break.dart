import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckInAndBreakWidget extends StatefulWidget {
  @override
  _CheckInAndBreakWidgetState createState() => _CheckInAndBreakWidgetState();
}

class _CheckInAndBreakWidgetState extends State<CheckInAndBreakWidget> {
  bool isCheckedIn = false;
  bool isOnBreak = false;

  Widget _buildButton(String text, VoidCallback onPressed) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Color(0xffE03174)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        shape: BoxShape.circle,
      ),
      child: InkWell(
        onTap: onPressed,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/icons/click icon.png',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                text,
                style: GoogleFonts.manrope(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 150,
        enableInfiniteScroll: false,
        viewportFraction: 1,
      ),
      items: [
        _buildButton(
          isCheckedIn ? 'Check Out' : 'Check In',
              () {
            setState(() {
              isCheckedIn = !isCheckedIn;
            });
          },
        ),
        _buildButton(
          isOnBreak ? 'Break End' : 'Break Start',
              () {
            setState(() {
              isOnBreak = !isOnBreak;
            });
          },
        ),
      ],
    );
  }
}