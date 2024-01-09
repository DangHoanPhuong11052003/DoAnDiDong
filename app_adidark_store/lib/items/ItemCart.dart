import 'package:flutter/material.dart';

class ItemCart extends StatefulWidget {
   ItemCart({super.key, required this.sumPrice,required this.price,required this.minusPrice, required this.isPressedAll,required this.lst_vtSelected,required this.idCart});
  Function() sumPrice;
  Function() minusPrice;
  List lst_vtSelected;
  int price;
  int idCart;
  bool isPressedAll;

  @override
  State<ItemCart> createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  bool isPressed=false;
  int slsp=1;
  @override
  Widget build(BuildContext context) {
    if(widget.lst_vtSelected.contains(widget.idCart)){
      isPressed=true;
    }else{
      isPressed=false;
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          isPressed=!isPressed;
          if(isPressed){
          widget.sumPrice();
          }
          else{
           widget.minusPrice();
          }
        });
        
        
      },
      child: Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding:const EdgeInsets.all(4),
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(width: 2,color: isPressed?Colors.red:Colors.black),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if(isPressed)
            const Icon(Icons.task_alt_outlined,color:  Color.fromARGB(255, 237, 94, 84),),
            const Padding(padding: EdgeInsets.only(left: 8)),
          Container(
            width: MediaQuery.of(context).size.width/2.5,
            height: MediaQuery.of(context).size.width/2.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              //Ảnh sản phẩm
              image:const  DecorationImage(image: NetworkImage("https://drake.vn/image/catalog/H%C3%ACnh%20content/gia%CC%80y%20Converse%20da%20bo%CC%81ng/giay-converse-da-bong-5.jpg"),
              fit: BoxFit.cover),
              
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Tông tin sản phẩm
              //Tên sản phẩm
              Text("Super OG",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              //Hãng, loại
              Text("Nike | Giày nam"),
              //Màu
              Text("Màu: Đỏ"),
              //Kích Cỡ
              Text("Cỡ: 38"),
              //Tăng giảm số lượng
              Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if(slsp>1){
                            setState(() {
                              slsp--;
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
                        child:const Icon(Icons.remove,size: 17,),
                      ),
                      ),
                      const Padding(padding: EdgeInsets.only(right: 5)),                     
                      Text(slsp<10?"0$slsp":"$slsp",style: TextStyle(fontSize: 15)),
                      const Padding(padding: EdgeInsets.only(left: 5)),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            slsp++;
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
                  ),
                  //Giá
              Text("${widget.price*slsp} VND",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
              
            ],
          ),
          Container(
            alignment: Alignment.bottomRight,
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Giá
                  
                  IconButton(
                    //Xóa sản phẩm
                    onPressed: () {
                    
                    }
                  , icon: Icon(Icons.delete_outlined,color: Colors.red,size: 35,))
                ],
              ),
              )
        ],
      ),
    ),
    );
  }
}