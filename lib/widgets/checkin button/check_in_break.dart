import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:glaxit_portal/constant/base_url.dart';
import 'package:glaxit_portal/modals/dash_board.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class CheckInAndBreakWidget extends StatefulWidget {
  @override
  _CheckInAndBreakWidgetState createState() => _CheckInAndBreakWidgetState();
}

class _CheckInAndBreakWidgetState extends State<CheckInAndBreakWidget> {
  bool isCheckedIn = false;
  bool isOnBreak = false;
  Future<List<CheckIn>?> checkIn() async {
    var formDataMap = <String, dynamic>{};
    if (isCheckedIn) {
      formDataMap['break_type'] = 'custome';
      formDataMap['break_detail'] = 'i want a leave';
      formDataMap['em_id'] = '3';
    } else {
      formDataMap['work_from'] = 'office';
      formDataMap['em_id'] = '3';
    }
    print(formDataMap);
    try {
      final response = await http.post(
        Uri.parse(isCheckedIn
            ? '$APP_BASE_URL/add_checkout.php'
            : '$APP_BASE_URL/add_checkin.php'),
        body: formDataMap,
        headers: <String, String>{
          'Accept': 'application/json',
          'authorization': 'Bearer 8605c8a9bcd8914021369a887f164fad',
        },
      );
      final data = jsonDecode(response.body);

      print('ooooooooooooo$data');
    } catch (e) {
      print('Failed to load data');
    }
    return null;
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return Container(
      height: 120,
      width: 120,
      decoration: const BoxDecoration(
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
              checkIn();
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
