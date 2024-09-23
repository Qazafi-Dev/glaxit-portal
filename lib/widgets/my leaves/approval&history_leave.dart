import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApprovalAndHistory extends StatelessWidget {
  final String? heading;
  final String? description;
  final Color headingTextColor;
  final Color descriptionTextColor;
  final Color containerColor;
  final String? buttonText;
  final String? date;

  final Color? buttonTextColor;

  const ApprovalAndHistory(
      {this.containerColor = Colors.orange,
      this.description = 'N/A',
      this.descriptionTextColor = Colors.grey,
      this.heading = 'N/A',
      this.headingTextColor = Colors.black,
      this.buttonText = 'Approved',
      this.date,
      this.buttonTextColor = Colors.black,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: containerColor,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                heading!,
                style: GoogleFonts.manrope(
                    fontSize: 18,
                    color: Colors.black.withOpacity(0.8),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                description!,
                style: GoogleFonts.manrope(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600),
              ),

              InkWell(
                onTap: () {},

                child: Container(
                  height: MediaQuery.of(context).size.height * .05,
                  width: MediaQuery.of(context).size.width * .35,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: Center(
                    child: Text(
                      buttonText!,
                      style: GoogleFonts.manrope(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Text(
            date!,
            style: GoogleFonts.manrope(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.w400),
          ),


          Padding(
            padding: const EdgeInsets.symmetric( vertical: 10),
            child: Container(
              decoration: DottedDecoration(
                shape: Shape.line,
                linePosition: LinePosition.bottom,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
