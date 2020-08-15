import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_v2/components/desktop_view_builder.dart';
import 'package:portfolio_v2/components/mobile_desktop_view_builder.dart';
import 'package:portfolio_v2/components/mobile_view_builder.dart';
import 'package:portfolio_v2/projects/project_item_body.dart';

class ProjectItem {
  final String image;
  final String title;
  final String description;
  final List<String> technologies;
  ProjectItem({
    @required this.image,
    @required this.title,
    @required this.description,
    @required this.technologies,
  });
}

final kProjectItems = [
  ProjectItem(
      image: 'lib/assets/images/placeholder.jpg',
      title: 'Dig Those Diglett',
      description: 'A simple pokemon based game',
      technologies: ['HTML5', 'jQuery', 'CSS']),
  ProjectItem(
      image: 'lib/assets/images/placeholder.jpg',
      title: 'LostOnes',
      description: 'Multi-page Pet Adoption Platform',
      technologies: ['Express', 'React', 'bCrypt', 'MongoDB']),
  ProjectItem(
      image: 'lib/assets/images/placeholder.jpg',
      title: 'EventWire',
      description: 'An Event/Party Planning App',
      technologies: ['React', 'HTML5', 'MongoDB'])
];

class ProjectsView extends StatelessWidget {
  const ProjectsView({
    Key key,
  }) : super(key: key);
  static const title = 'Projects';

  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
      mobileView: ProjectsMobileView(),
      desktopView: ProjectsDesktopView(),
    );
  }
}

class ProjectsDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DesktopViewBuilder(
      titleText: ProjectsView.title,
      backgroundColor: Color.fromRGBO(91, 121, 171, 1),
      children: [
        SizedBox(height: 20),
        CarouselSlider(
          options: CarouselOptions(height: 800.0),
          items: kProjectItems.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(211, 211, 211, 1)),
                    child: ProjectItemBody(item: i));
              },
            );
          }).toList(),
        ),
        SizedBox(height: 70)
      ],
    );
  }
}

class ProjectsMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileViewBuilder(
      backgroundColor: Color.fromRGBO(91, 121, 171, 1),
      titleText: ProjectsView.title,
      children: [for (final item in kProjectItems) ProjectItemBody(item: item)],
    );
  }
}

// children: [
// for (final item in kProjectItems)
// Expanded(
//   child: Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: ProjectItemBody(item: item),
//   ),
// )
// ],
// ),
