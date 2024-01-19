
import 'package:app_adidark_store/models/category.dart';

class Product {
  final int id;
  final String name;
  final String url;
  final int price;
  final int? promotion;
  final Category cat;
  Product({
    required this.id,
    required this.name,
    required this.url,
    required this.price,
    required this.promotion,
    required this.cat,
  });

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        url = json['url'],
        price = json['price'],
        promotion = json['promotion'],
        cat = Category.fromJson(json['cat']);
}

