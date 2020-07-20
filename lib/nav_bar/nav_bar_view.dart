import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, size) {
        if (size.isMobile) {
          return Container(
              height: 60,
              width: double.infinity,
              child: Row(
                children: [
                  SizedBox(width: 20),
                  FlutterLogo(),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                  )
                ],
              ));
        }
        final onPressed = () => print('click');
        return Container(
          height: 100,
          width: 1507,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              FlutterLogo(),
              Spacer(),
              for (var item in kNavItemsList)
                NavBarItem(onPressed: onPressed, text: item.text)
            ],
          ),
        );
      },
    );
  }
}

class NavItem {
  final String text;

  NavItem(this.text);
}

final kNavItemsList = [
  NavItem('Projects'),
  NavItem('Skills'),
  NavItem('About'),
  NavItem('Blog'),
];

class NavBarItem extends StatelessWidget {
  const NavBarItem({
    Key key,
    @required this.onPressed,
    @required this.text,
  }) : super(key: key);

  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final isSmall = MediaQuery.of(context).size.width < 650;
    return Container(
      padding: const EdgeInsets.only(left: 64),
      child: InkWell(
        onTap: onPressed,
        mouseCursor: MaterialStateMouseCursor.clickable,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Text(
          text,
          style: TextStyle(fontSize: isSmall ? 17 : 24),
        ),
      ),
    );
  }
}
