import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_v2/projects/projects_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio_v2/utils/hover_extensions.dart';

class ProjectItemBody extends StatelessWidget {
  const ProjectItemBody({
    Key key,
    @required this.item,
  }) : super(key: key);

  final ProjectItem item;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromRGBO(46, 184, 155, .8),
            Color.fromRGBO(91, 121, 171, 1),
            // Color.fromRGBO(137, 67, 149, 1),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            item.image,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 15),
          Text(
            item.title,
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: 15),
          Text(
            item.description,
            style: GoogleFonts.openSans(
              fontSize: 17,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Technologies Used: ',
                  style: GoogleFonts.openSans(
                    fontSize: 17,
                  )),
              for (final tech in item.technologies)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Chip(
                    label: Text(tech),
                  ),
                )
            ],
          ),
          SizedBox(height: 10),
          FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(7),
              ),
            ),
            color: Color.fromRGBO(137, 67, 149, 1),
            onPressed: () => launch(item.url),
            child: Text(
              'Source Code/Demo',
              style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 20),
            ),
          ).moveUpOnHover,
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
