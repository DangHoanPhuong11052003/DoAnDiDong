import 'package:app_adidark_store/models/ClassCartUser.dart';
import 'package:app_adidark_store/models/ClassProduct.dart';
import 'package:app_adidark_store/models/DataNotification..dart';
import 'package:app_adidark_store/models/DataProduct.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../../models/ClassAddress.dart';
import 'OrderScreen.dart';

class PaymentMethodsScreen extends StatefulWidget {
  PaymentMethodsScreen({super.key, this.address, this.payMethod, this.carts});
  final Address? address;
  final List<CartUser>? carts;
  bool? payMethod;

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  TextEditingController soThe = TextEditingController();
  TextEditingController ngayThang = TextEditingController();
  TextEditingController ma = TextEditingController();
  TextEditingController hoTen = TextEditingController();
  bool isExpanded = false;

  DatabaseReference _database = FirebaseDatabase.instance.ref();
  List<Product> pros = [];

  _getData() async {
    List<Product> pros2 = await DataProduct.getAllData();
    setState(() {
      pros = pros2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chọn phương thức thanh toán",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: isExpanded
                      ? Border.all(width: 2, color: Colors.red)
                      : null,
                ),
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  child: ConstrainedBox(
                      constraints: isExpanded
                          ? const BoxConstraints()
                          : const BoxConstraints(maxHeight: 70),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.credit_card,
                                      size: 40,
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 8)),
                                    Text(
                                      "Thẻ tín dụng/Ghi nợ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                                isExpanded
                                    ? IconButton(
                                        icon: const Icon(
                                          Icons.keyboard_arrow_up,
                                          size: 35,
                                        ),
                                        onPressed: () =>
                                            setState(() => isExpanded = false),
                                      )
                                    : IconButton(
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down,
                                          size: 35,
                                        ),
                                        onPressed: () =>
                                            setState(() => isExpanded = true),
                                      ),
                              ],
                            ),
                            if (isExpanded)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Chi tiết thẻ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(bottom: 10)),
                                  SizedBox(
                                    height: 60,
                                    child: TextField(
                                      controller: soThe,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        hintText: "Số thẻ",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(bottom: 10)),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height: 60,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        child: TextField(
                                          controller: ngayThang,
                                          keyboardType: TextInputType.datetime,
                                          decoration: InputDecoration(
                                            hintText:
                                                "Ngày tháng hết hạn (dd/MM/YY)",
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 60,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        child: TextField(
                                          controller: ma,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            hintText: "Mã thẻ",
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(bottom: 10)),
                                  SizedBox(
                                    height: 60,
                                    child: TextField(
                                      controller: hoTen,
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                        hintText: "Họ tên chủ thẻ",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                          ],
                        ),
                      )),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              const Divider(
                height: 2,
                color: Colors.grey,
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: !isExpanded
                        ? Border.all(width: 2, color: Colors.red)
                        : null,
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.attach_money_outlined,
                        size: 40,
                      ),
                      Padding(padding: EdgeInsets.only(right: 8)),
                      Text(
                        "Thanh toán khi nhận hàng",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              const Divider(
                height: 2,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          if (widget.payMethod != null) {
            Navigator.pop(context, isExpanded);
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OrderScreen(
                          address: widget.address!,
                          payMethod: isExpanded,
                          carts: widget.carts,
                        )));
          }
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color.fromARGB(255, 103, 183, 248)),
          height: 50,
          width: 200,
          child: Text(
            "TIẾP TỤC",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    if (widget.payMethod != null) {
      isExpanded = widget.payMethod!;
    }
    super.initState();

    _database.child('Products').onChildAdded.listen((event) {
      setState(() {
        _getData();

        DataNotification.createMainData(pros.last);
      });
    });
  }
}
