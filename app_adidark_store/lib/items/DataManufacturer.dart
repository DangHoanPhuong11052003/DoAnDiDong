
import 'package:firebase_database/firebase_database.dart';
import 'package:app_adidark_store/models/ClassManufacturer.dart';

class DataProduct{

  static Future<List<Manufacturer>> getAllData() async {
   DataSnapshot  snapshot = await FirebaseDatabase.instance
  .ref()
  .child("Manufacturer")
  .get();

    List<Manufacturer> allPro=[];
    List<Manufacturer> items=[];
    List<dynamic> values = snapshot.value as List<dynamic>;
        values.forEach((element) {
          allPro.add(Manufacturer.fromJson(element as Map<dynamic,dynamic>));
        });
        //chỉ lấy sản phẩm có status là 1(chưa bị xóa)
        allPro.forEach((element) {
          if(element.status==1){
            items.add(element);
          }
         });
        return items;
  }

  static Future getDataById(int id) async {
   DataSnapshot  snapshot = await FirebaseDatabase.instance
  .ref()
  .child("Manufaturer").child(id.toString())
  .get();

    List<Manufacturer> allPro=[];
    var items;
    Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
    items=Manufacturer.fromJson(values);
    return items;
  }
}