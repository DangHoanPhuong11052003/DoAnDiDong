import 'package:app_adidark_store/models/ClassMainNotice.dart';
import 'package:app_adidark_store/models/ClassPrivateNotice.dart';
import 'package:app_adidark_store/models/ClassProduct.dart';
import 'package:app_adidark_store/models/Invoice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

class DataNotification {
  static List<String> title = ["Thông báo", "Sản phẩm mới"];

  static Future<List<MainNotice>> getMainData() async {
    DataSnapshot snapshot =
        await FirebaseDatabase.instance.ref().child("Notification/main").get();

    List<MainNotice> allNotice = [];
    List<MainNotice> notices = [];
    List<dynamic> values = snapshot.value as List<dynamic>;
    for (var element in values) {
      allNotice.add(MainNotice.fromJson(element as Map<dynamic, dynamic>));
    }

    allNotice.forEach((element) {
      if (element.status == true) {
        notices.add(element);
      }
    });

    return notices;
  }

  static Future<List<PrivateNotice>> getPrivateData(String uid) async {
    DataSnapshot snapshot = await FirebaseDatabase.instance
        .ref()
        .child("Notification/private/$uid")
        .get();

    List<PrivateNotice> allNotice = [];
    List<PrivateNotice> notices = [];
    List<dynamic> values = snapshot.value as List<dynamic>;
    for (var element in values) {
      allNotice.add(PrivateNotice.fromJson(element as Map<dynamic, dynamic>));
    }

    allNotice.forEach((element) {
      if (element.status == true) {
        notices.add(element);
      }
    });

    return notices;
  }

  static Future<void> createMainData(Product pro) async {
    List<MainNotice> lstM = await getMainData();
    final databaseReference = FirebaseDatabase.instance.ref();
    databaseReference.child('Notification/main').set({
      "content":
          "Sản phấm mới \"${pro.name}\" đã được ra mắt với ưu đãi vô cùng lớn!",
      "date": DateFormat('dd/MM/yyyy').format(DateTime.now()).toString(),
      "id": lstM.length == 0 ? (lstM.length) : (lstM.length - 1),
      "idProduct": pro.id,
      "status": true,
      "title": title[1],
    });
  }

  static Future<void> createPrivateData(Invoice inv) async {
    final _user = FirebaseAuth.instance.currentUser;
    List<PrivateNotice> lstM = await getPrivateData(_user!.uid);
    final databaseReference = FirebaseDatabase.instance.ref();
    databaseReference.child('Notification/private/${_user.uid}').set({
      "content": "Đơn hàng của bạn",
      "date": DateFormat('dd/MM/yyyy').format(DateTime.now()).toString(),
      "id": lstM.length == 0 ? (lstM.length) : (lstM.length - 1),
      "idProduct": inv.id,
      "status": true,
      "title": title[0],
    });
  }
}
