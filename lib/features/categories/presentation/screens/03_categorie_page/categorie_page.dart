import 'package:flutter/material.dart';

import '../../../../../core/shared/colors.dart';
import '../../../../../core/shared/styles.dart';
import '../../styles/colors.dart';
import '../../styles/text_styles.dart';
import '../../widgets/service_item_widget.dart';

class CategoriePage extends StatelessWidget {
  static final String id = 'categorie_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainBackground,
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Pet', style: kBoldTextStyle.copyWith(fontSize: 22)),
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

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.only(top: 5),
          child: ListView(
        children: List.generate(10, (index) {
          return ServiceItemWidget();
        }),
      ),
    );
  }
}
