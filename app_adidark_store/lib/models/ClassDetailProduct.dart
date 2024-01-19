class DetailProduct{
  int id;
  int quantity;
  int size;

  DetailProduct({required this.id,required this.quantity,required this.size});

  factory DetailProduct.fromJson(Map<dynamic, dynamic> json) {
    return DetailProduct(
      id: json['id'],
      quantity: json['quantity'],
      size: json['size'],
    );
  }
}