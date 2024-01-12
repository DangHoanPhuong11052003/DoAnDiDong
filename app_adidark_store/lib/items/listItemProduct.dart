import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import "ItemProduct.dart";

class ListItemProduct extends StatefulWidget {
  const ListItemProduct({super.key});

  @override
  State<ListItemProduct> createState() => _ListItemProductState();
}

class _ListItemProductState extends State<ListItemProduct> {
  @override
  Widget build(BuildContext context) {
     return GridView.count(
      childAspectRatio: 0.60,
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        ItemProduct(),
        ItemProduct(),
        ItemProduct(),
        ItemProduct(),
        ItemProduct(),
        ItemProduct(),

      ],

    );
  }
}