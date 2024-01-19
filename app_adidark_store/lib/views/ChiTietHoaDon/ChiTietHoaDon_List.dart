//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import "ChiTietHoaDon_Item.dart";
import 'package:app_adidark_store/models/ClassInvoiceDetail.dart';
import 'package:app_adidark_store/models/DataInvoiceDetail.dart';
class ChiTietHoaDon_List extends StatefulWidget {
  ChiTietHoaDon_List({super.key, required this.id});
  int id;
  

  @override
  State<ChiTietHoaDon_List> createState() => _ChiTietHoaDon_ListState();
}

class _ChiTietHoaDon_ListState extends State<ChiTietHoaDon_List> {
  List<InvoiceDetail> IvoiceDetails = [];
   List<InvoiceDetail> listcthhd = [];
   
 @override
  void initState() {
    super.initState();
    _fetchInvoiceDetail("123", widget.id);
  }

  Future<void> _fetchInvoiceDetail(String acc, int id) async {
    listcthhd = await DataInvoiceDetail().loadInvoiceDetails(acc, id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listcthhd.length,
      itemBuilder: (context, index) {
        return ChiTietHoaDon_Item(invoicedetail: listcthhd[index]);
      },
    );
  }
}