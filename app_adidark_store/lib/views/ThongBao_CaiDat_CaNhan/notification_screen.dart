import 'package:app_adidark_store/items/notice_item.dart';
import 'package:app_adidark_store/models/ClassMainNotice.dart';
import 'package:app_adidark_store/models/ClassPrivateNotice.dart';
import 'package:app_adidark_store/models/ClassProduct.dart';
import 'package:app_adidark_store/models/DataInvoice.dart';
import 'package:app_adidark_store/models/DataNotification..dart';
import 'package:app_adidark_store/models/DataProduct.dart';
import 'package:app_adidark_store/models/Invoice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key, required this.isLogin});

  final bool isLogin;

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  DatabaseReference _database = FirebaseDatabase.instance.ref();

  final _user = FirebaseAuth.instance.currentUser;

  List<PrivateNotice> lstPrivate = [];
  List<MainNotice> lstMain = [];

  Future<void> getPrivateData() async {
    List<PrivateNotice> lstP =
        await DataNotification.getPrivateData(_user!.uid);

    lstP.sort((a, b) => b.id.compareTo(a.id));

    lstPrivate = lstP;
  }

  Future<void> getMainData() async {
    List<MainNotice> lstM = await DataNotification.getMainData();

    lstM.sort((a, b) => b.id.compareTo(a.id));

    lstMain = lstM;
  }

  List<Product> pros = [];

  _getData() async {
    List<Product> pros2 = await DataProduct.getAllData();
    setState(() {
      pros = pros2;
    });
  }

  List<Invoice> invoices = [];

  Future<void> _fetchInvoices(String acc) async {
    invoices = await DataInvoice().loadInvoices(acc);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _database.child('Notification').onValue.listen((event) {
      setState(() {
        getPrivateData();
        getMainData();
      });
    });

    _database.child('Products').onChildAdded.listen((event) {
      setState(() {
        _getData();

        DataNotification.createMainData(pros.last);

        getMainData();
      });
    });

    // if (widget.isLogin) {
    //   _database.child('Invoice/${_user!.uid}').onChildAdded.listen((event) {
    //     setState(() {
    //       _fetchInvoices(_user!.uid);

    //       DataNotification.createPrivateData(invoices.last);

    //       getPrivateData();
    //     });
    //   });

    //   _database.child('Invoice/${_user!.uid}').onChildChanged.listen((event) {
    //     setState(() {
    //       _fetchInvoices(_user!.uid);

    //       DataNotification.createPrivateData(invoices.last);

    //       getPrivateData();
    //     });
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Center(
            child: Text(
              "Thông báo",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          bottom: TabBar(
            labelColor: Color(0xFF9CBFD9), // Màu chữ của tab đang được chọn
            indicatorColor: Color(0xFF9CBFD9),
            tabs: [
              Tab(
                text: "Thông báo sản phẩm",
              ),
              Tab(
                text: "Thông báo hóa đơn",
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    child: Padding(
                      padding: EdgeInsets.all(3.0),
                      child: FutureBuilder(
                        future: getMainData(),
                        builder: (BuildContext context,
                            AsyncSnapshot<void> snapshot) {
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
                                return ListView.separated(
                                  padding: EdgeInsets.all(2.0),
                                  itemCount: lstMain.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return NoticeItem(
                                      idProduct: lstMain[index].idProduct,
                                      status: false,
                                      time: lstMain[index].date,
                                      title: lstMain[index].title,
                                      content: lstMain[index].content,
                                      isLogin: widget.isLogin,
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          const Divider(),
                                );
                              }
                          }
                        },
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.all(3.0),
                      child: FutureBuilder(
                        future: getPrivateData(),
                        builder: (BuildContext context,
                            AsyncSnapshot<void> snapshot) {
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
                                return ListView.separated(
                                  padding: EdgeInsets.all(2.0),
                                  itemCount: lstPrivate.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return NoticeItem(
                                      idInvoice: lstPrivate[index].idInvoice,
                                      status: true,
                                      time: lstPrivate[index].date,
                                      title: lstPrivate[index].title,
                                      content: lstPrivate[index].content,
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          const Divider(),
                                );
                              }
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
