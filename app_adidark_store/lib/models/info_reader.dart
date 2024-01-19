import 'package:flutter/services.dart';

class InfoReader {
  Future<String> readData() async {
    String data = '';
    try {
      data = await rootBundle.loadString('data/db.json');
      return data;
    } catch (e) {
      return e.toString();
    }
  }
}
