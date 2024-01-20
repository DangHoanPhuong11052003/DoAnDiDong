import 'package:flutter/material.dart';
import '../models/ClassAddress.dart';

class ItemInforAddress extends StatefulWidget {
  ItemInforAddress(
      {super.key,
      required this.address,
      required this.addressSelected,
      required this.changeSelectedId});
  final Address address;
  Address addressSelected;
  Function() changeSelectedId;
  @override
  State<ItemInforAddress> createState() => _ItemInforAddressState();
}

class _ItemInforAddressState extends State<ItemInforAddress> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.changeSelectedId(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                color: widget.address.id != widget.addressSelected.id
                    ? Colors.black
                    : Colors.red,
                width: 2)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                widget.address.id != widget.addressSelected.id
                    ? const Icon(
                        Icons.circle,
                        size: 15,
                        color: Color.fromARGB(255, 214, 213, 213),
                      )
                    : const Icon(
                        Icons.task_alt_outlined,
                        size: 15,
                        color: Colors.red,
                      ),
                const Padding(padding: EdgeInsets.only(right: 8)),
                Text(
                    widget.address.location == 0
                        ? "Nhà"
                        : widget.address.location == 1
                            ? "Nơi làm việc"
                            : "Địa chỉ khác",
                    style: TextStyle(
                        fontSize: 18,
                        color: const Color.fromARGB(255, 86, 85, 85))),
                const Padding(padding: EdgeInsets.only(right: 8)),
                if (widget.address.type)
                  Text(
                    "Mặc định",
                    style: TextStyle(color: Colors.red, fontSize: 18),
                  ),
              ],
            ),
            Text(widget.address.detail, style: TextStyle(fontSize: 18))
          ],
        ),
      ),
    );
  }
}
