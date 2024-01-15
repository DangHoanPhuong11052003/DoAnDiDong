class Manufacturer{
  int id;
  String name;
  bool status;

  Manufacturer({required this.id,required this.name,required this.status});

  factory Manufacturer.fromJson(Map<dynamic, dynamic> json) {
    return Manufacturer(
      id: json['id'],
      name: json['name'],
      status: json['status'],
    );
  }
  
}