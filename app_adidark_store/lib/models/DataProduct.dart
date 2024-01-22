
import 'package:app_adidark_store/models/ClassProduct.dart';
import 'package:firebase_database/firebase_database.dart';

class DataProduct{
   static Future<List<String>> getDetailKeysById(int id) async {
    DataSnapshot snapshot = await FirebaseDatabase.instance
        .ref()
        .child("Products/$id/detail")
        .get();

    Map<String, dynamic> detailData = snapshot.value as Map<String, dynamic>;

    List<String> detailKeys = detailData.keys.toList();

    return detailKeys;
  }

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
  .child("Products/$id")
  .get();

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
  
void updateItem(int id, String brand, int size, int newQuantity) async {
  final productRef = FirebaseDatabase.instance.ref().child('Products/$id/detail/$brand');
  DataSnapshot snapshot = (await productRef.once()).snapshot;
  if (snapshot.value is List) {
    List<dynamic> list = snapshot.value as List<dynamic>;
    for (int i = 0; i < list.length; i++) {
      if (list[i]['size'] == size) {
        DatabaseReference itemRef = productRef.child(i.toString());
        int currentQuantity = list[i]['quantity'];
        int updatedQuantity = currentQuantity - newQuantity;
        itemRef.update({
          'quantity': updatedQuantity,
        });
      }
    }
  } else {
    print('snapshot.value khong phai laList');
  }
}
// void updateItemCancel(String user,int id, int size, String color, int newQuantity) async {
//   final productRef = FirebaseDatabase.instance.ref().child('Invoice/$user/$id/ivoiceDetail');
//    List<String> detailKeys = await getDetailKeysById(id);
//   DataSnapshot snapshot = (await productRef.once()).snapshot;
//   if (snapshot.value is List) {
//     List<dynamic> list = snapshot.value as List<dynamic>;
//     for (int i = 0; i < list.length; i++) {
//       if ( list[i]['size'] == size && detailKeys.contains(list[i]['color']) ) {
//         DatabaseReference itemRef = productRef.child(i.toString());
//         int currentQuantity = list[i]['quantity'];
//         int updatedQuantity = currentQuantity + newQuantity;
//         itemRef.update({
//           'quantity': updatedQuantity,
//         });
//       }
//     }
//   } else {
//     print('snapshot.value khong phai laList');
//   }
// }

  
  
}