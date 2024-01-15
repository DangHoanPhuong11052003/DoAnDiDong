import 'package:flutter/material.dart';

class ItemSelectedColor extends StatefulWidget {
  ItemSelectedColor(
      {super.key,
      required this.idColor,
      required this.idSelected,
      required this.selected,
      required this.idList});
  final String idColor;
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
        padding: const EdgeInsets.all(5),
        child: GestureDetector(
          onTap: () {
            widget.selected();
          },
          child: Container(
              padding: const EdgeInsets.all(2),
              width: MediaQuery.of(context).size.width / 8,
              height: MediaQuery.of(context).size.width / 8 - 10,
              decoration: BoxDecoration(
                  color: widget.idList == widget.idSelected
                      ? Colors.blue.withOpacity(0.5)
                      : const Color.fromARGB(255, 239, 238, 238),
                  borderRadius: BorderRadius.circular(8)),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: widget.idColor == 'a'
                      ? Colors.black
                      : widget.idColor == "b"
                          ? Colors.white
                          : widget.idColor == 'c'
                              ? Colors.amber
                              : widget.idColor == 'd'
                                  ? Colors.blue
                                  : widget.idColor == 'e'
                                      ? Colors.grey
                                      : widget.idColor == 'f'
                                          ? Colors.brown
                                          : widget.idColor == 'g'
                                              ? Colors.orange
                                              : widget.idColor == 'h'
                                                  ? Colors.purple
                                                  : widget.idColor == 'j'
                                                      ? Colors.green
                                                      : Colors.pink,
                ),
                height: MediaQuery.of(context).size.width / 8 - 20,
                width: MediaQuery.of(context).size.width / 8 - 30,
              )),
        ));
  }
}
