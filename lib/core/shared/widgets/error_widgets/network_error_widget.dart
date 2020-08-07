import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../features/login/presentation/widgets/main_button.dart';
import '../../styles/colors.dart';
import '../../styles/text_styles.dart';

class NetworkErrorWidget extends StatelessWidget {
  final void Function() onPress;

  const NetworkErrorWidget({@required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      color: kMainBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Deu Ruim!',
              textAlign: TextAlign.center,
              style: kBoldTextStyle.copyWith(fontSize: 22)),
          SvgPicture.asset(
            'assets/sem_internet.svg',
            width: 200,
            height: 200,
          ),
          Text('Não conseguimos nenhuma\n resposta da sua rede...',
              textAlign: TextAlign.center,
              style: kBoldTextStyle.copyWith(fontSize: 22)),
          SizedBox(height: 20),
          Text(
            'Mas não se preocupe!\nVocê pode tentar novamente!',
            textAlign: TextAlign.center,
            style: kChipTextStyle.copyWith(fontSize: 16),
          ),
          SizedBox(height: 20),
          MainButton(
            color: kMainGreenColor,
            text: 'Tentar novamente',
            onPress: onPress,
          )
        ],
      ),
    );
  }
}
