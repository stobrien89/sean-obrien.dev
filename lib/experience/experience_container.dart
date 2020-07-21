import 'package:flutter/material.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              experience.company,
              style: _textStyle(isBold: true),
            ),
            SizedBox(height: 10),
            Text(
              experience.timeline,
              style: _textStyle(isGray: true),
            ),
            SizedBox(height: 10),
            for (final item in experience.description)
              Text(
                item,
                style: _textStyle(),
              )
          ],
        ));
  }
}

TextStyle _textStyle({bool isBold, bool isGray}) {
  return TextStyle(
      fontSize: 20,
      height: 1.3,
      fontWeight: isBold ?? false ? FontWeight.bold : FontWeight.normal,
      color: isGray ?? false ? Colors.grey : Colors.black);
}

class ExperienceInfo {
  final String company;
  final String timeline;
  final List<String> description;
  ExperienceInfo({
    @required this.company,
    @required this.timeline,
    @required this.description,
  });
}

final experiences = [
  ExperienceInfo(
      company: 'General Assembly',
      timeline: 'Feburary 2020 - August 2020',
      description: [
        '- Build 23123 projects in Ruby, JavaScript',
        '- Hands-on experience with Web Dev stuff',
        '- led team of 4 developers in group project'
      ]),
  ExperienceInfo(
      company: 'Rover.com',
      timeline: 'August 2017 - April 2020',
      description: ['- Stuff', '- More Stuff', '- Buzzwords']),
  ExperienceInfo(
      company: 'Apple Inc.',
      timeline: 'January 2014 - February 2016',
      description: ['- Stuff', '- Blah Blahs', '- Buzzwords']),
  ExperienceInfo(
      company: 'General Assembly',
      timeline: 'Feburary 2020 - August 2020',
      description: [
        '- Build 23123 projects in Ruby, JavaScript',
        '- Hands-on experience with Web Dev stuff',
        '- led team of 4 developers in group project'
      ]),
];
