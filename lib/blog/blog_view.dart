import 'package:flutter/material.dart';
import 'package:portfolio_v2/components/desktop_view_builder.dart';
import 'package:portfolio_v2/components/mobile_desktop_view_builder.dart';
import 'package:portfolio_v2/components/mobile_view_builder.dart';
import 'package:portfolio_v2/experience/experience_container.dart';

class BlogView extends StatelessWidget {
  static const title = 'Blog';
  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
      mobileView: BlogMobileView(),
      desktopView: BlogDesktopView(),
    );
  }
}

class BlogDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DesktopViewBuilder(
      titleText: BlogView.title,
      children: [
        Row(
          children: [
            for (var i = 0; i < 2; i++)
              Expanded(
                child: BlogCard(),
              )
          ],
        )
      ],
    );
  }
}

class BlogCard extends StatelessWidget {
  const BlogCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.redAccent,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 40),
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
    );
  }
}

class BlogMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileViewBuilder(
      titleText: BlogView.title,
      children: [],
    );
  }
}
