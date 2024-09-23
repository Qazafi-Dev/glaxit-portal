import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:glaxit_portal/ui/my%20leaves/my_leaves.dart';
import 'package:glaxit_portal/widgets/my%20team%20memebers/overlapping_images.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTeamMemberCard extends StatelessWidget {
  const MyTeamMemberCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyLeaves()));
                          },
                          child: Text(
                            'My Team Members',
                            style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Colors.black.withOpacity(0.7)),
                          ),
                        ),
                        Text(
                          'Attendance',
                          style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.black.withOpacity(0.5)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            child: Text(
                              'VIEW ALL',
                              style: GoogleFonts.manrope(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container( // this is dotted circle
                              height: 120,
                              width: 120,
                              decoration: DottedDecoration(
                                shape: Shape.circle,
                                color: Colors.grey,
                                strokeWidth: 1,
                                dash: <int>[3, 3],
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                '19', // First part of the text
                                            style: GoogleFonts.manrope(
                                              fontSize: 36,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                '/31', // Second part of the text
                                            style: GoogleFonts.manrope(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      'Check in',
                                      style: GoogleFonts.manrope(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),


                            Spacer(),

                            //this is for showing overlapped images
                            Align(
                              alignment: Alignment.topRight,
                              child: OverlappingCircularImages(
                                //calling averlapping image fie
                                imageUrls: [
                                  'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                                  'https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                                  'https://images.pexels.com/photos/1547971/pexels-photo-1547971.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                                ],
                                size: 50,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )))));
  }
}
