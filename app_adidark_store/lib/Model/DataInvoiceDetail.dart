import 'package:app_adidark_store/models/Invoice.dart';
import 'package:app_adidark_store/models/ClassInvoiceDetail.dart';
import 'package:app_adidark_store/models/DataCartUser.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:app_adidark_store/models/ClassCartUser.dart';

class DataInvoiceDetail {
  Future<List<CartUser>> loadInvoiceDetails(String acc, int id) async {
  try {
    DatabaseReference invoiceRef =
        FirebaseDatabase.instance.ref().child('Invoice').child(acc).child(id.toString());

    DataSnapshot snapshot = (await invoiceRef.once()).snapshot;

    List<CartUser> invoiceDetails = [];
    Map<Object?, Object?> invoiceData = snapshot.value as Map<Object?, Object?>;
    
    if (invoiceData != null && invoiceData.containsKey('ivoiceDetail')) {
      List<dynamic> detailsData = invoiceData['ivoiceDetail'] as List<dynamic>;
      for (var detailData in detailsData) {
        invoiceDetails.add(CartUser.fromJson(detailData as Map<Object?, Object?>));
      }
    }

    return invoiceDetails;
  } catch (e) {
    print('Error loading invoice details: $e');
    return [];
  }
}

  //tạo mới sản phẩm vào giỏ hàng
  static Future<void> CreateData(int id, int idpro,String color, String img, String manu, String cate, String namepro, int quantity,int size, double price, String acc) async {
    final databaseReference = FirebaseDatabase.instance.ref();
    databaseReference.child('Cart/$acc/product/${id}').set({
       "id": id,
       "color": color,
       "img": img,
       "manufacturer": manu,
       "namePro": namepro,
       "quantity": quantity,
       "size": size,
       "idPro": idpro,
       "price": price,
      "cate":cate,
      "status":1
    });
  }



}