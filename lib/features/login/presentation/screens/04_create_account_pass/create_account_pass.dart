import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/shared/styles/colors.dart';
import '../../../../../core/shared/styles/text_styles.dart';
import '../../../../../core/shared/widgets/modals/dialogs.dart';
import '../../../../../core/shared/widgets/snackbars/generic_snackbar.dart';
import '../../../../../injection_container.dart';
import '../../mobx/create_profile_store/create_profile_store.dart';
import '../../widgets/main_button.dart';
import '../../widgets/main_text_field.dart';

class CreateAccountPassPage extends StatefulWidget {
  static final String id = 'create_account_pass';

  @override
  _CreateAccountPassPageState createState() => _CreateAccountPassPageState();
}

class _CreateAccountPassPageState extends State<CreateAccountPassPage> {
  List<ReactionDisposer> _disposers;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final CreateProfileStore _store = serviceLocator<CreateProfileStore>();

  @override
  void initState() {
    super.initState();
    _store.password = '';
    _store.confirmPassword = '';
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _disposers ??= [
      reaction(
        // Tell the reaction which observable to observe
        (_) => _store.statusPage,
        // Run some logic with the content of the observed field
        (CreateProfileStatus status) {
          switch (status) {
            case CreateProfileStatus.ERROR:
              Navigator.of(context).pop(context);
              _scaffoldKey.currentState
                  .showSnackBar(errorSnackbar('Email já utilizado.'));
              break;
            case CreateProfileStatus.CREATING:
              loadingDialogs(context);
              break;
            case CreateProfileStatus.SUCCESS:
              Navigator.of(context).pop(context);
              break;
            default:
              break;
          }
        },
      ),
    ];
  }

  @override
  void dispose() {
    if (_disposers.isNotEmpty) {
      _disposers.forEach((d) => d());
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: _buildBody(),
        ),
      ),
    );
  }

  PreferredSize _buildAppBar(BuildContext context) {
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

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MainTextField(
          labelText: 'Senha',
          obscureText: true,
          onChanged: _store.changePassword,
        ),
        SizedBox(height: 24),
        MainTextField(
          labelText: 'Confirme sua Senha',
          obscureText: true,
          onChanged: _store.changeConfirmPassword,
        ),
        SizedBox(height: 24),
        Observer(
          builder: (ctx) {
            return Visibility(
              visible: _store.isPasswordButtonAvailable,
              replacement: MainButton(
                color: kMainGreenColor,
                text: 'Criar Perfil',
                onPress: null,
              ),
              child: MainButton(
                color: kMainGreenColor,
                text: 'Criar Perfil',
                onPress: _store.createUser,
              ),
            );
          },
        ),
      ],
    );
  }
}
