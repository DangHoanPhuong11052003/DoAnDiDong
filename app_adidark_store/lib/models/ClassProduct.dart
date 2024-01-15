import 'package:app_adidark_store/models/ClassCategories.dart';
import 'package:app_adidark_store/models/ClassDetailProduct.dart';
import 'package:app_adidark_store/models/ClassImgProduct.dart';
import 'package:app_adidark_store/models/ClassManufacturer.dart';

class Product{
  final Map<String, List<DetailProduct>> detail;
  int id;
  Categories cate;
  List<ImgProduct> img;
  Manufacturer manu;
  String name;
  double price;
  int quantity;
  int status;
  String infor;

  Product({required this.cate,required this.detail,required this.id,required this.img,required this.manu,required this.name,required this.price,required this.quantity,required this.status,required this.infor});

  factory Product.fromJson(Map<dynamic, dynamic> json) {
    List<DetailProduct> lstDetail=[];
    Map<String, List<DetailProduct>> data={};
    Map<dynamic,dynamic> values = json['detail'] as Map<dynamic,dynamic>;
    values.forEach((key1, value1) {
      lstDetail.clear();
      for(var vl in value1){
         lstDetail.add(DetailProduct.fromJson(vl as Map<dynamic, dynamic>));
      }
      data.addAll({key1.toString():lstDetail});
    });
    return Product(
      id: json['id'],
      name: json['name'],
      price: double.parse(json['price'].toString()),
      quantity: json['quantity'],
      detail: data,
      cate: Categories.fromJson(json['cate']),
      manu: Manufacturer.fromJson(json['manu']),
      img: List<ImgProduct>.from(json['img'].map((x) => ImgProduct.fromJson(x))),
      status: json['status'],
      infor:json['infor']
    );
  }
}