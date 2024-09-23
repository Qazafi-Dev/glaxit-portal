import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:glaxit_portal/widgets/my%20attendance/my_attendance_re_usable.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAttendance extends StatefulWidget {
  const MyAttendance({super.key});

  @override
  State<MyAttendance> createState() => _MyAttendanceState();
}

class _MyAttendanceState extends State<MyAttendance> {
  final List<Map<String, dynamic>> attendanceData = [
    {
      'date': '18',
      'day': 'Thu',
      'clockIn': '09:10',
      'clockOut': '--:--',
      'totalHrs': '--:--',
      'status': 'Absent'
    },
    {
      'date': '19',
      'day': 'Fri',
      'clockIn': '09:00',
      'clockOut': '18:00',
      'totalHrs': '09:00',
      'status': 'Present'
    },
    {
      'date': '20',
      'day': 'Sat',
      'clockIn': '09:15',
      'clockOut': '17:45',
      'totalHrs': '08:30',
      'status': 'Present'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('My Attendance',
            style: GoogleFonts.manrope(fontSize: 20, color: Colors.white)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // First Attendance List
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: attendanceData.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      // The AttendanceCard
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: AttendanceReusableWidget(
                          date: attendanceData[index]['date'],
                          day: attendanceData[index]['day'],
                          clockIn: attendanceData[index]['clockIn'],
                          clockOut: attendanceData[index]['clockOut'],
                          totalHrs: attendanceData[index]['totalHrs'],
                          status: attendanceData[index]['status'],
                        ),
                      ),
                      // Dotted Divider after each row
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          decoration: DottedDecoration(
                            shape: Shape.line,
                            linePosition: LinePosition.bottom,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),

              SizedBox(
               height: 5,
              ),

              // Weekend Off Notice
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color(0xffFAF0F1),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: Text(
                      'Weekend off: 2 September & 3 September',
                      style: GoogleFonts.manrope(fontSize: 16, color: Color(0xffF4AAA4)),
                    ),
                  ),
                ),
              ),

              // Second Attendance List
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: attendanceData.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      // The AttendanceCard
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: AttendanceReusableWidget(
                          date: attendanceData[index]['date'],
                          day: attendanceData[index]['day'],
                          clockIn: attendanceData[index]['clockIn'],
                          clockOut: attendanceData[index]['clockOut'],
                          totalHrs: attendanceData[index]['totalHrs'],
                          status: attendanceData[index]['status'],
                        ),
                      ),

                      // Dotted Divider after each row
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          decoration: DottedDecoration(
                            shape: Shape.line,
                            linePosition: LinePosition.bottom,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),

              SizedBox(
                height: 5,
              ),

              // Another Weekend Off Notice
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color(0xffFAF0F1),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: Text(
                      'Weekend off: 22 September & 23 September',
                      style: GoogleFonts.manrope(fontSize: 16, color: Color(0xffF4AAA4)),
                    ),
                  ),
                ),
              ),

              // Third Attendance List (if needed)
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: attendanceData.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      // The AttendanceCard
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: AttendanceReusableWidget(
                          date: attendanceData[index]['date'],
                          day: attendanceData[index]['day'],
                          clockIn: attendanceData[index]['clockIn'],
                          clockOut: attendanceData[index]['clockOut'],
                          totalHrs: attendanceData[index]['totalHrs'],
                          status: attendanceData[index]['status'],
                        ),
                      ),

                      // Dotted Divider after each row
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          decoration: DottedDecoration(
                            shape: Shape.line,
                            linePosition: LinePosition.bottom,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      )

    );
  }
}
