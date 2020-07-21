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
    return DesktopViewBuilder(
      titleText: SkillsView.title,
      children: [
        SizedBox(height: 20),
        for (var rowIndex = 0; rowIndex < skills.length / 4; rowIndex++) ...[
          Row(
            children: [
              for (var i = 0; i < skills.length / 3; i++)
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: i != 0 ? 8.0 : 0),
                    child: OutlineSkillsContainer(i: i, rowIndex: rowIndex),
                  ),
                ),
            ],
          ),
          SizedBox(height: 10),
        ],
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
      titleText: SkillsView.title,
      children: [
        for (var i = 0; i < skills.length; i++) ...[
          OutlineSkillsContainer(
            i: i,
            isMobile: true,
          ),
          SizedBox(height: 10)
        ]
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
