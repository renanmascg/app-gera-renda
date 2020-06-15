import 'package:flutter/material.dart';
import 'package:flutter_gera_renda/core/shared/styles.dart';

class MainTextField extends StatelessWidget {
  final String labelText;
  final bool obscureText;

  const MainTextField({@required this.labelText, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: labelText,
        labelStyle: kMainTextFieldText,
        alignLabelWithHint: false,
      ),
    );
  }
}
