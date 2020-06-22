import 'package:flutter/material.dart';
import 'package:flutter_gera_renda/core/shared/texts/login_text.dart';
import 'package:flutter_gera_renda/features/login/presentation/screens/03_create_account/create_account_page.dart';

import '../../../../../core/shared/colors.dart';
import '../../../../../core/shared/styles.dart';
import '../../widgets/main_button.dart';
import '../../widgets/main_text_field.dart';

class LoginPage extends StatelessWidget {
  static final String id = 'login_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:20),
          child: _buildBody(context),
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
          child: Text(loginWelcomeBack,
              style: kMainLoginHeaderText, textAlign: TextAlign.end),
        ),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MainTextField(labelText: 'Email'),
        SizedBox(height: 24),
        MainTextField(labelText: 'Senha', obscureText: true),
        SizedBox(height: 24),
        MainButton(
          color: kMainGreenColor,
          text: 'Entrar',
          onPress: () {},
        ),
        SizedBox(height: 12),
        _buildLoginRichText(context)
      ],
    );
  }

  _buildLoginRichText(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamedAndRemoveUntil(
        context,
        CreateAccountPage.id,
        (Route<dynamic> route) => false,
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: kMainTextRegular.copyWith(
            color: Colors.black.withOpacity(0.5),
          ),
          children: [
            TextSpan(text: 'Ainda não tem uma conta? '),
            TextSpan(
              text: 'Bora criar',
              style: TextStyle(color: kMainGreenColor),
            )
          ],
        ),
      ),
    );
  }
}
