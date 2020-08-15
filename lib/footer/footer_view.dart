import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio_v2/utils/hover_extensions.dart';

import 'package:portfolio_v2/components/mobile_desktop_view_builder.dart';
import 'package:portfolio_v2/utils/constants.dart';

class FooterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
      mobileView: FooterMobileView(),
      desktopView: FooterDesktopView(),
    );
  }
}

class FooterDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;
    return Container(
        height: 100,
        width: kInitWidth,
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Row(
          children: [
            Text(
              "© Sean O'Brien $currentYear — ",
              style: GoogleFonts.oswald(
                color: Color.fromRGBO(137, 67, 149, 1),
              ),
            ),
            InkWell(
              child: Text(
                'Source Code',
                style: GoogleFonts.oswald(
                    color: Color.fromRGBO(137, 67, 149, 1),
                    decoration: TextDecoration.underline),
              ),
              mouseCursor: MaterialStateMouseCursor.clickable,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onTap: () =>
                  launch('https://github.com/stobrien89/sean-obrien.dev'),
            ),
            Spacer(),
            for (final social in socials)
              IconButton(
                icon: social.icon,
                onPressed: () => launch(social.url),
                color: Color.fromRGBO(46, 184, 155, 1),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ).moveUpOnHover,
            SizedBox(width: 60),
          ],
        ));
  }
}

class FooterMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (final social in socials)
                  IconButton(
                    icon: social.icon,
                    onPressed: () => launch(social.url),
                    color: Colors.redAccent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                  )
              ],
            ),
            SizedBox(height: 20),
            Text(
              "© Sean O'Brien $currentYear",
              style: GoogleFonts.oswald(
                color: Color.fromRGBO(137, 67, 149, 1),
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              child: Text(
                'Source Code',
                style: GoogleFonts.oswald(
                    color: Color.fromRGBO(137, 67, 149, 1),
                    decoration: TextDecoration.underline),
              ),
              mouseCursor: MaterialStateMouseCursor.clickable,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onTap: () =>
                  launch('https://github.com/stobrien89/sean-obrien.dev'),
            ),
          ],
        ));
  }
}

class SocialInfo {
  final Widget icon;
  final String url;
  SocialInfo({
    @required this.icon,
    @required this.url,
  });
}

final socials = [
  SocialInfo(
      icon: FaIcon(FontAwesomeIcons.linkedin),
      url: 'https://linkedin.com/in/sean-t-obrien/'),
  SocialInfo(
      icon: FaIcon(FontAwesomeIcons.github),
      url: 'https://github.com/stobrien89/'),
  SocialInfo(
      icon: FaIcon(FontAwesomeIcons.twitter),
      url: 'https://twitter.com/SeanOBDev'),
  SocialInfo(
      icon: FaIcon(FontAwesomeIcons.medium),
      url: 'https://medium.com/@obrien.sean.dev'),
];
