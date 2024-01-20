import 'package:app_adidark_store/models/ClassProduct.dart';
import 'package:firebase_database/firebase_database.dart';

class DataProduct{

  static Future<List<Product>> getAllData() async {
   DataSnapshot  snapshot = await FirebaseDatabase.instance
  .ref()
  .child("Products")
  .get();

    List<Product> allPro=[];
    List<Product> prosducts=[];
    List<dynamic> values = snapshot.value as List<dynamic>;
        values.forEach((element) {
          allPro.add(Product.fromJson(element as Map<dynamic,dynamic>));
        });
        //chỉ lấy sản phẩm có status là 1(chưa bị xóa)
        allPro.forEach((element) {
          if(element.status==1){
            prosducts.add(element);
          }
         });
        return prosducts;
  }

  static Future getDataById(int id) async {
   DataSnapshot  snapshot = await FirebaseDatabase.instance
  .ref()
  .child("Products").child(id.toString())
  .get();

    List<Product> allPro=[];
    var prosduct;
    Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
    prosduct=Product.fromJson(values);
    return prosduct;
  }


  static Future<int> getQuanPro(int id,String color,int idSize,) async {
   DataSnapshot  snapshot = await FirebaseDatabase.instance
  .ref()
  .child("Products/$id/detail/$color/$id/size")
  .get();

    int quantity;
    quantity = snapshot.value as int;
    return quantity;
  }
}