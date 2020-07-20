import 'package:flutter/material.dart';

import 'package:portfolio_v2/components/desktop_view_builder.dart';
import 'package:portfolio_v2/components/mobile_desktop_view_builder.dart';
import 'package:portfolio_v2/components/mobile_view_builder.dart';
import 'package:portfolio_v2/skills/skills_view.dart';

class ExperienceView extends StatelessWidget {
  static const title = 'Experience';
  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
      desktopView: ExperienceDesktopView(),
      mobileView: ExperienceMobileView(),
    );
  }
}

class ExperienceDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DesktopViewBuilder(
      titleText: ExperienceView.title,
      children: [
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var rowIndex = 0;
                rowIndex < experiences.length / 2;
                rowIndex++)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (var index = 0; index < experiences.length / 2; index++)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ExperienceContainer(
                          experience:
                              experiences.elementAt(rowIndex * 2 + index),
                          index: rowIndex * 2 + index,
                        ),
                      ),
                  ],
                ),
              ),
          ],
        )
      ],
    );
  }
}

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
            color: colors.elementAt( % colors.length),
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
            Text(
              experience.timeline,
              style: _textStyle(),
            ),
            for (final item in experience.description)
              Text(
                item,
                style: _textStyle(),
              )
          ],
        ));
  }
}

TextStyle _textStyle({bool isBold}) {
  return TextStyle(
      fontSize: 20,
      height: 1.3,
      fontWeight: isBold ?? false ? FontWeight.bold : FontWeight.normal);
}

class ExperienceMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileViewBuilder(
      titleText: ExperienceView.title,
      children: [],
    );
  }
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
