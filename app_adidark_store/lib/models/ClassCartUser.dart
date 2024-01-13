class CartUser{
  int id;
  int color;
  String img;
  String manufucturer;
  String namePro;
  int quantity;
  int size;
  int idPro;
  double price;
  String cate;
  int status;

  CartUser({required this.color,required this.id,required this.img,required this.manufucturer,required this.quantity,required this.size,required this.namePro, required this.idPro,required this.price,required this.cate,required this.status});

  CartUser.fromJson(Map<Object?,Object?> js)
    :id=int.parse(js['id'].toString()),
    img=js["img"].toString(),
    color=int.parse(js['color'].toString()),
    manufucturer=js['manufacturer'].toString(),
    namePro=js['namePro'].toString(),
    quantity=int.parse(js['quantity'].toString()),
    size=int.parse(js['size'].toString()),
    idPro=int.parse(js['idPro'].toString()),
    price=double.parse(js['price'].toString()),
    cate=js['cate'].toString(),
    status=int.parse(js['status'].toString());
}