import 'package:app_adidark_store/View/ItemSelectedColor.dart';
import 'package:app_adidark_store/View/ItemSelectedSize.dart';
import 'package:app_adidark_store/View/TextWrapper.dart';
import 'package:flutter/material.dart';

class ProDetailScreen extends StatefulWidget {
  const ProDetailScreen({super.key});

  @override
  State<ProDetailScreen> createState() => _ProDetailScreenState();
}

class _ProDetailScreenState extends State<ProDetailScreen> {
  int sttbuy=0;
  int slColor=10;
  int slSize=13;
  String s="dadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadada";
  bool isReadMore=false;
  int seledtedColorId=-1;
  int seledtedSizeId=-1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Chi tiết sản phẩm"),
      ),
      body: SingleChildScrollView(
        child:
          Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child:const Image(image: NetworkImage("https://drake.vn/image/catalog/H%C3%ACnh%20content/gia%CC%80y%20Converse%20da%20bo%CC%81ng/giay-converse-da-bong-5.jpg")),
          ),
          Padding(padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Tên
              Text("Super OG",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              //Hãng, loại
              Text("Nike | Giày nam",style: TextStyle(fontSize: 17)),
              Row(
                children: [
                  Row(
                    children: [
                      //Số sao
                      for(var i=0;i<=5;i++)
                        Icon(Icons.star,color: Colors.yellow,)
                    ],
                  ),
                  //Số review
                  Text("(100k Reviews)",style: TextStyle(fontSize: 15))
                ],
              ),
              //Giá tiền, số lượng chọn
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Số tiền sản phẩm
                  Text("12.000.000 VND",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if(sttbuy>0){
                            setState(() {
                              sttbuy--;
                            });
                          }
                        },
                       child: Container(
                        height: 30,
                        width: 30,
                        alignment: Alignment.center,
                        decoration:const BoxDecoration(
                          color: Color.fromARGB(255, 241, 240, 240),
                          shape: BoxShape.circle
                        ),
                        child:const Icon(Icons.remove,size: 15,),
                      ),
                      ),
                      const Padding(padding: EdgeInsets.only(right: 5)),                     
                      Text(sttbuy<10?"0$sttbuy":"$sttbuy",style: TextStyle(fontSize: 17)),
                      const Padding(padding: EdgeInsets.only(left: 5)),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            sttbuy++;
                          });
                        },
                       child: Container(
                        height: 30,
                        width: 30,
                        alignment: Alignment.center,
                        decoration:const BoxDecoration(
                          color: Color.fromARGB(255, 241, 240, 240),
                          shape: BoxShape.circle
                        ),
                        child:const Icon(Icons.add,size: 15,),
                      ),
                      ),
                    ],
                  )
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 15)),
              const Divider(
                color: Colors.black,
                height: 2,
              ),

              //Thông tin sản phẩm
              TextWrapper(text: "asdadasdadadadasdsadadadasdasdadadadad adasdadasdadadadadasdada asdadadadadadadada adadadadadadadas dadadadadadad adadadadadadas asdsadasdadad"),

              const Padding(padding: EdgeInsets.only(bottom: 10)),
              const Divider(
                color: Colors.black,
                height: 2,
              ),

              Text("Colors",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
              //Chọn màu
              
              Column(
                children: [
                  //Số lượng màu
                  if(slColor<6)
                    Row(children: [
                      for(int i=0;i<slColor;i++)
                        ItemSelectedColor(idColor: i,idList: i,idSelected: seledtedColorId,selected: () {
                          setState(() {
                            if(seledtedColorId==i){
                              seledtedColorId=-1;
                            }
                            else{
                              seledtedColorId=i;
                            }
                          });
                        },)
                     ],)
                  else
                    Row(children: [
                      for(int i=0;i<6;i++)
                        ItemSelectedColor(idColor: i,idList: i,idSelected: seledtedColorId,selected: () {
                          if(seledtedColorId==i){
                              setState(() {
                                seledtedColorId=-1;
                              });
                            }
                            else{
                              setState(() {
                                seledtedColorId=i;
                              });
                            }
                        },)
                    ],),
                    Row(children: [
                      for(int i=6;i<slColor;i++)         
                        ItemSelectedColor(idColor: i,idList: i,idSelected: seledtedColorId,selected: () {
                          if(seledtedColorId==i){
                              setState(() {
                                seledtedColorId=-1;
                              });
                            }
                            else{
                              setState(() {
                                seledtedColorId=i;
                              });
                            }
                        },)
                    ],)
                ],
              ),

              Text("Size",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),

              Column(
                children: [
                  //Số lượng Size
                  for(var i=0;i<slSize/6.ceil();i++)
                    Row(
                      children: [
                        for(var j=i*6;j<i*6+6&&j<slSize;j++)
                          ItemSelectedSize(idSize: j+30, idSelected: seledtedSizeId , idList: j, selected: () {
                          if(seledtedSizeId==j){
                              setState(() {
                                seledtedSizeId=-1;
                              });
                            }
                            else{
                              setState(() {
                                seledtedSizeId=j;
                              });
                            }
                        },)
                      ],
                    )
                ],
              ),
          ]),)
        ],
      ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: seledtedColorId==-1||seledtedSizeId==-1?Colors.grey:const Color.fromARGB(255, 103, 183, 248)
              ),
              height: 50,
              width: 200,
              child: Text("MUA NGAY", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
            ),
          ),
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: seledtedColorId==-1||seledtedSizeId==-1?Colors.grey:const Color.fromARGB(255, 103, 183, 248)
              ),
              height: 50,
              width: 120,
              child:const Icon(Icons.shopping_cart,color: Colors.white,size: 40,),
            ),
          )
        ],
      ),
    );
  }
}