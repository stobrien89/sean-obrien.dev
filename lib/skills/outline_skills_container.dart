import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_v2/skills/skills_view.dart';

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
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color.fromRGBO(240, 121, 99, 1),
          border: Border.all(
            width: 2,
            color: Color.fromRGBO(43, 125, 128, 1),
          ),
          borderRadius: BorderRadius.circular(30)),
      child: AutoSizeText(
        skills.elementAt(parsedIndex),
        style: Theme.of(context)
            .textTheme
            .headline4
            .copyWith(color: Colors.white, fontSize: 22),
        maxLines: 1,
      ),
      alignment: Alignment.center,
    );
  }
}

//
