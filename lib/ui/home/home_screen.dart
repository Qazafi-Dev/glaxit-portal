import 'package:flutter/material.dart';
import 'package:glaxit_portal/ui/my%20attendance/my_attendance.dart';
import 'package:glaxit_portal/widgets/attendance_card.dart';
import 'package:glaxit_portal/widgets/checkin%20button/check_in_break.dart';
import 'package:glaxit_portal/widgets/date_day.dart';
import 'package:glaxit_portal/widgets/my%20team%20memebers/my_team_member_card.dart';
import 'package:glaxit_portal/widgets/real_time.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_decoration/dotted_decoration.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFCFDFF),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .3,
                    color: Color(0xff2F80EC),
            child: Container(
              child: Row(
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(bottom: 50, left: 20),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                          'assets/images/profile image.jpg'),
                      minRadius: 20,
                      maxRadius: 30,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mr. Amir',
                          style: GoogleFonts.manrope(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withOpacity(.8)),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text('Mark Your Attendance!',
                            style: GoogleFonts.manrope(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white))
                      ],
                    ),
                  )
                ],
              ),
            )),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 140),
                    height: 320,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                        color: Colors.white,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 7,
                            ),
                            GoogleFontRealTimeWidget(
                              fontSize: 30.0,
                              textColor: Colors.black.withOpacity(0.8),
                              fontFamily: 'Manrope',
                              isBold: true,
                            ),
                            CurrentDateTimeWidget(),
                            SizedBox(
                              height: 7,
                            ),

                            CheckInAndBreakWidget(),
                            // Container(
                            //   height: 120,
                            //   width: 120,
                            //   decoration: BoxDecoration(
                            //     gradient: LinearGradient(
                            //       colors: [ Colors.blue,Color(0xffE03174),],
                            //       begin: Alignment.topLeft,
                            //       end: Alignment.bottomRight,
                            //     ),
                            //     shape: BoxShape.circle,
                            //
                            //   ),
                            //   child: Center(
                            //     child: Column(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       children: [
                            //         ClipOval(
                            //           child: Image.asset(
                            //             'assets/icons/click icon.png',
                            //             width: 60,
                            //             height: 60,
                            //             fit: BoxFit.cover,
                            //           ),
                            //         ),
                            //         Text(
                            //           'Check In',
                            //           style: GoogleFonts.manrope(
                            //               fontSize: 16,
                            //               fontWeight: FontWeight.w500,
                            //               color: Colors.white),
                            //         )
                            //       ],
                            //     ),
                            //   ),
                            // ),


                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 15),
                              child: Container(
                                decoration: DottedDecoration(
                                    shape: Shape.line,
                                    linePosition: LinePosition.bottom),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                          child: Icon(
                                            Icons.watch_later_outlined,
                                            size: 30,
                                          )),
                                      Text(
                                        'Check In',
                                        style: GoogleFonts.manrope(
                                            fontSize: 16,
                                            color:
                                            Colors.black.withOpacity(.7)),
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    children: [
                                      Container(
                                          child: Icon(
                                            Icons.watch_later_outlined,
                                            size: 30,
                                          )),
                                      Text(
                                        'Check Out',
                                        style: GoogleFonts.manrope(
                                            fontSize: 16,
                                            color:
                                            Colors.black.withOpacity(.7)),
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    children: [
                                      Container(
                                          child: Icon(
                                            Icons.watch_later_outlined,
                                            size: 30,
                                          )),
                                      Text(
                                        'Total Hour',
                                        style: GoogleFonts.manrope(
                                            fontSize: 16,
                                            color:
                                            Colors.black.withOpacity(.7)),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 320,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => MyAttendance()));
                              },
                              child: Text('Attendance', style: GoogleFonts.manrope(fontWeight: FontWeight.w700, fontSize: 20, color: Colors.black.withOpacity(0.7)),)),
                          Text('Current Month', style: GoogleFonts.manrope(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black.withOpacity(0.5)),),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AttendanceElements(onPressed: () {}),
                              AttendanceElements(
                                onPressed: () {},
                                mainText: '05',
                                subText: 'Absents',
                                decorationColor: Color(0xffF2F2F2),
                                shadowColor: Color(0xff6D5CE7),
                                maintextColor: Colors.deepPurple,
                                subtextColor: Colors.purple,
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AttendanceElements(onPressed: () {},mainText: '03',
                                  subText: 'Late In',
                                  decorationColor: Color(0xffFFECED),
                                  shadowColor: Color(0xffF10E0C),
                                  maintextColor: Color(0xffEF332A),
                                  subtextColor: Color(0xffF65E62)),
                              AttendanceElements(
                                onPressed: () {},
                                mainText: '05',
                                subText: 'Total leaves',
                                decorationColor: Color(0xffFDF0DF),
                                shadowColor: Color(0xffCD7513),
                                maintextColor: Color(0xffC59056),
                                subtextColor: Color(0xffC59056),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              MyTeamMemberCard(),
            ],
          ),
        ));
  }
}
