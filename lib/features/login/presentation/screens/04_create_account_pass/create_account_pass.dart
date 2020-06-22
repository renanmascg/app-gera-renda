import 'package:flutter/material.dart';

import '../../../../../core/shared/colors.dart';
import '../../../../../core/shared/styles.dart';
import '../../widgets/main_button.dart';
import '../../widgets/main_text_field.dart';

class CreateAccountPassPage extends StatelessWidget {
  static final String id = 'create_account_pass';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:20),
          child: _buildBody(),
        ),
      ),
    );
  }

  _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back)),
                Text('Crie sua Senha',
                    style: kMainLoginHeaderText, textAlign: TextAlign.end),
              ],
            ),
          )),
    );
  }

  _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MainTextField(labelText: 'Senha', obscureText: true),
        SizedBox(height: 24),
        MainTextField(labelText: 'Confirme sua Senha', obscureText: true),
        SizedBox(height: 24),
        MainButton(
          color: kMainGreenColor,
          text: 'Finalizar',
          onPress: () {},
        ),
      ],
    );
  }
}
