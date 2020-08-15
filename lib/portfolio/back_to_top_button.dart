import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BackToTopButton extends StatelessWidget {
  const BackToTopButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollController = context.watch<ScrollController>();
    if (scrollController.isOffsetZero) return SizedBox();
    return FloatingActionButton(
      child: Icon(Icons.arrow_upward),
      backgroundColor: Color.fromRGBO(137, 67, 149, 1),
      onPressed: () {
        scrollController.animateTo(
          0,
          duration: Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      },
    );
  }
}

extension on ScrollController {
  bool get isOffsetZero {
    return this.offset == 0;
  }
}
