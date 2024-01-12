import 'package:flutter/material.dart';
import 'package:app_adidark_store/Testdata/component/Product_Item.dart';
import 'package:app_adidark_store/Testdata/model/product.dart';
class ListProduct extends StatelessWidget {
  const ListProduct({super.key, required this.products});
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.60,
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(4, (index) {
          return ProductItem(product: products[index]);
        }),

    );
  }
}
