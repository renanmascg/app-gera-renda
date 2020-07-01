import 'package:flutter/material.dart';
import 'package:flutter_gera_renda/core/shared/styles/colors.dart';
import 'package:flutter_gera_renda/core/shared/widgets/simple_widgets.dart';

import '../../../../../core/shared/styles/text_styles.dart';
import '../../../../../core/shared/widgets/sliver_main_header_widget.dart';


class SearchFoundPage extends StatelessWidget {
  static final String id = 'search_found_page';

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kMainBackground,
          child: CustomScrollView(
        slivers: <Widget>[
          _buildAppBar(),
          buildListOfServices(context)
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverMainHeader(
      title: TextField(
        onSubmitted: (str) => print(str),
        decoration: InputDecoration(
          hintText: 'Nome da Loja',
          prefixIcon: Image.asset('assets/search.png'),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: SizedBox(
          height: 50,
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
}
