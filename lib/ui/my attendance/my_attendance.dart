import 'dart:convert';

import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:glaxit_portal/constant/base_url.dart';
import 'package:glaxit_portal/modals/attendence.dart';
import 'package:glaxit_portal/widgets/my%20attendance/my_attendance_re_usable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class MyAttendance extends StatefulWidget {
  const MyAttendance({super.key});

  @override
  State<MyAttendance> createState() => _MyAttendanceState();
}

class _MyAttendanceState extends State<MyAttendance> {
  bool isLoading = false;
  var attendenceList = {};
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
  void initState() {
    super.initState();
    getAttendence();
  }

  Future<List<AttendenceData>?> getAttendence() async {
    isLoading = true;
    var formDataMap = <String, dynamic>{};
    formDataMap['user_type'] = 'employee';
    formDataMap['em_id'] = '3';
    try {
      final response = await http.post(
        Uri.parse(
            '$APP_BASE_URL/user_attendence.php?user_type=employee&em_id=3'),
        headers: <String, String>{
          'Accept': 'application/json',
          'authorization': 'Bearer 8605c8a9bcd8914021369a887f164fad',
        },
      );
      if (response?.statusCode == 200) {
        var body = jsonDecode(response.body);
        attendenceList = body;
      }
    } catch (e) {
      throw Exception('fail to load data');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text('My Attendance',
                  style:
                      GoogleFonts.manrope(fontSize: 20, color: Colors.white)),
              centerTitle: true,
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // First Attendance List
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: attendenceList['data'].length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            // The AttendanceCard
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: index == 0
                                  ? Container(
                                      height: 30,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: const BoxDecoration(
                                          color: Color(0xffFAF0F1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Center(
                                        child: Text(
                                          attendenceList['data'][index]
                                                  ['month_header']['month'] +
                                              '-' +
                                              attendenceList['data'][index]
                                                  ['month_header']['year'],
                                          style: GoogleFonts.manrope(
                                              fontSize: 16,
                                              color: const Color(0xffF4AAA4)),
                                        ),
                                      ),
                                    )
                                  : AttendanceReusableWidget(
                                      date: attendenceList['data'][index]
                                              ['date']
                                          .split(' ')[1]
                                          .split('-')[0],
                                      day: attendenceList['data'][index]['day'],
                                      clockIn: attendenceList['data'][index]
                                          ['checkin'],
                                      clockOut: attendenceList['data'][index]
                                          ['checkout'],
                                      totalHrs: attendenceList['data'][index]
                                          ['completed_hours'],
                                      overTime: attendenceList['data'][index]
                                              ['overtime']
                                          .toString(),
                                    ),
                            ),
                            // Dotted Divider after each row
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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

                    const SizedBox(
                      height: 5,
                    ),

                    // Weekend Off Notice
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 10),
                    //   child: Container(
                    //     height: 30,
                    //     width: MediaQuery.of(context).size.width,
                    //     decoration: const BoxDecoration(
                    //         color: Color(0xffFAF0F1),
                    //         borderRadius:
                    //             BorderRadius.all(Radius.circular(10))),
                    //     child: Center(
                    //       child: Text(
                    //         'Weekend off: 2 September & 3 September',
                    //         style: GoogleFonts.manrope(
                    //             fontSize: 16, color: const Color(0xffF4AAA4)),
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    // Second Attendance List
                    // ListView.builder(
                    //   shrinkWrap: true,
                    //   physics: const NeverScrollableScrollPhysics(),
                    //   itemCount: attendanceData.length,
                    //   itemBuilder: (context, index) {
                    //     return Column(
                    //       children: [
                    //         // The AttendanceCard
                    //         Padding(
                    //           padding: const EdgeInsets.symmetric(
                    //               horizontal: 20, vertical: 10),
                    //           child: AttendanceReusableWidget(
                    //             date: attendanceData[index]['date'],
                    //             day: attendanceData[index]['day'],
                    //             clockIn: attendanceData[index]['clockIn'],
                    //             clockOut: attendanceData[index]['clockOut'],
                    //             totalHrs: attendanceData[index]['totalHrs'],
                    //             status: attendanceData[index]['status'],
                    //           ),
                    //         ),

                    //         // Dotted Divider after each row
                    //         Padding(
                    //           padding:
                    //               const EdgeInsets.symmetric(horizontal: 10),
                    //           child: Container(
                    //             decoration: DottedDecoration(
                    //               shape: Shape.line,
                    //               linePosition: LinePosition.bottom,
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     );
                    //   },
                    // ),

                    const SizedBox(
                      height: 5,
                    ),

                    // Another Weekend Off Notice
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 10),
                    //   child: Container(
                    //     height: 30,
                    //     width: MediaQuery.of(context).size.width,
                    //     decoration: const BoxDecoration(
                    //         color: Color(0xffFAF0F1),
                    //         borderRadius:
                    //             BorderRadius.all(Radius.circular(10))),
                    //     child: Center(
                    //       child: Text(
                    //         'Weekend off: 22 September & 23 September',
                    //         style: GoogleFonts.manrope(
                    //             fontSize: 16, color: const Color(0xffF4AAA4)),
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    // Third Attendance List (if needed)
                    // ListView.builder(
                    //   shrinkWrap: true,
                    //   physics: const NeverScrollableScrollPhysics(),
                    //   itemCount: attendanceData.length,
                    //   itemBuilder: (context, index) {
                    //     return Column(
                    //       children: [
                    //         // The AttendanceCard
                    //         Padding(
                    //           padding: const EdgeInsets.symmetric(
                    //               horizontal: 20, vertical: 10),
                    //           child: AttendanceReusableWidget(
                    //             date: attendanceData[index]['date'],
                    //             day: attendanceData[index]['day'],
                    //             clockIn: attendanceData[index]['clockIn'],
                    //             clockOut: attendanceData[index]['clockOut'],
                    //             totalHrs: attendanceData[index]['totalHrs'],
                    //             status: attendanceData[index]['status'],
                    //           ),
                    //         ),

                    //         // Dotted Divider after each row
                    //         Padding(
                    //           padding:
                    //               const EdgeInsets.symmetric(horizontal: 10),
                    //           child: Container(
                    //             decoration: DottedDecoration(
                    //               shape: Shape.line,
                    //               linePosition: LinePosition.bottom,
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     );
                    //   },
                    // ),
                  ],
                ),
              ),
            ));
  }
}
