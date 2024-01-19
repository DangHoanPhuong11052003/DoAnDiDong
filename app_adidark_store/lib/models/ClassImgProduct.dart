class ImgProduct{
  int id;
  String link;

  ImgProduct({required this.id,required this.link});

    factory ImgProduct.fromJson(Map<dynamic, dynamic> json) {
    return ImgProduct(
      id: json['id'],
      link: json['link'],
    );
  }
}