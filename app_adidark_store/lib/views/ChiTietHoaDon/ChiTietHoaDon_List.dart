//import 'package:flutter/foundation.dart';
import 'package:app_adidark_store/models/ClassCartUser.dart';
import 'package:app_adidark_store/views/Gio_Hang/CartScreen.dart';
import 'package:flutter/material.dart';
import "ChiTietHoaDon_Item.dart";
import 'package:app_adidark_store/models/ClassInvoiceDetail.dart';
import 'package:app_adidark_store/models/DataInvoiceDetail.dart';
import 'package:firebase_auth/firebase_auth.dart';
class ChiTietHoaDon_List extends StatefulWidget {
  ChiTietHoaDon_List({super.key, required this.id});
  int id;
  

  @override
  State<ChiTietHoaDon_List> createState() => _ChiTietHoaDon_ListState();
}

class _ChiTietHoaDon_ListState extends State<ChiTietHoaDon_List> {
  List<InvoiceDetail> IvoiceDetails = [];
   List<CartUser> listcthhd = [];
   List<CartUser> listcthhd1 = [];

   User? user=FirebaseAuth.instance.currentUser;
   
 @override
  void initState() {
    super.initState();
   _fetchInvoiceDetail(user!.uid , widget.id).then((_) {
    _fetchLocalInvoiceDetail();
  });
  }

  Future<void> _fetchInvoiceDetail(String acc, int id) async {
    listcthhd = await DataInvoiceDetail().loadInvoiceDetails(acc, id);
    setState(() {});
  }
  Future<void> _fetchLocalInvoiceDetail() async {
    listcthhd1 = await DataInvoiceDetail().loadLocalInvoiceDetails();
    for(var ct in listcthhd1){
      print(ct.id);
      print(ct.namePro);
    }
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listcthhd1.length,
      itemBuilder: (context, index) {
        return ChiTietHoaDon_Item(invoicedetail: listcthhd1[index]);
      },
    );
  }
}