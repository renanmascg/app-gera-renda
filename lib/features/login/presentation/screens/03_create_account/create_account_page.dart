import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/shared/styles/colors.dart';
import '../../../../../core/shared/styles/text_styles.dart';
import '../../../../../injection_container.dart';
import '../../mobx/create_profile_store/create_profile_store.dart';
import '../../widgets/main_button.dart';
import '../../widgets/main_text_field.dart';
import '../02_login_page/login_page.dart';
import '../04_create_account_pass/create_account_pass.dart';

class CreateAccountPage extends StatelessWidget {
  static final String id = 'create_account';
  final CreateProfileStore _store = serviceLocator<CreateProfileStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
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
        MainTextField(labelText: 'Nome', onChanged: _store.changeName),
        SizedBox(height: 24),
        MainTextField(labelText: 'Email', onChanged: _store.changeEmail),
        SizedBox(height: 24),
        Observer(
          builder: (ctx) {
            return Visibility(
              visible: _store.isEmailButtonAvailable,
              replacement: MainButton(
                color: kMainGreenColor,
                text: 'Continue',
                onPress: null,
              ),
              child: MainButton(
                color: kMainGreenColor,
                text: 'Continue',
                onPress: () =>
                    Navigator.pushNamed(context, CreateAccountPassPage.id),
              ),
            );
          },
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
