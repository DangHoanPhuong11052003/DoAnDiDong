import 'package:app_adidark_store/Model/ClassAddress.dart';
import 'package:app_adidark_store/Screen/Thanh_Toan/PaymentMethodsScreen.dart';
import 'package:flutter/material.dart';

class ItemInforOrder extends StatefulWidget {
   ItemInforOrder({super.key, this.address,this.payMethod,this.changePayMethod});
  Address? address;
  bool? payMethod;
  Function()? changePayMethod;

  @override
  State<ItemInforOrder> createState() => _ItemInforOrderState();
}

class _ItemInforOrderState extends State<ItemInforOrder> {
  var result;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding:const EdgeInsets.all(8),
      decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if(widget.address!=null)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/1.3,
                  height: 60,
                  child: Text(widget.address!.detail,style: TextStyle(fontSize: 15),),
                ),
                IconButton(
                  onPressed: () {
                    
                  }, 
                  icon:const Icon(Icons.mode_edit_outlined,color:  Color.fromARGB(255, 114, 233, 249),))
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  
                  width: MediaQuery.of(context).size.width/1.3,
                  height: 60,
                  child: Row(
                    children: [
                      Icon(widget.payMethod!?Icons.credit_card:Icons.attach_money_outlined),
                      Text(widget.payMethod!?"Thẻ tín dụng/Ghi nợ":"Thanh toán khi nhận hàng",style: TextStyle(fontSize: 15),)
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () async{
                     result= await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentMethodsScreen(payMethod: widget.payMethod,)));
                    // ignore: avoid_print
                    setState(() {
                      widget.payMethod=bool.parse(result);
                    });
                  }, 
                  icon:const Icon(Icons.mode_edit_outlined,color:  Color.fromARGB(255, 114, 233, 249),))
              ],
            )
            
        ],
      ),
    );
  }
}
