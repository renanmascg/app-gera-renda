import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/shared/styles/colors.dart';
import '../../../../core/shared/styles/text_styles.dart';

class MainProfilePage extends StatelessWidget {
  static final String id = 'main_profile_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildListOptions(context),
      ),
    );
  }

  Widget _buildListOptions(BuildContext context) {
    return Column(
      children: ListTile.divideTiles(
        context: context,
        color: kTextSecondaryGreyColor.withOpacity(0.5),
        tiles: [
          _buildItem(FontAwesomeIcons.user, 'Editar Perfil'),
          _buildItem(FontAwesomeIcons.heart, 'Favoritos'),
          _buildItem(FontAwesomeIcons.questionCircle, 'Ajuda'),
          _buildItem(Icons.info_outline, 'Sobre'),
          _buildItem(FontAwesomeIcons.bullhorn, 'Anuncie Conosco'),
        ],
      ).toList(),
    );
  }

  Widget _buildItem(IconData icon, String text) {
    return ListTile(
      leading: Icon(
        icon,
        color: kMainTextBoldColor,
      ),
      title: Text(
        text,
        style: kMainTextRegular,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: kMainTextBoldColor,
        size: 20,
      ),
    );
  }
}
