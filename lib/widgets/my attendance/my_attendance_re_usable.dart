import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AttendanceReusableWidget extends StatelessWidget {
  final String? date;
  final String? day;
  final String? clockIn;
  final String? clockOut;
  final String? totalHrs;
  final String? status;
  final String? overTime;

  const AttendanceReusableWidget(
      {super.key,
      this.date = 'N/A',
      this.day = 'N/A',
      this.clockIn = '--:--',
      this.clockOut = '--:--',
      this.totalHrs = '--:--',
      this.status = 'N/A',
      this.overTime = 'N/A'});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 80,
            width: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  date ?? 'N/A',
                  style: GoogleFonts.manrope(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                // Text(DateFormat('EE').format(DateTime.now()) ?? 'N/A',
                //     style: GoogleFonts.manrope(color: Colors.grey)),
              ],
            ),
          ),
          Column(
            children: [
              const Icon(Icons.access_time, color: Colors.green),
              Text(clockIn ?? '--:--'),
              Text('Clock in', style: GoogleFonts.manrope(color: Colors.grey)),
            ],
          ),
          Column(
            children: [
              const Icon(Icons.access_time, color: Colors.red),
              Text(clockOut ?? '--:--'),
              Text('Clock out', style: GoogleFonts.manrope(color: Colors.grey)),
            ],
          ),
          Column(
            children: [
              const Icon(Icons.check_circle_outline, color: Colors.blue),
              Text(totalHrs ?? '--:--'),
              Text('Total hrs', style: GoogleFonts.manrope(color: Colors.grey)),
            ],
          ),
          Column(
            children: [
              const Icon(Icons.check_circle_outline_sharp,
                  color: Colors.orange),
              Text(totalHrs ?? '--:--'),
              Text('Overtime', style: GoogleFonts.manrope(color: Colors.grey)),
            ],
          ),
          // Column(
          //   children: [
          //     Text(
          //       status ?? 'N/A',
          //       style: GoogleFonts.manrope(
          //         color: status == 'Absent' ? Colors.red : Colors.green,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //     ElevatedButton(
          //       onPressed: () {},
          //       style: ElevatedButton.styleFrom(
          //         side: BorderSide(color: Colors.blue),
          //         shape: StadiumBorder(),
          //       ),
          //       child: Text(
          //         'Regular',
          //         style: GoogleFonts.manrope(color: Colors.blue),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
