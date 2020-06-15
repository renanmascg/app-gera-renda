import 'package:flutter/material.dart';
import 'package:flutter_gera_renda/core/shared/styles.dart';

class MainButton extends StatelessWidget {
  final Function onPress;
  final String text;
  final Color color;

  const MainButton({
    this.onPress,
    this.text,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 220,
          maxHeight: 40
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(kMainButtonBorderRadius),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: kMainTextSemiBold.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
