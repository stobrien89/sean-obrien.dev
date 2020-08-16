import 'package:flutter/material.dart';
import 'package:portfolio_v2/projects/projects_view.dart';

class ProjectItemBody extends StatelessWidget {
  const ProjectItemBody({
    Key key,
    @required this.item,
  }) : super(key: key);

  final ProjectItem item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // SizedBox(
        //   height: 50,
        // ),
        // Text(
        //   item.title,
        //   style: Theme.of(context).textTheme.headline4,
        // ),
        // SizedBox(height: 20),
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
          style: TextStyle(fontSize: 17),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Technologies Used: '),
            for (final tech in item.technologies)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Chip(label: Text(tech)),
              )
          ],
        ),
        SizedBox(height: 50),
      ],
    );
  }
}
