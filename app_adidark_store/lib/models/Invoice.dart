
import 'ClassInvoiceDetail.dart';
import 'ClassCartUser.dart';
class Invoice {
   String date;
   int id;
  List<CartUser> invoiceDetail;
  String shipdate;
  String status;
  String totalPrice;
  String address;
  Invoice( { required this.date, required this.id, required this.invoiceDetail, required this.shipdate, required this.status, required this.totalPrice, required this.address});
  factory Invoice.fromJson(Map<Object?, Object?> json){
    var CartUserList = json['ivoiceDetail'] as List;
    List<CartUser> CartUserTemp = CartUserList.map((i) => CartUser.fromJson(i)).toList();
    return Invoice(
      date: json['date'] as String,
      id: json['id'] as int,
      invoiceDetail: CartUserTemp,
      shipdate: json['shipdate'] as String,
      status: json['status'] as String,
      totalPrice: json['totalPrice'] as String,
      address: json['address'] as String

    );
  }
}