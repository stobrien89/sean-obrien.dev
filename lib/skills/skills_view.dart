import 'package:flutter/material.dart';
import 'package:portfolio_v2/components/desktop_view_builder.dart';
import 'package:portfolio_v2/components/mobile_desktop_view_builder.dart';
import 'package:portfolio_v2/components/mobile_view_builder.dart';
import 'package:portfolio_v2/skills/outline_skills_container.dart';

class SkillsView extends StatelessWidget {
  const SkillsView({
    Key key,
  }) : super(key: key);

  static const title = 'Skills';
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return MobileDesktopViewBuilder(
      desktopView: SkillsDesktopView(),
      mobileView: SkillsMobileView(),
      showMobile: width < 812,
    );
  }
}

class SkillsDesktopView extends StatelessWidget {
  const SkillsDesktopView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isSmall = width < 1100;
    final imageWidth = width * .30;
    return DesktopViewBuilder(
      backgroundColor: Color.fromRGBO(46, 184, 155, 1),
      titleText: SkillsView.title,
      children: [
        SizedBox(height: 70),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.asset(
                  'lib/assets/images/engineer.png',
                  height: isSmall ? imageWidth : 500,
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Column(
                  children: [
                    Text('This is some stuff Im good at'),
                    Text('I love learning new technologies'),
                    SizedBox(
                      height: 50,
                    ),
                    for (var rowIndex = 0;
                        rowIndex < skills.length / 4;
                        rowIndex++) ...[
                      Row(
                        children: [
                          for (var i = 0; i < skills.length / 3; i++)
                            Expanded(
                              // width: 120,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: i != 0 ? 12.0 : 0),
                                child: OutlineSkillsContainer(
                                    i: i, rowIndex: rowIndex),
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 70),
      ],
    );
  }
}

class SkillsMobileView extends StatelessWidget {
  const SkillsMobileView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MobileViewBuilder(
      backgroundColor: Color.fromRGBO(46, 184, 155, 1),
      titleText: SkillsView.title,
      children: [
        Image.asset('lib/assets/images/engineer.png'),
        Text('This is some stuff Im good at'),
        Text('I love learning new technologies'),
        SizedBox(
          height: 50,
        ),
        for (var i = 0; i < skills.length; i++) ...[
          OutlineSkillsContainer(
            i: i,
            isMobile: true,
          ),
          SizedBox(height: 10)
        ],
        SizedBox(height: 50)
      ],
    );
  }
}

final skills = [
  'JavaScript',
  'Ruby',
  'Python',
  'Dart',
  'NodeJS',
  'React',
  'Rails',
  'Flutter',
  'Agile',
  'Scrum',
  'SQL',
  'NoSQL',
];
