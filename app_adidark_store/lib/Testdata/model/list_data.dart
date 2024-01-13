import 'dart:convert';
import 'package:app_adidark_store/Testdata/model/category.dart';
import 'package:app_adidark_store/Testdata/model/info_reader.dart';
import 'package:app_adidark_store/Testdata/model/product.dart';

class ListData {
  static List<Category> categories = [];
  static List<Product> products = [];

  static Future<void> loadData() async {
    InfoReader reader = InfoReader();
    String s = await reader.readData();
    Map<String, dynamic> data = jsonDecode(s);
    products = List<Product>.from(
        (data['products'] as List).map((e) => Product.fromJson(e)));
    categories = List<Category>.from(
        (data['catgories'] as List).map((e) => Category.fromJson(e)));
  }
}
