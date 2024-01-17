import 'package:app_adidark_store/models/Invoice.dart';
import 'package:app_adidark_store/models/ClassInvoiceDetail.dart';
import 'package:firebase_database/firebase_database.dart';

class DataInvoiceDetail {
  Future<List<InvoiceDetail>> loadInvoiceDetails(String acc, int id) async {
  try {
    DatabaseReference invoiceRef =
        FirebaseDatabase.instance.ref().child('Invoice').child(acc).child(id.toString());

    DataSnapshot snapshot = (await invoiceRef.once()).snapshot;

    List<InvoiceDetail> invoiceDetails = [];
    Map<Object?, Object?> invoiceData = snapshot.value as Map<Object?, Object?>;
    
    if (invoiceData != null && invoiceData.containsKey('ivoiceDetail')) {
      List<dynamic> detailsData = invoiceData['ivoiceDetail'] as List<dynamic>;
      for (var detailData in detailsData) {
        invoiceDetails.add(InvoiceDetail.fromJson(detailData as Map<Object?, Object?>));
      }
    }

    return invoiceDetails;
  } catch (e) {
    print('Error loading invoice details: $e');
    return [];
  }
}


}