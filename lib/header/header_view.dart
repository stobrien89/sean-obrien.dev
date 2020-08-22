import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_v2/components/mobile_desktop_view_builder.dart';
import 'package:portfolio_v2/utils/constants.dart';
import 'package:portfolio_v2/utils/hover_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
      mobileView: HeaderMobileView(),
      desktopView: HeaderDesktopView(),
    );
  }
}

class HeaderDesktopView extends StatelessWidget {
  const HeaderDesktopView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isSmall = width < 950;
    final imageWidth = width * .47;
    return Container(
        height: 864,
        width: kInitWidth,
        color: Color.fromRGBO(46, 184, 155, 1),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Row(
            children: [
              Expanded(
                child: HeaderBody(),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  'images/portfolio_profile.png',
                  height: isSmall ? imageWidth : 500,
                ),
              )
            ],
          ),
        ));
  }
}

class HeaderBody extends StatelessWidget {
  final bool isMobile;
  const HeaderBody({
    Key key,
    this.isMobile = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          "Hi, my name is Sean.",
          style: Theme.of(context).textTheme.headline2.copyWith(fontSize: 45),
          maxLines: 1,
        ),
        AutoSizeText(
          "I'm a Software Engineer </>",
          style: Theme.of(context).textTheme.headline2.copyWith(fontSize: 45),
          maxLines: 1,
        ),
        SizedBox(height: 20),
        AutoSizeText(
          "I have 2 years of experience in software development and over 6 years of experience working in tech. ",
          style: GoogleFonts.montserrat(
              fontSize: 20,
              letterSpacing: .5,
              color: Color.fromRGBO(43, 125, 128, 1),
              fontWeight: FontWeight.w400),
          maxLines: 5,
        ),
        SizedBox(height: 20),
        AutoSizeText(
          "I love to build web and mobile applications with a focus on user experience.",
          style: GoogleFonts.montserrat(
              fontSize: 20,
              letterSpacing: .5,
              color: Color.fromRGBO(43, 125, 128, 1.0),
              fontWeight: FontWeight.w400),
          maxLines: 3,
        ),
        SizedBox(height: 35),
        RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(7),
            ),
          ),
          color: Color.fromRGBO(240, 121, 99, 1),
          onPressed: () => launch('mailto:obrien.sean.dev@gmail.com'),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: isMobile ?? false ? 10 : 17,
                horizontal: isMobile ?? false ? 8 : 15),
            child: Text(
              'Get In Touch',
              style: GoogleFonts.oswald(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ).moveUpOnHover,
      ],
    );
  }
}

class HeaderMobileView extends StatelessWidget {
  const HeaderMobileView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height < 800 && width < 400
          ? height * 1.4
          : height < 750 && width > 400 ? height * 1.1 : height * 1,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      color: Color.fromRGBO(46, 184, 155, 1),
      child: Column(
        children: [
          Image.asset('images/portfolio_profile.png', height: 250),
          Expanded(child: HeaderBody(isMobile: true)),
        ],
      ),
    );
  }
}
