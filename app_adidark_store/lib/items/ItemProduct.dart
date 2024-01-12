import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ItemProduct extends StatefulWidget {
  const ItemProduct({super.key});

  @override
  State<ItemProduct> createState() => _ItemProductState();
}

class _ItemProductState extends State<ItemProduct> {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      padding: EdgeInsets.only(left: 15, right: 15,top: 15,),
      margin: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20,)
      ),
      child: Column(
        children: [
          InkWell(
            onTap: (){},
            child: Container(
              margin: EdgeInsets.all(10),
              child: Image.network('https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/172d22a5-00b8-4e15-a1f1-3875b055c020/invincible-3-road-running-shoes-VZDSsw.png'),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(bottom: 5),
            child: const Text(
              "NIKE SHOODOSODSODOSDO",
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF4C53A5),
                fontWeight: FontWeight.bold

              ),
            ),
          ),
          const Text("12.000.000 VND")
        ],
      ),
    );
  }
}
