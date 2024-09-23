import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; // Add this import for DateFormat

class GoogleFontRealTimeWidget extends StatefulWidget {
  final double fontSize;
  final Color textColor;
  final String fontFamily;
  final bool isBold;

  GoogleFontRealTimeWidget({
    this.fontSize = 24.0,
    this.textColor = Colors.black,
    this.fontFamily = 'Poppins',
    this.isBold = false,
  });

  @override
  _GoogleFontRealTimeWidgetState createState() => _GoogleFontRealTimeWidgetState();
}

class _GoogleFontRealTimeWidgetState extends State<GoogleFontRealTimeWidget> {
  String _timeString = '';
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timeString = _formatDateTime(DateTime.now());
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm a').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _timeString,
      style: GoogleFonts.getFont(
        widget.fontFamily,
        textStyle: TextStyle(
          fontSize: widget.fontSize,
          color: widget.textColor,
          fontWeight: widget.isBold ? FontWeight.bold : FontWeight.normal,

        ),
      ),
    );
  }
}