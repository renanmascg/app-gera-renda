import 'package:flutter/material.dart';

import '../../../../core/shared/styles/text_styles.dart';

class MainButton extends StatelessWidget {
  final void Function() onPress;
  final String text;
  final Color color;

  const MainButton({
    this.onPress,
    this.text,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 220,
        maxWidth: 220,
        minHeight: 50,
        maxHeight: 50
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(kMainButtonBorderRadius),
      ),
      child: FlatButton(
        onPressed: onPress,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: kMainTextSemiBold.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
