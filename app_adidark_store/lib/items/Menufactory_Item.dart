
import 'package:app_adidark_store/models/ClassCategories.dart';
import 'package:app_adidark_store/models/category.dart';
import 'package:flutter/material.dart';
class MenufactoryItem extends StatelessWidget {
  const MenufactoryItem({super.key ,required this.menufactory});
  final Category menufactory;

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