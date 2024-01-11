import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemSelectedSize extends StatefulWidget {
   ItemSelectedSize({super.key, required this.idSize,required this.idSelected, required this.selected, required this.idList});
  final int idSize;
  Function() selected;
  int idSelected;
  final int idList;

  @override
  State<ItemSelectedSize> createState() => _ItemSelectedSizeState();
}

class _ItemSelectedSizeState extends State<ItemSelectedSize> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () {
          widget.selected();
        },
        child: Container(
      padding:const EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width/8,
      height: MediaQuery.of(context).size.width/8-10,
      decoration: BoxDecoration(
        color: widget.idList==widget.idSelected?Colors.blue.withOpacity(0.5):const Color.fromARGB(255, 239, 238, 238),
        borderRadius: BorderRadius.circular(8)

      ),
      child: Text("${widget.idSize}",style:const TextStyle(fontSize: 18),textAlign: TextAlign.center,)
    ),
      ));
  }
}