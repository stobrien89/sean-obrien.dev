import 'package:flutter/material.dart';
import 'package:portfolio_v2/skills/skills_view.dart';
import 'package:portfolio_v2/utils/colors.dart';

class OutlineSkillsContainer extends StatelessWidget {
  const OutlineSkillsContainer({
    Key key,
    @required this.i,
    this.rowIndex,
    this.isMobile,
  }) : super(key: key);

  final int i;
  final int rowIndex;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final parsedIndex = isMobile ?? false ? i : (i * 3) + rowIndex;
    final colors = ColorAssets.all;
    return Container(
      width: isMobile ?? false ? double.infinity : null,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: colors.elementAt(i % colors.length),
          border:
              Border.all(width: 3, color: colors.elementAt(i % colors.length)),
          borderRadius: BorderRadius.circular(15)),
      child: Text(skills.elementAt(parsedIndex),
          style: Theme.of(context).textTheme.headline4),
    );
  }
}

class SkillsMobileView extends StatelessWidget {
  const SkillsMobileView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(thickness: 3),
            SizedBox(height: 50),
            Text(
              'Skills',
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(height: 50),
            for (var i = 0; i < skills.length; i++) ...[
              OutlineSkillsContainer(
                i: i,
                isMobile: true,
              ),
              SizedBox(height: 10)
            ]
          ],
        ));
  }
}
