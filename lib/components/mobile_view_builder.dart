import 'package:flutter/material.dart';

class MobileViewBuilder extends StatelessWidget {
  final String titleText;
  final List<Widget> children;
  const MobileViewBuilder({
    Key key,
    @required this.titleText,
    @required this.children,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      color: Colors.yellow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(thickness: 3),
          SizedBox(height: 40),
          Text(titleText, style: Theme.of(context).textTheme.headline2),
          SizedBox(height: 40),
          ...children,
        ],
      ),
    );
  }
}
