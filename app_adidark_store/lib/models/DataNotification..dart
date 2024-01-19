import 'package:app_adidark_store/models/ClassMainNotice.dart';
import 'package:app_adidark_store/models/ClassPrivateNotice.dart';
import 'package:firebase_database/firebase_database.dart';

class DataNotification {
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

  static Future<void> createMainData() async {}
}
