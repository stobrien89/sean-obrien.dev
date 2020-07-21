import 'package:flutter/material.dart';
import '../utils/constants.dart';

class DesktopViewBuilder extends StatelessWidget {
  final String titleText;
  final List<Widget> children;
  const DesktopViewBuilder({
    Key key,
    @required this.titleText,
    @required this.children,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      width: kInitWidth,
      color: Colors.yellow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titleText, style: Theme.of(context).textTheme.headline2),
          ...children,
        ],
      ),
    );
  }
}
