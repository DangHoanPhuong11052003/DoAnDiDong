import 'package:app_adidark_store/models/ClassCategories.dart';
import 'package:app_adidark_store/models/category.dart';
import 'package:flutter/material.dart';
import 'package:app_adidark_store/items/Menufactory_Item.dart';

class ListMenufactorys extends StatelessWidget {
  const ListMenufactorys({super.key, required this.Menufactorys});
   final List<Category> Menufactorys;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      scrollDirection: Axis.horizontal,
      childAspectRatio: 0.60,
      crossAxisCount: 1,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(Menufactorys.length, (index) {
          return MenufactoryItem(menufactory: Menufactorys[index]);
        }),

    );
  }
}