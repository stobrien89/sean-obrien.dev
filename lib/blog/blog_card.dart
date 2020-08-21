import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:portfolio_v2/utils/hover_extensions.dart';
import 'package:portfolio_v2/experience/experience_container.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed/domain/rss_item.dart';
import 'package:http/http.dart' as http;

class BlogCard extends StatelessWidget {
  const BlogCard({
    Key key,
    this.isMobile,
    this.article,
  }) : super(key: key);

  final bool isMobile;
  final RssItem article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () => launch(article.link),
      child: Card(
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
              child: AutoSizeText(
                article.title,
                textAlign: TextAlign.center,
                maxLines: 1,
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
                  Text(convertDate(article.pubDate.toString()),
                      // article.pubDate.toString(),
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          color: Color.fromRGBO(43, 125, 128, 1),
                          fontWeight: FontWeight.w300)),
                  SizedBox(height: 15),
                  Text(removeAllHtmlTags(article.content.value),
                      maxLines: 3,
                      style: GoogleFonts.openSans(
                          fontSize: 20, fontWeight: FontWeight.w300))
                ],
              ),
            )
          ],
        ),
      ).moveUpOnHover,
    );
  }
}

String removeAllHtmlTags(String htmlText) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

  return htmlText.replaceAll(exp, '');
}

String convertDate(String dateText) {
  final date = DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateText);
  return DateFormat('MMMM d, yyyy').format(date);
}
