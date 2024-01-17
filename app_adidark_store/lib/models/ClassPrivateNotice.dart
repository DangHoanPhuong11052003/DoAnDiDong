class PrivateNotice {
  final String content;
  final String date;
  final int id;
  final int idInvoice;
  final String title;
  final bool status;

  PrivateNotice({
    required this.content,
    required this.date,
    required this.id,
    required this.idInvoice,
    required this.status,
    required this.title,
  });

  PrivateNotice.fromJson(Map<dynamic, dynamic> json)
      : content = json['content'],
        date = json['date'],
        id = json['id'],
        idInvoice = json['idInvoice'],
        status = json['status'],
        title = json['title'];
}
