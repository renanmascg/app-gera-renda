import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/network/status_page.dart';
import '../../../../../core/shared/styles/colors.dart';
import '../../../../../core/shared/styles/text_styles.dart';
import '../../../../../core/shared/widgets/service_item_widget.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/categorie_model.dart';
import '../../mobx/single_categorie/single_categorie_store.dart';
import '../04_single_service_page/single_service_page.dart';

class CategoriePage extends StatefulWidget {
  static final String id = 'categorie_page';

  final CategorieModel category;

  const CategoriePage({this.category});

  @override
  _CategoriePageState createState() => _CategoriePageState();
}

class _CategoriePageState extends State<CategoriePage> {
  final SingleCategorieStore _store = serviceLocator<SingleCategorieStore>();

  @override
  void initState() {
    super.initState();

    _store.categoryId = super.widget.category.sId;

    _store.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (ctx) {
        if (_store.statusPage != StatusPage.NORMAL) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return Scaffold(
          backgroundColor: kMainBackground,
          appBar: _buildAppBar(context),
          body: _buildBody(context),
        );
      },
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(super.widget.category.name,
          style: kBoldTextStyle.copyWith(fontSize: 22)),
      centerTitle: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.maybePop(context),
        icon: Icon(Icons.arrow_back),
        color: kMainTextBoldColor,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(30.0),
        child: SizedBox(
          height: 30,
          width: double.infinity,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              SizedBox(width: 20),
              _buildChip('Filtrar'),
              SizedBox(width: 10),
              _buildChip('Ordenar')
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChip(String text) {
    return Chip(
      label: Text(
        text,
        style: kChipTextStyle,
      ),
      padding: EdgeInsets.all(5),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(kMainButtonBorderRadius)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5, right: 15, left: 15),
      child: ListView(
        children: _store.services.map((service) {
          return ServiceItemWidget(
            onTap: () => Navigator.pushNamed(context, SingleServicePage.id),
            service: service,
          );
        }).toList(),
      ),
    );
  }
}
