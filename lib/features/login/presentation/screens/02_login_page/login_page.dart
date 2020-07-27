import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/network/status_page.dart';
import '../../../../../core/shared/styles/colors.dart';
import '../../../../../core/shared/styles/text_styles.dart';
import '../../../../../core/shared/texts/login_text.dart';
import '../../../../../core/shared/widgets/modals/dialogs.dart';
import '../../../../../core/shared/widgets/snackbars/generic_snackbar.dart';
import '../../../../../injection_container.dart';
import '../../../../app_routes/app_routes.dart';
import '../../mobx/login_store/login_store.dart';
import '../../widgets/main_button.dart';
import '../../widgets/main_text_field.dart';
import '../03_create_account/create_account_page.dart';

class LoginPage extends StatefulWidget {
  static final String id = 'login_page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginStore _store = serviceLocator<LoginStore>();

  List<ReactionDisposer> _disposers;
  // For showing a SnackBar
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _disposers ??= [
      reaction(
        // Tell the reaction which observable to observe
        (_) => _store.statusPage,
        // Run some logic with the content of the observed field
        (StatusPage status) {
          switch (status) {
            case StatusPage.ERROR:
              Navigator.of(context).pop(context);
              _scaffoldKey.currentState
                  .showSnackBar(errorSnackbar('Email ou Senha Incorretos'));
              break;
            case StatusPage.SEARCHING:
              loadingDialogs(context);
              break;
            case StatusPage.NORMAL:
              Navigator.of(context).pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.id,
                (Route<dynamic> route) => false,
              );
          }
        },
      ),
    ];
  }

  @override
  void dispose() {
    _disposers.forEach((d) => d());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar(),
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: true,
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
          child: Text(loginWelcomeBack,
              style: kMainLoginHeaderText, textAlign: TextAlign.end),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MainTextField(labelText: 'Email', onChanged: _store.changeEmail),
        SizedBox(height: 24),
        MainTextField(
          labelText: 'Senha',
          obscureText: true,
          onChanged: _store.changePassword,
        ),
        SizedBox(height: 24),
        Observer(
          builder: (ctx) {
            return MainButton(
              color: kMainGreenColor,
              text: 'Entrar',
              onPress: _store.isButtonAvailable ? _store.signInUser : null,
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
