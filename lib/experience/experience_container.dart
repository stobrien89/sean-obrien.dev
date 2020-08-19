import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_v2/utils/colors.dart';

class ExperienceContainer extends StatelessWidget {
  const ExperienceContainer({
    Key key,
    @required this.experience,
    @required this.index,
  }) : super(key: key);

  final ExperienceInfo experience;
  final int index;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isSmall = width < 900;
    final colors = ColorAssets.all;
    return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            color: colors.elementAt(index % colors.length),
          ),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              experience.logo,
              height: isSmall ?? false ? 100 : 200,
            ),
            Padding(
              padding: isSmall ?? false
                  ? const EdgeInsets.only(left: 25)
                  : const EdgeInsets.only(left: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    experience.company,
                    style: GoogleFonts.oswald(
                      fontSize: isSmall ? 20 : 24,
                    ),
                  ),
                  Text(
                    experience.position,
                    style: GoogleFonts.roboto(
                      fontSize: isSmall ? 18 : 22,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    experience.timeline,
                    style: GoogleFonts.roboto(
                        color: Colors.grey,
                        fontSize: isSmall ? 16 : 20,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(height: 10),
                  for (final item in experience.description)
                    AutoSizeText(
                      item,
                      maxLines: 1,
                      style: GoogleFonts.openSans(
                        fontSize: isSmall ? 14 : 18,
                      ),
                    )
                ],
              ),
            ),
          ],
        ));
  }
}

TextStyle textStyle({bool isBold, bool isGray}) {
  return TextStyle(
      fontSize: 20,
      height: 1.3,
      fontWeight: isBold ?? false ? FontWeight.bold : FontWeight.normal,
      color: isGray ?? false ? Colors.grey : Colors.black);
}

class ExperienceInfo {
  final String logo;
  final String company;
  final String position;
  final String timeline;
  final List<String> description;
  ExperienceInfo({
    @required this.logo,
    @required this.company,
    @required this.position,
    @required this.timeline,
    @required this.description,
  });
}

final experiences = [
  ExperienceInfo(
      logo: 'lib/assets/images/ga.png',
      company: 'General Assembly',
      position: 'Software Engineering Immersive Program',
      timeline: 'Feburary 2020 - August 2020',
      description: [
        '- Comprehensive 20 week program focused on full-stack web development',
        '- Spent each day writing programs in JavaScript and Ruby',
        '- Led team of 4 developers in group project'
      ]),
  ExperienceInfo(
      logo: 'lib/assets/images/rover.png',
      company: 'Rover.com',
      position: 'Senior Incident Management Specialist',
      timeline: 'August 2017 - April 2020',
      description: [
        '- Investigated matters related to safety of users and pets',
        '- Onboarded and trained new team members',
        '- Compiled metrics dashboards using Python and SQL',
        '- Authored and implemented team process improvements'
      ]),
  ExperienceInfo(
      logo: 'lib/assets/images/alfa.png',
      company: 'Alfa Insurance Company',
      position: 'Liability Adjuster',
      timeline: 'Feburary 2020 - August 2020',
      description: [
        '- Investigated claims, determined liability',
        '- Reviewed documentation for fraud and accuracy',
        '- Negotiated settlements and releases'
      ]),
  ExperienceInfo(
      logo: 'lib/assets/images/apple.png',
      company: 'Apple Inc.',
      position: 'Senior Advisor',
      timeline: 'January 2014 - February 2016',
      description: [
        '- Provided advanced technical support for iOS and Mac users',
        '- Partnered with legal and safety departments for emerging hardware issues',
        '- Trained and onboarded new team members'
      ]),
];
