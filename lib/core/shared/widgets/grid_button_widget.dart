import 'package:flutter/material.dart';

import '../../../features/categories/data/models/categorie_model.dart';
import '../../../features/categories/presentation/screens/03_categorie_page/categorie_page.dart';
import '../styles/text_styles.dart';

class GridButtonWidget extends StatelessWidget {
  final CategorieModel categorie;

  const GridButtonWidget({this.categorie});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(0),
      onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoriePage(category: categorie),
          )),
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
            Expanded(
              flex: 2,
              child: Image.network(
                categorie.imageUrl,
                height: 60,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Text(
                categorie.name,
                style: kGridTextStyle,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
