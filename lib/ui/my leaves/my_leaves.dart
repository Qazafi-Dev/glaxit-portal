import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:glaxit_portal/widgets/my leaves/approval&history_leave.dart';
import 'package:glaxit_portal/widgets/my leaves/leave_balance_chart.dart';

class MyLeaves extends StatefulWidget {
  @override
  _MyLeavesState createState() => _MyLeavesState();
}

class _MyLeavesState extends State<MyLeaves> {
  bool showApprovals = true;

  final List<Map<String, dynamic>> leaveData = [
    {
      'heading': 'Casual Leave',
      'description': 'Applied from 23 Sep',
      'date': '12 Mar, 2024'
    },
    {
      'heading': 'Medical Leave',
      'description': 'Applied from 23 Aug',
      'date': '05 Aug, 2024'
    },
    {
      'heading': 'Sick Leave',
      'description': 'Applied from 12 Sep',
      'date': '25 Sep, 2024'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCFDFF),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('My Leaves',
            style: GoogleFonts.manrope(fontSize: 20, color: Colors.white)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            //chart code
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 360,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  color: Colors.white,
                  child: Column(
                    children: [
                      //calling leave balance chart
                      LeaveBalanceChart(
                        centerText: '07',
                        usedLeaveColor: Colors.blue,
                        remainingLeaveColor: Colors.grey[300]!,
                        subtitleText: 'Leave Balance',
                        centerTextSize: 30,
                        centerTextColor: Colors.black.withOpacity(0.8),
                        textColor: Colors.black.withOpacity(0.7),
                        totalLeaveText: 'Total Leave',
                        usedLeaveText: 'Used Leave',
                      ),
                      SizedBox(height: 25),
                      // Three small pieCharts
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                LeaveBalanceChart(
                                  size: 50,
                                  centerText: '5',
                                  centerTextSize: 18,
                                  usedLeaveColor: Colors.orange,
                                  centerTextColor: Colors.black.withOpacity(0.8),
                                ),
                                Text(
                                  'Medical Leave',
                                  style: GoogleFonts.manrope(
                                    fontSize: 15,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                LeaveBalanceChart(
                                  size: 50,
                                  centerText: '10',
                                  centerTextSize: 18,
                                  usedLeaveColor: Colors.brown,
                                  centerTextColor: Colors.black.withOpacity(0.8),
                                ),
                                Text(
                                  'Casual Leave',
                                  style: GoogleFonts.manrope(
                                    fontSize: 15,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                LeaveBalanceChart(
                                  size: 50,
                                  centerText: '9',
                                  centerTextSize: 18,
                                  usedLeaveColor: Colors.purple,
                                  centerTextColor: Colors.black.withOpacity(0.8),
                                ),
                                Text(
                                  'Sick Leave',
                                  style: GoogleFonts.manrope(
                                    fontSize: 15,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildToggleButton('Approvals', showApprovals, () {
                    setState(() => showApprovals = true);
                  }),
                  _buildToggleButton('Leave History', !showApprovals, () {
                    setState(() => showApprovals = false);
                  }),
                ],
              ),
            ),

            SizedBox(height: 20),

            Expanded(
              child: showApprovals
                  ? ListView.builder(
                itemCount: leaveData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child:
                    //calling approval&history leaves file
                    ApprovalAndHistory(
                      heading: leaveData[index]['heading'],
                      description: leaveData[index]['description'],
                      date: leaveData[index]['date'],
                    ),
                  );
                },
              )
                  : Center(
                child: Text(
                  'NO HISTORY YET',
                  style: GoogleFonts.manrope(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),

            SizedBox(height: 10,),
            //this is the button for applying leave
            InkWell(
              onTap: (){},
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  gradient: LinearGradient(
                    colors: [Color(0xff3F80EF), Color(0xffB287E6)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.watch_later_outlined, color: Colors.white, size: 24),
                      SizedBox(width: 5),
                      Text(
                        'Click to apply for leave',
                        style: GoogleFonts.manrope(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


//this is for controlling approvals and leave history button
  Widget _buildToggleButton(String text, bool isActive, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isActive ? Colors.blue : Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        text,
        style: GoogleFonts.manrope(
          color: isActive ? Colors.white : Colors.black.withOpacity(0.5),
          fontWeight: FontWeight.w600,
          fontSize: 16
        ),
      ),
    );
  }
}