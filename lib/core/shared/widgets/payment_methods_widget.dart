import 'package:flutter/material.dart';

import '../../../features/categories/data/models/service_full_info/formas_pagamento_model.dart';
import '../styles/colors.dart';
import '../styles/text_styles.dart';

class PaymentMethodsWidget extends StatelessWidget {
  final FormasPagamento formasPagamento;

  const PaymentMethodsWidget({@required this.formasPagamento});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Visibility(
          visible: formasPagamento.dinheiro,
          child: Align(
              alignment: Alignment.centerLeft,
              child: Chip(
                label: Text('Dinheiro', style: kChipTextStyle),
              )),
        ),
        _buildPaymentMethod(formasPagamento.debito, 'Cartão de Débito'),
        _buildPaymentMethod(formasPagamento.credito, 'Cartão de Crédito'),
        _buildPaymentMethod(formasPagamento.refeicao, 'Vale Refeição'),
      ],
    );
  }

  Widget _buildPaymentMethod(List<String> lista, String title) {
    return Visibility(
      visible: lista.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            title,
            style: kMainTextSubtitleRegular.copyWith(fontSize: 15),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Divider(color: kMainTextBoldColor.withOpacity(0.5))),
          Row(
            children: lista.map((e) {
              return Row(
                children: <Widget>[
                  Chip(label: Text(e, style: kChipTextStyle)),
                  SizedBox(
                    width: 10,
                  )
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
