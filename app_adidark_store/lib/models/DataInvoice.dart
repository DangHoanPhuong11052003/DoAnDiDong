import 'package:app_adidark_store/models/Invoice.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ClassCartUser.dart';
import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';

class DataInvoice {
  Future<List<Invoice>> loadLocalInvoices() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? invoicesJson = prefs.getString('local_invoices');
    if (invoicesJson != null) {
      List<dynamic> invoicesMap = json.decode(invoicesJson);
      return invoicesMap.map((map) => Invoice.fromJson(map)).toList();
    }
    return [];
  }

  Future<void> saveLocalInvoices(List<Invoice> invoices) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String invoicesJson =
        json.encode(invoices.map((invoice) => invoice.toJson()).toList());
    prefs.setString('local_invoices', invoicesJson);
  }

  Future<List<Invoice>> loadInvoices(String acc) async {
    try {
      DatabaseReference invoiceRef =
          FirebaseDatabase.instance.ref().child('Invoice');

      DataSnapshot snapshot = (await invoiceRef.child(acc).once()).snapshot;

      List<Invoice> invoices = [];
      List<dynamic> values = snapshot.value as List<dynamic>;
      values.forEach((element) {
        invoices.add(Invoice.fromJson(element as Map<Object?, Object?>));
      });
      await saveLocalInvoices(invoices);
      return invoices;
    } catch (e) {
      print('Error loading invoices: $e');
      return [];
    }
  }

  Future<int> getNewId(String acc) async {
    DataSnapshot snapshot =
        await FirebaseDatabase.instance.ref().child("Invoice/$acc").get();
    List<Invoice> allCarts = [];
    int newId;
    List<dynamic> values = [];
    try {
      values = snapshot.value as List<dynamic>;
    } catch (e) {
      return 0;
    }
    for (var element in values) {
      allCarts.add(Invoice.fromJson(element as Map<Object?, Object?>));
    }
    newId = allCarts.last.id + 1;
    return newId;
  }
  Future<int> getMaxId(String acc) async {
    DataSnapshot snapshot =
        await FirebaseDatabase.instance.ref().child("Invoice/$acc").get();
    List<Invoice> allCarts = [];
    int newId;
    List<dynamic> values = [];
    try {
      values = snapshot.value as List<dynamic>;
    } catch (e) {
      return 0;
    }
    for (var element in values) {
      allCarts.add(Invoice.fromJson(element as Map<Object?, Object?>));
    }
    newId = allCarts.last.id;
    return newId;
  }

  Future<void> addInvoice(
      String status,
      int id,
      String acc,
      String date,
      String shipdate,
      double TotaPrice,
      String address,
      List<CartUser> invoiceDetails) async {
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

    for (var i = 0; i < invoiceDetails.length; i++) {
      final invoiceDetailReference =
          invoiceReference.child('ivoiceDetail/$i').set({
        "id": invoiceDetails[i].id,
        "color": invoiceDetails[i].color,
        "img": invoiceDetails[i].img,
        "manufacturer": invoiceDetails[i].manufucturer,
        "namePro": invoiceDetails[i].namePro,
        "quantity": invoiceDetails[i].quantity,
        "size": invoiceDetails[i].size,
        "idPro": invoiceDetails[i].idPro,
        "price": invoiceDetails[i].price,
        "cate": invoiceDetails[i].cate,
        "status": 0
      });
    }
  }

//load hoa don theo trang thai
  Future<List<Invoice>> loadInvoicesSTT(String acc, String status) async {
    try {
      DatabaseReference invoiceRef =
          FirebaseDatabase.instance.ref().child('Invoice');

      DataSnapshot snapshot = (await invoiceRef.child(acc).once()).snapshot;

      List<Invoice> invoices = [];
      List<dynamic> values = snapshot.value as List<dynamic>;
      values.forEach((element) {
        Invoice invoice = Invoice.fromJson(element as Map<Object?, Object?>);
        if (invoice.status == status) {
          // Kiểm tra trạng thái của hóa đơn
          invoices.add(invoice);
        }
      });
      return invoices;
    } catch (e) {
      print('Error loading invoices: $e');
      return [];
    }
  }

  Future<void> updateInvoiceStatus(String acc, int idInvoice, String status) async{
    DatabaseReference invoiceRef =
        FirebaseDatabase.instance.ref().child('Invoice').child(acc);
    invoiceRef.child(idInvoice.toString()).update({
      'status': status,
    }).then((value) {
      print('Cập nhật trạng thái thành công');
      updateLocalInvoiceStatus(idInvoice, status);
    }).catchError((error) {
      print('Lỗi khi cập nhật trạng thái: $error');
    });
  }
  Future<void> updateLocalInvoiceStatus(int IdInvoice, String status) async {
    List<Invoice> localInvoice = await loadLocalInvoices();
    for (var invoice in localInvoice) {
      if (invoice.id == IdInvoice) {
        invoice.status = status;
      }
    }
    await saveLocalInvoices(localInvoice);
  }

  static Future<List<Invoice>> getDataById(int id, String uid) async {
    try {
      DatabaseReference invoiceRef =
          FirebaseDatabase.instance.ref().child('Invoice');

      DataSnapshot snapshot = (await invoiceRef.child(uid).once()).snapshot;

      List<Invoice> invoices = [];
      List<dynamic> values = snapshot.value as List<dynamic>;
      values.forEach((element) {
        Invoice invoice = Invoice.fromJson(element as Map<Object?, Object?>);
        if (invoice.id == id) {
          invoices.add(Invoice.fromJson(element as Map<Object?, Object?>));
        }
      });
      return invoices;
    } catch (e) {
      print('Error loading invoices: $e');
      return [];
    }
  }
}
