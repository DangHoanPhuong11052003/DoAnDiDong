import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemSelectedColor extends StatefulWidget {
   ItemSelectedColor({super.key, required this.idColor,required this.idSelected, required this.selected, required this.idList});
  final int idColor;
  Function() selected;
  int idSelected;
  final int idList;
  @override
  State<ItemSelectedColor> createState() => _ItemSelectedColorState();
}

class _ItemSelectedColorState extends State<ItemSelectedColor> {
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
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: widget.idColor==0?Colors.black:
                              widget.idColor==1?Colors.white:
                              widget.idColor==2?Colors.amber:
                              widget.idColor==3?Colors.blue:
                              widget.idColor==4?Colors.grey:
                              widget.idColor==5?Colors.brown:
                              widget.idColor==6?Colors.orange:
                              widget.idColor==7?Colors.purple:
                              widget.idColor==8?Colors.green:Colors.pink,
        ),
        height: MediaQuery.of(context).size.width/8-10,
        width: MediaQuery.of(context).size.width/8-20,
        
      )
    ),
      ));
  }
}