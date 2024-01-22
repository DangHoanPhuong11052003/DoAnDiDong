import 'package:app_adidark_store/items/ItemInforAddress.dart';
import 'package:app_adidark_store/models/ClassCartUser.dart';
import 'package:app_adidark_store/models/ClassProduct.dart';
import 'package:app_adidark_store/models/ClassUser.dart';
import 'package:app_adidark_store/models/DataNotification..dart';
import 'package:app_adidark_store/models/DataProduct.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/ClassAddress.dart';
import 'PaymentMethodsScreen.dart';

class OrderAddressScreen extends StatefulWidget {
  OrderAddressScreen({super.key, this.address, this.carts});
  Address? address;
  List<CartUser>? carts;

  @override
  State<OrderAddressScreen> createState() => _OrderAddressScreenState();
}

class _OrderAddressScreenState extends State<OrderAddressScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  List<Address> lstAddress = [];

  late String email;
  late String fullName;
  late String password;
  late Map<String, dynamic> address;
  late String home;
  late String company;
  late String etc;

  Users user = Users(
    fullName: "",
    email: "",
    password: "",
    address: {
      "Home": null,
      "Company": null,
      "Etc": null,
    },
  );

  final _user = FirebaseAuth.instance.currentUser;

  Future<void> getUserDetailInfo() async {
    final SharedPreferences prefs = await _prefs;

    DocumentReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance.collection("Users").doc(_user?.uid);

    try {
      // Lấy dữ liệu từ Firestore
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await documentReference.get();

      // Đảm bảo rằng tài liệu tồn tại và có dữ liệu
      if (documentSnapshot.exists) {
        // Lấy tất cả các trường (fields) từ tài liệu
        Map<String, dynamic> documentData = documentSnapshot.data()!;

        documentData.forEach((key, value) async {
          if (key != "Address") {
            await prefs.setString(key, value);
          } else if (key == "Address") {
            address = value;
          }
        });

        address.forEach((key, value) async {
          await prefs.setString(key, value);
        });
      } else {
        print('Document does not exist');
      }
    } catch (e) {
      print('Error getting document fields: $e');
    }

    email = prefs.getString("Email") ?? "";
    fullName = prefs.getString("FullName") ?? "";
    password = prefs.getString("Password") ?? "";
    home = prefs.getString("Home") ?? "";
    company = prefs.getString("Company") ?? "";
    etc = prefs.getString("Etc") ?? "";

    user = Users(
      fullName: fullName,
      email: email,
      password: password,
      address: {
        "Home": home,
        "Company": company,
        "Etc": etc,
      },
    );

    lstAddress = [
      Address(
        id: 0,
        detail: home,
        location: 0,
        type: true,
      ),
      if (company.isNotEmpty)
        Address(
          id: 1,
          detail: company,
          location: 1,
          type: false,
        ),
      if (etc.isNotEmpty)
        Address(
          id: 2,
          detail: etc,
          location: 2,
          type: false,
        )
    ];
    if (addressSelected.id < 0) addressSelected = lstAddress[0];
  }

  final CollectionReference users =
      FirebaseFirestore.instance.collection('Users');

  Future<void> updateUser(var key, var value) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString(key, value);
    if (key == "Company") {
      var update = users
          .doc(_user?.uid)
          .update({
            "Address": {
              "Home": home,
              key: value,
              "Etc": etc,
            }
          })
          .then((value) => print("User Updated"))
          .catchError((error) => print("Failed to update user: $error"));
    } else if (key == "Etc") {
      var update = users
          .doc(_user?.uid)
          .update({
            "Address": {
              "Home": home,
              "Company": company,
              key: value,
            }
          })
          .then((value) => print("User Updated"))
          .catchError((error) => print("Failed to update user: $error"));
    }

    user.address?[key] = value;
  }

  DatabaseReference _database = FirebaseDatabase.instance.ref();
  List<Product> pros = [];

  _getData() async {
    List<Product> pros2 = await DataProduct.getAllData();
    setState(() {
      pros = pros2;
    });
  }

  void _modelBottomSheetMenu() {
    TextEditingController txtCompany = TextEditingController(text: "");
    TextEditingController txtEtc = TextEditingController(text: "");

    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    if (company.isEmpty)
                      TextField(
                        readOnly: txtEtc.text.trim().isNotEmpty ? true : false,
                        controller: txtCompany,
                        decoration: InputDecoration(
                          hintText: "Nhập địa chỉ nơi làm việc",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    if (etc.isEmpty)
                      TextField(
                        readOnly:
                            txtCompany.text.trim().isNotEmpty ? true : false,
                        controller: txtEtc,
                        decoration: InputDecoration(
                          hintText: "Nhập địa chỉ khác",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (txtCompany.text.trim().isNotEmpty)
                              updateUser("Company", txtCompany.text.trim());
                            if (txtEtc.text.trim().isNotEmpty)
                              updateUser("Etc", txtEtc.text.trim());

                            Navigator.pop(context);
                          });
                        },
                        child: Text(
                          "Xác nhận",
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromRGBO(203, 233, 255, 1))),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }

  Address addressSelected =
      Address(detail: "", location: -1, type: false, id: -1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chọn địa chỉ giao hàng",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: FutureBuilder(
        future: getUserDetailInfo(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            // return Center(child: CircularProgressIndicator());
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      for (var i = 0; i < lstAddress.length; i++)
                        ItemInforAddress(
                          address: lstAddress[i],
                          addressSelected: addressSelected,
                          changeSelectedId: () {
                            setState(() {
                              addressSelected = lstAddress[i];
                            });
                          },
                        ),
                      if (lstAddress.length < 3)
                        GestureDetector(
                          onTap: () {
                            //Thêm mới địa chỉ
                            _modelBottomSheetMenu();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color:
                                    const Color.fromARGB(255, 103, 183, 248)),
                            height: 50,
                            width: 250,
                            child: Text(
                              "+ Thêm địa chỉ mới",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                    ],
                  ),
                );
              }
          }
        },
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          if (widget.address != null) {
            Navigator.pop(context, addressSelected);
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PaymentMethodsScreen(
                          address: addressSelected,
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
    if (widget.address != null) {
      addressSelected = widget.address!;
    } else {
      for (var i in lstAddress) {
        if (i.type) {
          addressSelected = i;
        }
      }
    }
    getUserDetailInfo();
    super.initState();

    FirebaseFirestore.instance
        .collection("Users")
        .doc(_user?.uid)
        .snapshots()
        .listen((event) {
      setState(() {
        getUserDetailInfo();
      });
    });

    _database.child('Products').onChildAdded.listen((event) {
      setState(() {
        _getData();

        DataNotification.createMainData(pros.last);
      });
    });
  }
}
