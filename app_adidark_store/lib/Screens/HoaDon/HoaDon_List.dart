//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'HoaDon_Item.dart';
import 'package:app_adidark_store/models/Invoice.dart';
import 'package:app_adidark_store/models/DataInvoice.dart';
import 'HoaDon_Item.dart';
class HoaDon_List extends StatefulWidget {
  HoaDon_List({super.key, required this.trangthai});
  String trangthai;

  @override
  State<HoaDon_List> createState() => _HoaDon_ListState();
}

class _HoaDon_ListState extends State<HoaDon_List> {
  List<Invoice> invoices = [];

  @override
  void initState() {
    super.initState();
    _fetchInvoices("123", widget.trangthai);
  }

  Future<void> _fetchInvoices(String acc, String stt) async {
    invoices = await DataInvoice().loadInvoicesSTT(acc, stt);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: invoices.length,
      itemBuilder: (context, index) {
        return HoaDon_Item(invoice: invoices[index]);
      },
    );
  }
}