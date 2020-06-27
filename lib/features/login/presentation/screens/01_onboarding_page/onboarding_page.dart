import 'package:flutter/material.dart';

import '../../../../../core/shared/colors.dart';
import '../../../../../core/shared/styles.dart';
import '../../../../../core/shared/texts/login_text.dart';
import '../../widgets/main_button.dart';
import '../02_login_page/login_page.dart';
import '../03_create_account/create_account_page.dart';

class OnboardingPage extends StatelessWidget {
  static final String id = 'onboarding_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildLogoMessage(),
        _buildBottomButton(context),
      ],
    );
  }

  Widget _buildLogoMessage() {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/login/Logo.png', height: 135),
          SizedBox(height: 35),
          Text(
            logoTitleText,
            style: kMainTextSemiBold,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget _buildBottomButton(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MainButton(
            color: kMainGreenColor,
            onPress: () => Navigator.pushNamedAndRemoveUntil(
              context,
              CreateAccountPage.id,
              (Route<dynamic> route) => false,
            ),
            text: 'Vamos começar!',
          ),
          SizedBox(height: 12),
          _buildLoginRichText(context),
        ],
      ),
    );
  }

  Widget _buildLoginRichText(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamedAndRemoveUntil(
        context,
        LoginPage.id,
        (Route<dynamic> route) => false,
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
