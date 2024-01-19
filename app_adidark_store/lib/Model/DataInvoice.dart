import 'dart:ffi';

import 'package:app_adidark_store/models/Invoice.dart';
import 'package:app_adidark_store/models/ClassCartUser.dart';
import 'package:firebase_database/firebase_database.dart';

class DataInvoice {
  //load tat ca hoa don
  Future<List<Invoice>> loadInvoices(String acc) async {
    try {
      DatabaseReference invoiceRef =
          FirebaseDatabase.instance.ref().child('Invoice');

      DataSnapshot snapshot = (await invoiceRef.child(acc).once()).snapshot;

      List<Invoice> invoices = [];
      List<dynamic> values = snapshot.value as List<dynamic>;
      values.forEach((element) {
        invoices.add(Invoice.fromJson(element as Map<Object?,Object?>));
      });
      return invoices;
    } catch (e) {
      print('Error loading invoices: $e');
      return [];
    }
  }
  Future <void> addInvoice(String status,int id,String acc, String date,String shipdate, double TotaPrice , String address, List<CartUser> invoiceDetails) async {
    final databaseReference = FirebaseDatabase.instance.ref();
    final invoiceReference = databaseReference.child('Invoice/$acc/$id');
    invoiceReference.set({
      'address': address,
      'date': date,
      'id': id,
      'shipdate': shipdate,
      'totalPrice': TotaPrice.toString(),
      'status': status          
    });
     for (var i=0;i<invoiceDetails.length; i++) {
          final invoiceDetailReference =  invoiceReference.child('ivoiceDetail/$i').set({
            "id": invoiceDetails[i].id,
            "color": invoiceDetails[i].color,
            "img": invoiceDetails[i].img,
            "manufacturer": invoiceDetails[i].manufucturer,
            "namePro": invoiceDetails[i].namePro,
            "quantity": invoiceDetails[i].quantity,
            "size": invoiceDetails[i].size,
            "idPro": invoiceDetails[i].idPro,
            "price":invoiceDetails[i].price,
            "cate":invoiceDetails[i].cate,
            "status":1
          });
     }
    
  }
  //load hoa don the trang thai
  Future<List<Invoice>> loadInvoicesSTT(String acc, String status) async {
    try {
      DatabaseReference invoiceRef =
          FirebaseDatabase.instance.ref().child('Invoice');

      DataSnapshot snapshot = (await invoiceRef.child(acc).once()).snapshot;

      List<Invoice> invoices = [];
      List<dynamic> values = snapshot.value as List<dynamic>;
      values.forEach((element) {
        Invoice invoice = Invoice.fromJson(element as Map<Object?,Object?>);
        if (invoice.status == status) {
          invoices.add(invoice);
        }
      });
      return invoices;
    } catch (e) {
      print('Error loading invoices: $e');
      return [];
    }
  }
  
<<<<<<< Updated upstream:app_adidark_store/lib/Model/DataInvoice.dart
  
=======
  Future<int> getMaxId(String acc) async {
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('Invoice').child(acc);
  DatabaseEvent event = await reference.orderByChild('id').limitToLast(1).once();
  
  if (event.snapshot != null) {
    DataSnapshot dataSnapshot = event.snapshot;
    Map<dynamic, dynamic> map = dataSnapshot.value as Map<dynamic, dynamic> ;  
    if (map != null && map.isNotEmpty) {
      dynamic key = map.keys.first;
      int maxId = map[key]['id'];
      return maxId;
    }
  }

  return 0; // Hoặc giá trị mặc định khác tùy thuộc vào yêu cầu của bạn.
}
>>>>>>> Stashed changes:app_adidark_store/lib/models/DataInvoice.dart

   Future<int> getNewId(String acc) async {
   DataSnapshot  snapshot = await FirebaseDatabase.instance
  .ref()
  .child("Invoice/$acc")
  .get();
    List<Invoice> allCarts=[];
    int newId;
    List<dynamic> values=[];
    try{
      values = snapshot.value as List<dynamic>;
    }catch(e){
      return 0;
    }
        for (var element in values) {
          allCarts.add(Invoice.fromJson(element as Map<Object?,Object?>));
        }  
        newId=allCarts.last.id+1;
        return newId;
  }
   void updateInvoiceStatus(String acc , int idInvoice,String status) {
   DatabaseReference invoiceRef = FirebaseDatabase.instance.ref().child('Invoice').child(acc);
    invoiceRef.child(idInvoice.toString()).update({
      'status': status,
    }).then((value) {
      print('Cập nhật trạng thái thành công');
    }).catchError((error) {
      print('Lỗi khi cập nhật trạng thái: $error');
    });
  }
}