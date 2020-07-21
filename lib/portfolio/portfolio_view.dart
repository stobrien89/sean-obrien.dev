import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_v2/blog/blog_view.dart';
import 'package:portfolio_v2/drawer/drawer_view.dart';
import 'package:portfolio_v2/experience/experience_view.dart';
import 'package:portfolio_v2/header/header_view.dart';
import 'package:portfolio_v2/nav_bar/nav_bar_view.dart';
import 'package:portfolio_v2/portfolio/back_to_top_button.dart';
import 'package:portfolio_v2/projects/projects_view.dart';
import 'package:portfolio_v2/skills/skills_view.dart';
import 'package:provider/provider.dart';

class PortfolioView extends StatefulWidget {
  const PortfolioView({
    Key key,
  }) : super(key: key);

  @override
  _PortfolioViewState createState() => _PortfolioViewState();
}

class _PortfolioViewState extends State<PortfolioView> with AfterLayoutMixin {
  final projectKey = GlobalKey();
  final skillsKey = GlobalKey();
  final experienceKey = GlobalKey();
  final blogKey = GlobalKey();
  List<NavItem> navItemsList = [];

  final ScrollController scrollController = ScrollController(
    initialScrollOffset: 0,
  );

  @override
  void afterFirstLayout(BuildContext context) {
    setState(() {
      navItemsList = [
        NavItem('Projects', key: projectKey),
        NavItem('Skills', key: skillsKey),
        NavItem('About', key: experienceKey),
        NavItem('Blog', key: blogKey),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return MultiProvider(
      providers: [
        ProxyProvider0<List<NavItem>>(update: (_, __) {
          return navItemsList;
        }),
        ChangeNotifierProvider<ScrollController>(create: (_) {
          return scrollController;
        }),
      ],
      child: Scaffold(
        endDrawer: DrawerView(),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              NavBarView(),
              HeaderView(),
              ProjectsView(key: projectKey),
              SkillsView(key: skillsKey),
              ExperienceView(key: experienceKey),
              BlogView(key: blogKey),
              Container(height: height, width: width, color: Colors.black),
            ],
          ),
        ),
        floatingActionButton: BackToTopButton(),
      ),
    );
  }
}

class NavItem {
  final String text;
  final GlobalKey key;
  NavItem(
    this.text, {
    @required this.key,
  });

  double get position => _getPosition(key);
}

double _getPosition(GlobalKey key) {
  final RenderBox renderBox = key.currentContext.findRenderObject();
  final position = renderBox.localToGlobal(Offset.zero);
  final scrollOffset = position.dy;
  return scrollOffset;
}