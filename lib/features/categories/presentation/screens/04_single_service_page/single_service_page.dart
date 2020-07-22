import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/network/status_page.dart';
import '../../../../../core/shared/styles/colors.dart';
import '../../../../../core/shared/styles/text_styles.dart';
import '../../../../../core/shared/widgets/simple_widgets.dart';
import '../../../../../core/shared/widgets/sliver_main_header_widget.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/service_full_info/day_model.dart';
import '../../mobx/single_service/single_service_store.dart';
import '../05_all_reviews/all_reviews_page.dart';

class SingleServicePage extends StatefulWidget {
  static final String id = 'single_service';

  final String serviceId;

  const SingleServicePage({this.serviceId});

  @override
  _SingleServicePageState createState() => _SingleServicePageState();
}

class _SingleServicePageState extends State<SingleServicePage> {
  final SingleServiceStore _store = serviceLocator<SingleServiceStore>();

  @override
  void initState() {
    super.initState();

    _store.fetchData(super.widget.serviceId);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (ctx) {
        if (_store.statusPage != StatusPage.NORMAL) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return Container(
          color: kMainBackground,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverMainHeader(title: Container()),
              _buildHeaderServiceInfo(),
              buildTextTitle('Descrição'),
              _buildDescriptionText(_store.serviceFullInfo.descricao),
              buildExpandedTitle(
                'Horário de Funcionamento',
                _buildOpeningHourInfo(),
              ),
              buildTextTitle('Serviços'),
              _buildServiceList(),
              buildTextWithRedirect('Avaliações',
                  () => Navigator.pushNamed(context, AllReviewsPage.id)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeaderServiceInfo() {
    return SliverPadding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              _store.serviceFullInfo.name,
              style: kBoldTextStyle,
            ),
            SizedBox(height: 5),
            Row(
              children: <Widget>[_buildWorkReviewItems(), _buildContactInfo()],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildWorkReviewItems() {
    return Expanded(
      flex: 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildListItemDetailText('124', 'TRABALHOS'),
          SizedBox(width: 10),
          _buildListItemDetailText('300', 'AVALIAÇÕES'),
          SizedBox(width: 10),
          _buildStarRatingIcon('RATING', '3.8')
        ],
      ),
    );
  }

  Widget _buildListItemDetailText(String text, String title,
      {Color color = kMainTextBoldColor}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: kSecondaryTextStyle.copyWith(fontSize: 10),
          textAlign: TextAlign.start,
        ),
        Text(
          text,
          style: kMainTextSemiBold.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: color,
          ),
        )
      ],
    );
  }

  Widget _buildContactInfo() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildIconButton('phone', () {}),
          SizedBox(width: 15),
          _buildIconButton('message-circle', () {})
        ],
      ),
    );
  }

  Widget _buildIconButton(String text, void Function() onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          radius: 25,
          backgroundColor: kBackgroundIconColor,
          child: Image.asset('assets/service_page/$text.png'),
        ),
      ),
    );
  }

  Widget _buildStarRatingIcon(String title, String rating) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: kSecondaryTextStyle.copyWith(fontSize: 10),
          textAlign: TextAlign.start,
        ),
        Row(
          children: <Widget>[
            Image.asset('assets/star_icon.png'),
            SizedBox(width: 5),
            Text(
              rating,
              style: kMainTextSemiBold.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: kMainTextBoldColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDescriptionText(String text) {
    return SliverPadding(
      padding: EdgeInsets.only(right: 20, left: 20, bottom: 20),
      sliver: SliverToBoxAdapter(
        child: Text(text, style: kMainTextRegular),
      ),
    );
  }

  List<Widget> _buildOpeningHourInfo() {
    return [
      _buildHorarioFuncionamentoElement(
          'Segunda', _store.serviceFullInfo.horarioFuncionamento.seg),
      _buildHorarioFuncionamentoElement(
          'Terça', _store.serviceFullInfo.horarioFuncionamento.ter),
      _buildHorarioFuncionamentoElement(
          'Quarta', _store.serviceFullInfo.horarioFuncionamento.qua),
      _buildHorarioFuncionamentoElement(
          'Quinta', _store.serviceFullInfo.horarioFuncionamento.qui),
      _buildHorarioFuncionamentoElement(
          'Sexta', _store.serviceFullInfo.horarioFuncionamento.sex),
      _buildHorarioFuncionamentoElement(
          'Sabado', _store.serviceFullInfo.horarioFuncionamento.sab),
      _buildHorarioFuncionamentoElement(
          'Domingo', _store.serviceFullInfo.horarioFuncionamento.dom),
    ];
  }

  Widget _buildHorarioFuncionamentoElement(String text, Day dia) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          text,
          style: kMainTextRegular,
        ),
        Text(
          dia.isOpen ? '${dia.start}h00 - ${dia.end}h00' : 'Fechado',
          style: kMainTextRegular,
        )
      ],
    );
  }

  Widget _buildServiceList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (ctx, index) {
          final servItem = _store.serviceFullInfo.services[index];
          return _listItem(
            servItem.name,
            servItem.description,
            servItem.value,
          );
        },
        childCount: _store.serviceFullInfo.services.length,
      ),
    );
  }

  Widget _listItem(String title, String description, num value) {
    return Container(
      padding: EdgeInsets.only(right: 20, left: 20),
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: kMainTextRegular,
                ),
                Text(
                  description,
                  style: kMainTextSubtitleRegular,
                ),
              ],
            ),
          ),
          SizedBox(width: 5),
          Align(
            alignment: Alignment.center,
            child: Text(
              'R\$ ${value.toStringAsFixed(2)}',
              style: kMainTextRegular,
            ),
          )
        ],
      ),
    );
  }
}
