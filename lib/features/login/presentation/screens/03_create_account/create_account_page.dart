import 'package:flutter/material.dart';
import 'package:flutter_gera_renda/features/login/presentation/screens/02_login_page/login_page.dart';

import '../../../../../core/shared/colors.dart';
import '../../../../../core/shared/styles.dart';
import '../../widgets/main_button.dart';
import '../../widgets/main_text_field.dart';
import '../04_create_account_pass/create_account_pass.dart';

class CreateAccountPage extends StatelessWidget {
  static final String id = 'create_account';

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

  PreferredSize _buildAppBar() {
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

  Widget _buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MainTextField(labelText: 'Nome'),
        SizedBox(height: 24),
        MainTextField(labelText: 'Email'),
        SizedBox(height: 24),
        MainButton(
          color: kMainGreenColor,
          text: 'Continue',
          onPress: () => Navigator.pushNamed(context, CreateAccountPassPage.id),
        ),
        SizedBox(height: 12),
        _buildLoginRichText(context)
      ],
    );
  }

  Widget _buildLoginRichText(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamedAndRemoveUntil(
        context,
        LoginPage.id,
        (route) => false,
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: kMainTextRegular.copyWith(
            color: Colors.black.withOpacity(0.5),
          ),
          children: [
            TextSpan(text: 'Tem uma conta? '),
            TextSpan(
              text: 'Bora logar',
              style: TextStyle(color: kMainGreenColor),
            )
          ],
        ),
      ),
    );
  }
}
