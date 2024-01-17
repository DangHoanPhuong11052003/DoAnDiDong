class MainNotice {
  final String content;
  final String date;
  final int id;
  final int idProduct;
  final String title;
  final bool status;

  MainNotice({
    required this.content,
    required this.date,
    required this.id,
    required this.idProduct,
    required this.status,
    required this.title,
  });

  MainNotice.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        idProduct = json['idProduct'],
        content = json['content'],
        date = json['date'],
        status = json['status'],
        title = json['title'];
}
