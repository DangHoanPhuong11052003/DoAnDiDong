
import 'package:flutter/material.dart';
import 'HoaDon_Item.dart';
import 'package:app_adidark_store/models/Invoice.dart';
import 'package:app_adidark_store/models/DataInvoice.dart';
import 'HoaDon_Item.dart';

class HoaDon_List_All extends StatefulWidget {
  const HoaDon_List_All({super.key});

  @override
  State<HoaDon_List_All> createState() => _HoaDon_List_AllState();
}

class _HoaDon_List_AllState extends State<HoaDon_List_All> {
  List<Invoice> invoices = [];

  @override
  void initState() {
    super.initState();
    _fetchInvoices("123");
  }

  Future<void> _fetchInvoices(String acc) async {
    invoices = await DataInvoice().loadInvoices(acc);
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