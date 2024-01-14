import 'package:flutter/material.dart';
import 'package:app_adidark_store/Testdata/model/category.dart';
class MenufactoryItem extends StatelessWidget {
  const MenufactoryItem({super.key ,required this.menufactory});
  final  Category menufactory;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF6F6F6), 
      ),
      child: Text(menufactory.name),
    );
  }
}