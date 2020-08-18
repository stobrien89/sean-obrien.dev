import 'package:flutter/material.dart';

import 'package:portfolio_v2/components/desktop_view_builder.dart';
import 'package:portfolio_v2/components/mobile_desktop_view_builder.dart';
import 'package:portfolio_v2/components/mobile_view_builder.dart';

import 'experience_container.dart';

class ExperienceView extends StatelessWidget {
  const ExperienceView({
    Key key,
  }) : super(key: key);

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
      backgroundColor: Color.fromRGBO(91, 121, 171, 1),
      titleText: ExperienceView.title,
      children: [
        SizedBox(height: 50),
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
        ),
        SizedBox(height: 70),
      ],
    );
  }
}

class ExperienceMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileViewBuilder(
      backgroundColor: Color.fromRGBO(91, 121, 171, 1),
      titleText: ExperienceView.title,
      children: [
        Column(
          children: [
            for (final item in experiences)
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: ExperienceContainer(
                  experience: item,
                  index: experiences.indexOf(item),
                ),
              )
          ],
        ),
      ],
    );
  }
}
