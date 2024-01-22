import 'dart:convert';

import 'package:app_adidark_store/models/Invoice.dart';
import 'package:app_adidark_store/models/ClassInvoiceDetail.dart';
import 'package:app_adidark_store/models/DataCartUser.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:app_adidark_store/models/ClassCartUser.dart';
import 'package:shared_preferences/shared_preferences.dart';
class DataInvoiceDetail {
  Future<List<CartUser>> loadLocalInvoiceDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? invoiceDetailsJson = prefs.getString('local_invoice_details');
    if (invoiceDetailsJson != null) {
      List<dynamic> invoiceDetailsMap = json.decode(invoiceDetailsJson);
      return invoiceDetailsMap.map((map) => CartUser.fromJson(map)).toList();
    }
    return [];
  }

  Future<void> saveInvoiceDetailsToLocal(List<CartUser> invoiceDetails) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String invoiceDetailsJson = json.encode(invoiceDetails.map((invoiceDetail) => invoiceDetail.toJson()).toList());
    prefs.setString('local_invoice_details', invoiceDetailsJson);
  }
  
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
    await saveInvoiceDetailsToLocal(invoiceDetails);
    return invoiceDetails;
  } catch (e) {
    print('Error loading invoice details: $e');
    return [];
  }
}


}