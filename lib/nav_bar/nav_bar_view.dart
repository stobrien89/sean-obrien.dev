import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_v2/components/mobile_desktop_view_builder.dart';
import 'package:portfolio_v2/portfolio/portfolio_view.dart';
import 'package:provider/provider.dart';
import 'package:portfolio_v2/utils/hover_extensions.dart';

class NavBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
      mobileView: NavMobileView(),
      desktopView: NavDesktopView(),
    );
  }
}

class NavDesktopView extends StatelessWidget {
  const NavDesktopView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navItemsList = context.watch<List<NavItem>>();
    final scrollController = context.watch<ScrollController>();
    return Container(
      height: 100,
      width: 1507,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Image.asset('lib/assets/images/logo.png',
              height: 100, width: 100, fit: BoxFit.fitHeight),
          Spacer(),
          for (var item in navItemsList)
            NavBarItem(
              onPressed: () {
                scrollController.animateTo(
                  item.position,
                  duration: Duration(milliseconds: 800),
                  curve: Curves.easeInOut,
                );
              },
              text: item.text,
            )
        ],
      ),
    );
  }
}

class NavMobileView extends StatelessWidget {
  const NavMobileView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: double.infinity,
        child: Row(
          children: [
            Image.asset('lib/assets/images/logo.png'),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.menu,
                color: Color.fromRGBO(91, 121, 171, 1),
              ),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            )
          ],
        ));
  }
}

class NavBarItem extends StatelessWidget {
  const NavBarItem({
    Key key,
    @required this.onPressed,
    @required this.text,
  }) : super(key: key);

  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final isSmall = MediaQuery.of(context).size.width < 650;
    return Container(
      padding: const EdgeInsets.only(left: 64),
      child: InkWell(
        onTap: onPressed,
        mouseCursor: MaterialStateMouseCursor.clickable,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Text(text,
            style: GoogleFonts.oswald(
              color: Color.fromRGBO(137, 67, 149, 1),
              fontSize: isSmall ? 17 : 24,
              fontWeight: FontWeight.w300,
            )),
      ).moveUpOnHover,
    );
  }
}
