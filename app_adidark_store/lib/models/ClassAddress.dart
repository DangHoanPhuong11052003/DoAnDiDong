class Address{
  int id;
  int location;
  String detail;
  bool type;

  Address({required this.detail,required this.location,required this.type,required this.id});
  Address.Default():detail="",id=-1,location=-1,type=false;
}