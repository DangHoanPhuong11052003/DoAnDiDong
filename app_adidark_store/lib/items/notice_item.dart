import 'package:app_adidark_store/models/ClassCategories.dart';
import 'package:app_adidark_store/models/ClassManufacturer.dart';
import 'package:app_adidark_store/models/ClassProduct.dart';
import 'package:app_adidark_store/models/DataProduct.dart';
import 'package:flutter/material.dart';

class NoticeItem extends StatefulWidget {
  const NoticeItem({
    super.key,
    required this.idProduct,
    required this.status,
    required this.time,
    required this.title,
    required this.content,
  });

  final int idProduct;
  final String title, time, content;
  final bool status; //true: PrivateNotice, false: MainNotice

  @override
  State<NoticeItem> createState() => _NoticeItemState();
}

class _NoticeItemState extends State<NoticeItem> {
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

  Future<void> getData() async {
    Product product = await DataProduct.getDataById(widget.idProduct);

    pro = product;
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
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 2, 18, 2),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.network(
                                      pro.img[0].link,
                                      width:
                                          MediaQuery.of(context).size.width / 6,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        widget.title,
                                        style: TextStyle(fontSize: 15),
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
                          ],
                        ),
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
