import 'package:app_adidark_store/models/Invoice.dart';
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
        invoices.add(Invoice.fromJson(element as Map<Object?, Object?>));
      });
      return invoices;
    } catch (e) {
      print('Error loading invoices: $e');
      return [];
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

  void updateInvoiceStatus(String acc, int idInvoice, String status) {
    DatabaseReference invoiceRef =
        FirebaseDatabase.instance.ref().child('Invoice').child(acc);
    invoiceRef.child(idInvoice.toString()).update({
      'status': status,
    }).then((value) {
      print('Cập nhật trạng thái thành công');
    }).catchError((error) {
      print('Lỗi khi cập nhật trạng thái: $error');
    });
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
