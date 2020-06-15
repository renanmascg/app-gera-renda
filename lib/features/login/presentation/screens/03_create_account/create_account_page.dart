import 'package:flutter/material.dart';

import '../../../../../core/shared/colors.dart';
import '../../../../../core/shared/styles.dart';
import '../../widgets/main_button.dart';
import '../../widgets/main_text_field.dart';

class CreateAccountPage extends StatelessWidget {
  static final String id = 'create_account';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: _buildBody(),
        ),
      ),
    );
  }

  _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text('Crie sua Conta',
              style: kMainLoginHeaderText, textAlign: TextAlign.end),
        ),
      ),
    );
  }

  _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: <Widget>[
        MainTextField(labelText: 'Email'),
        SizedBox(height: 24),
        MainTextField(labelText: 'Senha', obscureText: true),
        SizedBox(height: 24),
        MainTextField(labelText: 'Confirme sua Senha', obscureText: true),
        SizedBox(height: 45),
        MainButton(
          color: kMainGreenColor,
          text: 'Continue',
          onPress: () {},
        )
      ],
    );
  }
}
