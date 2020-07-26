import 'package:flutter/material.dart';

import '../../../../core/shared/styles/text_styles.dart';

class MainTextField extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final Function(String) onChanged;

  const MainTextField(
      {@required this.labelText, this.obscureText = false, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
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
