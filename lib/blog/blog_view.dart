import 'package:flutter/material.dart';

import 'package:portfolio_v2/components/desktop_view_builder.dart';
import 'package:portfolio_v2/components/mobile_desktop_view_builder.dart';
import 'package:portfolio_v2/components/mobile_view_builder.dart';

import 'package:provider/provider.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed/domain/rss_item.dart';

import 'blog_card.dart';

class BlogView extends StatelessWidget {
  const BlogView({
    Key key,
  }) : super(key: key);

  static const title = 'Articles';
  @override
  Widget build(BuildContext context) {
    return FutureProvider<List<RssItem>>(
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
    final articles = context.watch<List<RssItem>>();
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
            for (final article in articles)
              Expanded(
                child: BlogCard(
                  article: article,
                ),
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

class BlogMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final articles = context.watch<List<RssItem>>();
    if (articles == null) return CircularProgressIndicator();
    return MobileViewBuilder(
      backgroundColor: Color.fromRGBO(46, 184, 155, 1),
      titleText: BlogView.title,
      children: [
        for (final article in articles)
          BlogCard(
            article: article,
            isMobile: true,
          ),
        SizedBox(
          height: 70,
        )
      ],
    );
  }
}

Future<List<RssItem>> getArticles() async {
  final url =
      'https://cors-anywhere.herokuapp.com/https://medium.com/feed/@obrien.sean.dev';

  final response = await http.get(url);
  final parsedResponse = RssFeed.parse(response.body);
  final hasFlutterTag = (RssItem article) {
    return article.categories.any((category) => category.value == 'flutter');
  };
  final flutterArticles =
      parsedResponse.items.where(hasFlutterTag).take(2).toList();

  return flutterArticles;
}
