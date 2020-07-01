import 'package:flutter/material.dart';

import '../styles/colors.dart';

class SliverMainHeader extends StatelessWidget {
  final Widget title;
  final void Function() onPress;
  final PreferredSizeWidget bottom;

  const SliverMainHeader({@required this.title, this.onPress, this.bottom});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: title,
      pinned: true,
      centerTitle: false,
      backgroundColor: kMainBackground,
      elevation: 0,
      leading: IconButton(
        onPressed: onPress ?? () => Navigator.maybePop(context),
        icon: Icon(Icons.arrow_back),
        color: kMainTextBoldColor,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      bottom: bottom,
    );
  }
}
