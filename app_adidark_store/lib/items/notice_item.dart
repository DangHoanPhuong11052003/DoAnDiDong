import 'package:app_adidark_store/models/ClassCategories.dart';
import 'package:app_adidark_store/models/ClassManufacturer.dart';
import 'package:app_adidark_store/models/ClassProduct.dart';
import 'package:app_adidark_store/models/DataInvoice.dart';
import 'package:app_adidark_store/models/DataProduct.dart';
import 'package:app_adidark_store/models/Invoice.dart';
import 'package:app_adidark_store/views/ChiTietHoaDon/ChiTietHoaDon_Screen.dart';
import 'package:app_adidark_store/views/ChiTiet_SanPham/ProDetailScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NoticeItem extends StatefulWidget {
  const NoticeItem({
    super.key,
    this.idProduct = -1,
    this.idInvoice = -1,
    required this.status,
    required this.time,
    required this.title,
    required this.content,
    this.isLogin = true,
  });

  final int idProduct, idInvoice;
  final String title, time, content;
  final bool status, isLogin; //true: PrivateNotice, false: MainNotice

  @override
  State<NoticeItem> createState() => _NoticeItemState();
}

class _NoticeItemState extends State<NoticeItem> {
  final _user = FirebaseAuth.instance.currentUser;

  Product pro = Product(
    cate: Categories(id: -1, name: "", status: false),
    detail: Map(),
    id: -1,
    img: List.empty(),
    manu: Manufacturer(id: -1, name: "", status: false),
    name: "",
    price: 0,
    quantity: 0,
    status: 0,
    infor: "",
  );

  List<Invoice> inv = [];

  Future<void> getData() async {
    if (widget.isLogin && widget.idInvoice != -1) {
      List<Invoice> invoice =
          await DataInvoice.getDataById(widget.idInvoice, _user!.uid);

      inv = invoice;
    }

    if (widget.idProduct != -1) {
      Product product = await DataProduct.getDataById(widget.idProduct);
      pro = product;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 10,
                child: CircularProgressIndicator(),
              ),
            );
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return GestureDetector(
                onTap: () {
                  if (widget.status) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ChiTietHoaDon_Screen(invoice: inv.first)));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProDetailScreen(idPro: pro.id)));
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Container(
                    child: Row(
                      children: [
                        if (!widget.status)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 2, 18, 2),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                pro.img[0].link,
                                width: MediaQuery.of(context).size.width / 6,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        if (widget.status)
                          Padding(
                              padding: const EdgeInsets.fromLTRB(10, 2, 18, 2),
                              child: Icon(
                                Icons.list_alt,
                                size: MediaQuery.of(context).size.width / 6,
                              )),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.title,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    widget.content,
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  widget.time,
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.grey),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
        }
      },
    );
  }
}
