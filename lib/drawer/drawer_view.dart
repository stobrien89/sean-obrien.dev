import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_v2/components/mobile_desktop_view_builder.dart';
import 'package:portfolio_v2/portfolio/portfolio_view.dart';
import 'package:provider/provider.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
      mobileView: DrawerMobileView(),
      desktopView: SizedBox(),
    );
  }
}

class DrawerMobileView extends StatelessWidget {
  const DrawerMobileView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navItemsList = context.watch<List<NavItem>>();
    final scrollController = context.watch<ScrollController>();
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 300,
            child: DrawerHeader(
              child: Column(
                children: [
                  SizedBox(height: 30),
                  SizedBox(
                      width: 90,
                      height: 90,
                      child: CircleAvatar(
                        backgroundImage:
                            NetworkImage('lib/assets/images/linkedin.png'),
                      )),
                  SizedBox(height: 25),
                  Text("Sean O'Brien"),
                  Text("Software Engineer"),
                ],
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red, Colors.black],
                  tileMode: TileMode.repeated,
                ),
              ),
            ),
          ),
          for (var item in navItemsList)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListTile(
                title: Text(
                  item.text,
                  style: GoogleFonts.roboto(
                      fontSize: 18, fontWeight: FontWeight.w300),
                ),
                onTap: () {
                  scrollController.animateTo(
                    item.position,
                    duration: Duration(milliseconds: 800),
                    curve: Curves.easeInOut,
                  );
                  Navigator.pop(context);
                },
              ),
            ),
        ],
      ),
    );
  }
}
