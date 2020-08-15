import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_v2/components/mobile_desktop_view_builder.dart';
import 'package:portfolio_v2/utils/constants.dart';
import 'package:portfolio_v2/utils/hover_extensions.dart';

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
                child: FlutterLogo(size: 300),
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
          "Hello, my name is Sean.",
          style: Theme.of(context).textTheme.headline2,
          maxLines: 1,
        ),
        AutoSizeText(
          "I'm a Software Engineer </>",
          style: Theme.of(context).textTheme.headline2,
          maxLines: 1,
        ),
        SizedBox(height: isMobile ?? false ? 18 : 37),
        AutoSizeText(
          "I have 2 years of experience in software development and over 6 years of experience working in tech. ",
          style: GoogleFonts.montserrat(
              fontSize: 24,
              color: Color.fromRGBO(211, 211, 211, 1),
              fontWeight: FontWeight.w300),
          maxLines: 4,
        ),
        SizedBox(height: isMobile ?? false ? 10 : 37),
        AutoSizeText(
          "I love building websites with a focus on user experience",
          style: GoogleFonts.montserrat(
              fontSize: 24,
              color: Color.fromRGBO(211, 211, 211, 1),
              fontWeight: FontWeight.w300),
          maxLines: 3,
        ),
        SizedBox(height: isMobile ?? false ? 40 : 80),
        FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(7),
            ),
          ),
          color: Color.fromRGBO(137, 67, 149, 1),
          onPressed: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: isMobile ?? false ? 10 : 17,
                horizontal: isMobile ?? false ? 8 : 15),
            child: Text(
              'Contact Me',
              style: GoogleFonts.oswald(
                  fontSize: isMobile ?? false ? 20 : 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w200),
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
      height: height * .9,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      color: Color.fromRGBO(46, 184, 155, 1),
      child: Column(
        children: [
          FlutterLogo(size: height * .3),
          Spacer(),
          HeaderBody(isMobile: true),
        ],
      ),
    );
  }
}
