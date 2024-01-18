import 'package:app_adidark_store/items/notice_item.dart';
import 'package:app_adidark_store/models/ClassMainNotice.dart';
import 'package:app_adidark_store/models/ClassPrivateNotice.dart';
import 'package:app_adidark_store/models/DataNotification..dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final _user = FirebaseAuth.instance.currentUser;

  List<PrivateNotice> lstPrivate = [];
  List<MainNotice> lstMain = [];

  Future<void> getData() async {
    // List<PrivateNotice> lstP =
    //     await DataNotification.getPrivateData(_user!.uid);
    List<MainNotice> lstM = await DataNotification.getMainData();

    // setState(() {
    // lstPrivate = lstP;
    lstMain = lstM;
    // });

    // print("lstPrivate length: ${lstPrivate.length}");
    print("lstMain length: ${lstMain.length}");
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getData();
  // }

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
                        padding: EdgeInsets.all(8.0),
                        child: FutureBuilder(
                          future: getData(),
                          builder: (BuildContext context,
                              AsyncSnapshot<void> snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.none:
                              case ConnectionState.waiting:
                                return Center(
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 10,
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              case ConnectionState.active:
                              case ConnectionState.done:
                                if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  return ListView.separated(
                                    padding: EdgeInsets.all(8.0),
                                    itemCount: lstMain.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return NoticeItem(
                                        idProduct: lstMain[index].idProduct,
                                        status: true,
                                        time: lstMain[index].date,
                                        title: lstMain[index].title,
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                            const Divider(),
                                  );
                                }
                            }
                          },
                        )),
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ListView.separated(
                        padding: EdgeInsets.all(8.0),
                        itemCount: lstMain.length,
                        itemBuilder: (BuildContext context, int index) {},
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
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
