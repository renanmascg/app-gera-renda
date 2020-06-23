import 'package:flutter/material.dart';
import 'package:flutter_gera_renda/core/shared/styles.dart';
import 'package:flutter_gera_renda/features/categories/presentation/styles/text_styles.dart';

class GridButtonWidget extends StatelessWidget {
  final String categorie;

  const GridButtonWidget({ this.categorie });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(0),
      onPressed: () {
        print('botao grid');
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [kMainBoxShadow],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/categories/${categorie.toLowerCase()}_icon.png'),
            Text(
              categorie,
              style: kGridTextStyle,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
