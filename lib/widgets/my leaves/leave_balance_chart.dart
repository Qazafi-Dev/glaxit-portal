import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

class LeaveBalanceChart extends StatelessWidget {
  final int totalLeave;
  final int usedLeave;
  final double? size;
  final Color? usedLeaveColor;
  final Color remainingLeaveColor;
  final Color textColor;
  final String? centerText;
  final double? centerTextSize;
  final Color? centerTextColor;
  final String? subtitleText;
  final String? totalLeaveText;
  final String? usedLeaveText;

  const LeaveBalanceChart({
    Key? key,
    this.totalLeave = 22,
    this.usedLeave = 15,
    this.size = 170,
    this.usedLeaveColor,
    this.remainingLeaveColor = const Color(0xFFE0E0E0),
    this.textColor = Colors.black,
    this.centerText,
    this.centerTextSize,
    this.centerTextColor,
    this.subtitleText,
    this.totalLeaveText,
    this.usedLeaveText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final remainingLeave = totalLeave - usedLeave;
    final Color actualUsedLeaveColor = usedLeaveColor ?? Colors.purple;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: size,
          width: size,
          child: Stack(
            children: [
              //pieChart section
              PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      color: actualUsedLeaveColor,
                      value: usedLeave.toDouble(),
                      title: '',
                      radius: size! * 0.1,
                    ),
                    PieChartSectionData(
                      color: remainingLeaveColor,
                      value: remainingLeave.toDouble(),
                      title: '',
                      radius: size! * 0.1,
                    ),
                  ],
                  sectionsSpace: 0,
                  centerSpaceRadius: size! * 0.3,
                  startDegreeOffset: -90,
                ),
              ),

              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (centerText != null)
                      Text(
                        centerText!,
                        style: GoogleFonts.manrope(
                          fontSize: centerTextSize ?? size! * 0.1,
                          fontWeight: FontWeight.bold,
                          color: centerTextColor ?? textColor,
                        ),
                      ),
                    if (subtitleText != null)
                      Text(
                        subtitleText!,
                        style:
                            TextStyle(fontSize: size! * 0.08, color: textColor),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: size! * 0.1),

        //this is for handling total leave & used leave
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (totalLeaveText != null)
                TotalLeaveUsedLeave(
                  color: remainingLeaveColor,
                  label: totalLeaveText!,
                  value: totalLeave,
                  textColor: textColor,
                ),
              if (usedLeaveText != null)
                TotalLeaveUsedLeave(
                  color: actualUsedLeaveColor,
                  label: usedLeaveText!,
                  value: usedLeave,
                  textColor: textColor,
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class TotalLeaveUsedLeave extends StatelessWidget {
  final Color color;
  final String label;
  final int value;
  final Color textColor;

  const TotalLeaveUsedLeave({
    Key? key,
    required this.color,
    required this.label,
    required this.value,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
            ),
            SizedBox(width: 6),
            Text(label,
                style: GoogleFonts.manrope(
                    color: textColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w500)),
          ],
        ),
        SizedBox(height: 4),
        Text(
          value.toString(),
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ],
    );
  }
}
