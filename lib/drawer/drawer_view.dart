import 'package:flutter/material.dart';
import 'package:portfolio_v2/components/mobile_desktop_view_builder.dart';
import 'package:portfolio_v2/nav_bar/nav_bar_view.dart';
import 'package:provider/provider.dart';
import 'package:portfolio_v2/main.dart';

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
          DrawerHeader(
            child: Text("Sean O'Brien"),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red, Colors.black],
                tileMode: TileMode.repeated,
              ),
            ),
          ),
          for (var item in navItemsList)
            ListTile(
              title: Text(item.text),
              onTap: () {
                scrollController.animateTo(
                  item.position,
                  duration: Duration(milliseconds: 800),
                  curve: Curves.easeInOut,
                );
                Navigator.pop(context);
              },
            ),
        ],
      ),
    );
  }
}
