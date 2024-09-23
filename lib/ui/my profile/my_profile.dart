import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('My Profile',
            style: GoogleFonts.manrope(fontSize: 20, color: Colors.white)),
        centerTitle: true,
      ),
    );
  }
}
