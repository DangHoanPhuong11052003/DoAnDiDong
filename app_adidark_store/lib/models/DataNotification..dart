import 'package:app_adidark_store/models/ClassMainNotice.dart';
import 'package:app_adidark_store/models/ClassPrivateNotice.dart';
import 'package:app_adidark_store/models/ClassProduct.dart';
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
    databaseReference.child('Notification/main/${lstM.length}').set({
      "content":
          "Sản phấm mới \"${pro.name}\" đã được ra mắt với ưu đãi vô cùng lớn!",
      "date": DateFormat('dd/MM/yyyy').format(DateTime.now()).toString(),
      "id": lstM.length,
      "idProduct": pro.id,
      "status": true,
      "title": title[1],
    });
  }

  static Future<void> createPrivateData(String status, int idPro) async {
    final _user = FirebaseAuth.instance.currentUser;

    String content =
        "${status.substring(0, status.indexOf(" ")).toLowerCase()} được${status.substring(status.indexOf(" "))}";

    List<PrivateNotice> lstM = await getPrivateData(_user!.uid);
    final databaseReference =
        FirebaseDatabase.instance.ref('Notification/private');

    databaseReference.child('${_user.uid}/${lstM.length}').update({
      "content": "Đơn hàng của bạn $content",
      "date": DateFormat('dd/MM/yyyy').format(DateTime.now()).toString(),
      "id": lstM.length,
      "idInvoice": idPro,
      "status": true,
      "title": title[0],
    });
  }
  Future<int> getNewId(String acc) async {
    DataSnapshot snapshot =
        await FirebaseDatabase.instance.ref().child('Notification/private/$acc').get();
    List<PrivateNotice> allCarts = [];
    int newId;
    List<dynamic> values = [];
    try {
      values = snapshot.value as List<dynamic>;
    } catch (e) {
      return 0;
    }
    for (var element in values) {
      allCarts.add(PrivateNotice.fromJson(element as Map<Object?, Object?>));
    }
    newId = allCarts.last.id + 1;
    return newId;
  }
  Future<void> addNoiticationPrivate(
      String content,
      int id,
      String acc,
      String date,
      int idInvoice,
      
      ) async {
    final databaseReference = FirebaseDatabase.instance.ref();
    final invoiceReference = databaseReference.child('Notification/private/$acc/$id');
    invoiceReference.set({
      "content": content,
      "date": date,
      "id": id,
      "idInvoice": idInvoice,
      "status": true,
      "title": "Thông báo",
    });
  }
}
