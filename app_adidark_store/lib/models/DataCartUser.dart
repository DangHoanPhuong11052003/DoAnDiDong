import 'package:app_adidark_store/models/ClassCartUser.dart';
import 'package:firebase_database/firebase_database.dart';

class DataCartUser{
  //Lấy toàn bộ danh sách giỏ hàng theo tên tài khoản
  static Future<List<CartUser>> getData(String acc) async {
   DataSnapshot  snapshot = await FirebaseDatabase.instance
  .ref()
  .child("Cart/$acc/product")
  .get();

    List<CartUser> allCarts=[];
    List<CartUser> carts=[];
    List<dynamic> values =[];
    try{
      values= snapshot.value as List<dynamic>;
    }
    catch(e){
      return carts;
    }
        for (var element in values) {
          allCarts.add(CartUser.fromJson(element as Map<Object?,Object?>));
        }
        //chỉ lấy đơn hàng có status là 1(chưa bị xóa)
        for (var element in allCarts) {
          if(element.status==1){
            carts.add(element);
          }
         }
        return carts;
  }

  //Tạo id mới cho cho giỏ hàng mới
  static Future<int> getNewId(String acc) async {
   DataSnapshot  snapshot = await FirebaseDatabase.instance
  .ref()
  .child("Cart/$acc/product")
  .get(); // to debug and see if data is returned

    List<CartUser> allCarts=[];
    int newId;
    List<dynamic> values=[];
    try{
      values = snapshot.value as List<dynamic>;
    }catch(e){
      return 0;
    }
        for (var element in values) {
          allCarts.add(CartUser.fromJson(element as Map<Object?,Object?>));
        }
        //chỉ lấy đơn hàng có status là 1(chưa bị xóa)
        newId=allCarts.last.id+1;
        return newId;
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

  //Kiểm tra giỏ hàng của người dùng đã tồn tại chưa
  static Future<bool> checkUs(String acc) async {
   DataSnapshot  snapshot = await FirebaseDatabase.instance
  .ref()
  .child("Cart")
  .get();

    Map<dynamic,dynamic> values = snapshot.value as Map<dynamic,dynamic>;
    for( String key in values.keys){
      if(key==acc){
        return true;
      }
    }
    return false;
  }


  //Tạo mới id giỏ hàng cho người dùng mới
  static Future<int> getNewIdCart() async {
   DataSnapshot  snapshot = await FirebaseDatabase.instance
  .ref()
  .child("Cart")
  .get();

    Map<dynamic,dynamic> values = snapshot.value as Map<dynamic,dynamic>;
    return values.length;
  }

  //Tạo mới giỏ hàng cho người dùng mới
  static Future<void> createNewCartUS(String acc) async {
    final databaseReference = FirebaseDatabase.instance.ref();
    databaseReference.child('Cart/$acc').set({
       "id":1,
       "product":List.empty()
    });
  }
}