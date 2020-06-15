import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gera_renda/core/shared/colors.dart';
import 'package:flutter_gera_renda/core/shared/styles.dart';
import 'package:flutter_gera_renda/core/shared/widgets/main_button.dart';

import '../../../../core/shared/texts/login_text.dart';

class OnboardingPage extends StatelessWidget {
  static final String id = 'onboarding_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: _buildBody(),
        ),
      ),
    );
  }

  _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildLogoMessage(),
        _buildBottomButton(),
      ],
    );
  }

  _buildLogoMessage() {
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

  _buildBottomButton() {
    return Expanded(
      flex: 1,
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MainButton(
            color: kMainGreenColor,
            onPress: () {},
            text: 'Vamos começar!',
          ),
          SizedBox(height: 12),
          _buildLoginRichText(),
        ],
      ),
    );
  }

  _buildLoginRichText() {
    return GestureDetector(
      onTap: () {
        print('usuario Logado');
      },
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
