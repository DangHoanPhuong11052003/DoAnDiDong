class CartUser{
  int id;
  int color;
  String img;
  String manufucturer;
  String namePro;
  int quantity;
  int size;

  CartUser({required this.color,required this.id,required this.img,required this.manufucturer,required this.quantity,required this.size,required this.namePro});

  CartUser.fromJson(Map<String,dynamic> js)
    :id=int.parse(js['id'].toString()),
    img=js["img"].toString(),
    color=int.parse(js['color'].toString()),
    manufucturer=js['manfucturer'].toString(),
    namePro=js['namePro'].toString(),
    quantity=int.parse(js['quantity'].toString()),
    size=int.parse(js['size'].toString());
}