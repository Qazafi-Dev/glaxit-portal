import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CurrentDateTimeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MMMM d, yyyy, EEEE').format(now);;

    return Column(
      children: [
        Text('$formattedDate', style: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black.withOpacity(0.5)),),

      ],
    );
  }
}