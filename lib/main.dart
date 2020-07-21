import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_v2/blog/blog_view.dart';
import 'package:portfolio_v2/drawer/drawer_view.dart';
import 'package:portfolio_v2/experience/experience_view.dart';
import 'package:portfolio_v2/header/header_view.dart';
import 'package:portfolio_v2/nav_bar/nav_bar_view.dart';
import 'package:portfolio_v2/projects/projects_view.dart';
import 'package:portfolio_v2/skills/skills_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sean O'Brien",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline2: GoogleFonts.montserrat(
            color: Colors.black,
          ),
          headline4: GoogleFonts.montserrat(
            fontSize: 30,
            color: Colors.black,
          ),
        ),
      ),
      home: PortfolioView(),
    );
  }
}

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

class BackToTopButton extends StatelessWidget {
  const BackToTopButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollController = context.watch<ScrollController>();
    if (scrollController.isOffsetZero) return SizedBox();
    return FloatingActionButton(
      child: Icon(Icons.arrow_upward),
      onPressed: () {
        scrollController.animateTo(
          0,
          duration: Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      },
    );
  }
}

extension on ScrollController {
  bool get isOffsetZero {
    return this.offset == 0;
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
