import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../features/login/presentation/widgets/main_button.dart';
import '../../styles/colors.dart';
import '../../styles/text_styles.dart';

class NoResultsFoundWidget extends StatelessWidget {
  final void Function() onPress;

  const NoResultsFoundWidget({@required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      color: kMainBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                style: kBoldTextStyle.copyWith(
                    fontSize: 22, fontWeight: FontWeight.normal),
                children: [
                  TextSpan(text: 'Que tal\n'),
                  TextSpan(
                      text: 'ser o primeiro?',
                      style: TextStyle(fontWeight: FontWeight.bold))
                ]),
          ),
          SvgPicture.asset(
            'assets/nenhum_resultado.svg',
            width: 200,
            height: 200,
          ),
          Text(
            'Sua região ainda não tem nenhum\nparceiro em nosso aplicativo!\nQue tal ser o pioneiro então?\nCadastre-se',
            textAlign: TextAlign.center,
            style: kBoldTextStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 20),
          MainButton(
            color: kMainGreenColor,
            text: 'Cadastrar',
            onPress: onPress,
          )
        ],
      ),
    );
  }
}
