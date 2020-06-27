import 'package:flutter/material.dart';
import '../../../../core/shared/colors.dart';
import '../styles/text_styles.dart';

class SliverMainHeader extends StatelessWidget {
  final String text;
  final void Function() onPress;

  const SliverMainHeader({@required this.text, this.onPress});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(text, style: kBoldTextStyle.copyWith(fontSize: 22)),
      centerTitle: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: onPress ?? () => Navigator.maybePop(context),
        icon: Icon(Icons.arrow_back),
        color: kMainTextBoldColor,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
    );
  }
}
