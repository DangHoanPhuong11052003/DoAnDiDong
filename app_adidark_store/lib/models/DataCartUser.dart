import 'package:app_adidark_store/models/ClassCartUser.dart';
import 'package:firebase_database/firebase_database.dart';

class DataCartUser{
  //Lấy toàn bộ danh sách giỏ hàng theo tên tài khoản
  static Future<List<CartUser>> getData(String acc) async {
   DataSnapshot  snapshot = await FirebaseDatabase.instance
  .ref()
  .child("Cart/$acc/product")
  .get(); // to debug and see if data is returned

    List<CartUser> allCarts=[];
    List<CartUser> carts=[];
    List<dynamic> values = snapshot.value as List<dynamic>;
        values.forEach((element) {
          allCarts.add(CartUser.fromJson(element as Map<Object?,Object?>));
        });
        //chỉ lấy đơn hàng có status là 1(chưa bị xóa)
        allCarts.forEach((element) {
          if(element.status==1){
            carts.add(element);
          }
         });
        return carts;
  }

  //cập nhật lại một món hàng
  static Future<void> updateData(CartUser cartUser,String acc) async {
    final databaseReference = FirebaseDatabase.instance.ref();
    databaseReference.child('Cart/$acc/product/${cartUser.id}').update({
       "id": cartUser.id,
       "color": cartUser.color,
       "img": cartUser.img,
       "manufacturer": cartUser.manufucturer,
       "namePro": cartUser.namePro,
       "quantity": cartUser.quantity,
       "size": cartUser.size,
       "idPro": cartUser.idPro,
       "price":cartUser.price,
      "cate":cartUser.cate,
      "status":cartUser.status
    });
  }

  //tạo mới sản phẩm vào giỏ hàng
  static Future<void> CreateData(CartUser cartUser,String acc) async {
    final databaseReference = FirebaseDatabase.instance.ref();
    databaseReference.child('Cart/$acc/product/${cartUser.id}').set({
       "id": cartUser.id,
       "color": cartUser.color,
       "img": cartUser.img,
       "manufacturer": cartUser.manufucturer,
       "namePro": cartUser.namePro,
       "quantity": cartUser.quantity,
       "size": cartUser.size,
       "idPro": cartUser.idPro,
       "price":cartUser.price,
      "cate":cartUser.cate,
      "status":1
    });
  }
}