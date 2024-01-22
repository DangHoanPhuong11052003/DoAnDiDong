
import 'package:flutter/material.dart';
import 'HoaDon_Item.dart';
import 'package:app_adidark_store/models/Invoice.dart';
import 'package:app_adidark_store/models/DataInvoice.dart';
import 'package:firebase_auth/firebase_auth.dart';


class HoaDon_List_All extends StatefulWidget {
  const HoaDon_List_All({super.key});

  @override
  State<HoaDon_List_All> createState() => _HoaDon_List_AllState();
}

class _HoaDon_List_AllState extends State<HoaDon_List_All> {
  List<Invoice> invoices = [];
  List<Invoice> invoicesLoCal = [];
  User? user=FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    _fetchInvoice(user!.uid);
    _fetchLocalInvoice(user!.uid);
  }

  Future<void> _fetchInvoice(String acc) async {
    invoices = await DataInvoice().loadInvoices(acc);
    setState(() {});
  }
  Future<void> _fetchLocalInvoice(String acc) async {
    invoicesLoCal = await DataInvoice().loadLocalInvoices();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: invoicesLoCal.length,
      itemBuilder: (context, index) {
        return HoaDon_Item(invoice: invoicesLoCal[index]);
      },
    );
  }
}