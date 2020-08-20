import 'package:flutter/material.dart';
import 'package:portfolio_v2/utils/hover_extensions.dart';
import 'package:portfolio_v2/components/desktop_view_builder.dart';
import 'package:portfolio_v2/components/mobile_desktop_view_builder.dart';
import 'package:portfolio_v2/components/mobile_view_builder.dart';
import 'package:portfolio_v2/experience/experience_container.dart';
import 'package:provider/provider.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:http/http.dart' as http;

class BlogView extends StatelessWidget {
  const BlogView({
    Key key,
  }) : super(key: key);

  static const title = 'Blog';
  @override
  Widget build(BuildContext context) {
    return FutureProvider<RssFeed>(
        create: (_) => getArticles(),
        child: MobileDesktopViewBuilder(
          mobileView: BlogMobileView(),
          desktopView: BlogDesktopView(),
        ));
  }
}

class BlogDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final articles = context.watch<RssFeed>();
    if (articles == null) return CircularProgressIndicator();
    return DesktopViewBuilder(
      backgroundColor: Color.fromRGBO(46, 184, 155, 1),
      titleText: BlogView.title,
      children: [
        SizedBox(
          height: 50,
        ),
        Row(
          children: [
            for (var i = 0; i < 2; i++)
              Expanded(
                child: BlogCard(),
              )
          ],
        ),
        SizedBox(
          height: 100,
        )
      ],
    );
  }
}

class BlogCard extends StatelessWidget {
  const BlogCard({
    Key key,
    this.isMobile,
  }) : super(key: key);

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Color.fromRGBO(240, 121, 99, 1),
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 8,
              vertical: isMobile ?? false ? 20 : 40,
            ),
            child: Text(
              'Testing the Blog App',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('5 august 2020', style: textStyle(isGray: true)),
                SizedBox(height: 15),
                Text('Hot Dogs' * 30, maxLines: 3, style: textStyle())
              ],
            ),
          )
        ],
      ),
    ).moveUpOnHover;
  }
}

class BlogMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final articles = context.watch<RssFeed>();
    if (articles == null) return CircularProgressIndicator();
    return MobileViewBuilder(
      backgroundColor: Color.fromRGBO(46, 184, 155, 1),
      titleText: BlogView.title,
      children: [
        for (var i = 0; i < 2; i++)
          BlogCard(
            isMobile: true,
          )
      ],
    );
  }
}

getArticles() async {
  final url =
      'https://cors-anywhere.herokuapp.com/https://medium.com/feed/@obrien.sean.dev';

  final response = await http.get(url);
  final parsedResponse = RssFeed.parse(response.body);
  return parsedResponse;
}
