class Categories{
  int id;
  String name;
  bool status;

  Categories({required this.id,required this.name,required this.status});

  factory Categories.fromJson(Map<dynamic, dynamic> json) {
    return Categories(
      id: json['id'],
      name: json['name'],
      status: json['status'],
    );
  }
}