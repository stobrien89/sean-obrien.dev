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
  final String url;
  ProjectItem(
      {@required this.image,
      @required this.title,
      @required this.description,
      @required this.technologies,
      @required this.url});
}

final kProjectItems = [
  ProjectItem(
      image: 'images/bookify.png',
      title: 'Bookify',
      description: 'A full-stack booking site geared toward travel',
      technologies: ['Rails', 'Webpack', 'Devise', 'OAuth', 'Bootstrap'],
      url: 'http://bookit-lify.herokuapp.com/'),
  ProjectItem(
      image: 'images/eventwire.png',
      title: 'EventWire',
      description: 'A full-stack event and party planning Platform',
      technologies: [
        'React',
        'Express',
        'MongoDB',
        'Passport-JWT',
        'Bootstrap'
      ],
      url: 'https://github.com/stobrien89/EventWire/tree/dev'),
  ProjectItem(
      image: 'images/lostones.png',
      title: 'LostOnes',
      description: 'A full-stack Pet Adoption Platform',
      technologies: [
        'React',
        'Express',
        'MongoDB',
        'Passport.js',
        'Foundation'
      ],
      url: 'https://lostones.herokuapp.com/lostones'),
  ProjectItem(
      image: 'images/digthosediglett.png',
      title: 'Dig Those Diglett',
      description: 'A pokémon-inspired browser game',
      technologies: ['HTML5', 'jQuery', 'CSS'],
      url: 'https://github.com/stobrien89/Dig_Those_Diglett'),
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
        SizedBox(height: 70),
        CarouselSlider(
          options: CarouselOptions(
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            enableInfiniteScroll: true,
            viewportFraction: 0.75,
          ),
          items: kProjectItems.map((i) {
            return FittedBox(
              child: Card(
                  elevation: 10,
                  color: Color.fromRGBO(46, 184, 155, .8),
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  borderOnForeground: true,
                  // decoration: BoxDecoration(
                  //   color: Color.fromRGBO(211, 211, 211, 1),
                  //   borderRadius: BorderRadius.all(Radius.circular(5)),

                  child: ProjectItemBody(item: i)),
            );
          }).toList(),
        ),
        SizedBox(height: 100)
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
        children: [
          CarouselSlider(
            options: CarouselOptions(
              enlargeCenterPage: true,
              aspectRatio: 1.0,
              enableInfiniteScroll: true,
              viewportFraction: 0.85,
            ),
            items: kProjectItems.map((i) {
              return FittedBox(
                child: Card(
                    elevation: 10,
                    color: Colors.grey,
                    shadowColor: Colors.black,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    // decoration: BoxDecoration(
                    //   color: Color.fromRGBO(211, 211, 211, 1),
                    //   borderRadius: BorderRadius.all(Radius.circular(5)),

                    child: ProjectItemBody(item: i)),
              );
            }).toList(),
          ),
          SizedBox(
            height: 70,
          )
        ]);
  }
}
