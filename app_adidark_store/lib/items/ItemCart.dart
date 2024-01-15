import 'package:app_adidark_store/models/ClassCartUser.dart';
import 'package:app_adidark_store/models/DataCartUser.dart';
import 'package:flutter/material.dart';

class ItemCart extends StatefulWidget {
  ItemCart(
      {super.key,
      required this.sumPrice,
      required this.minusPrice,
      required this.lst_vtSelected,
      required this.cart,
      required this.acc,
      required this.updatePrice,
      required this.setupData});
  Function() sumPrice;
  Function() minusPrice;
  Function() updatePrice;
  Function() setupData;
  List lst_vtSelected;
  CartUser cart;
  String acc;

  @override
  State<ItemCart> createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  bool isPressed = false;
  int slsp = 1;

  @override
  Widget build(BuildContext context) {
    if (widget.lst_vtSelected.contains(widget.cart.id)) {
      isPressed = true;
    } else {
      isPressed = false;
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          isPressed = !isPressed;
          if (isPressed) {
            widget.sumPrice();
          } else {
            widget.minusPrice();
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(4),
        width: MediaQuery.of(context).size.width,
        height: 200,
        decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: isPressed ? Colors.red : Colors.grey),
            borderRadius: BorderRadius.circular(15),
            color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(padding: EdgeInsets.only(left: 8)),
            Container(
              width: MediaQuery.of(context).size.width / 2.5,
              height: MediaQuery.of(context).size.width / 2.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                //Ảnh sản phẩm
                image:  DecorationImage(
                    image: NetworkImage(
                        widget.cart.img),
                    fit: BoxFit.cover),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Tông tin sản phẩm
                //Tên sản phẩm
                Text(
                  widget.cart.namePro,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                //Hãng, loại
                Text("${widget.cart.manufucturer} | Giày ${widget.cart.cate}"),
                //Màu
                Text(widget.cart.color == 0
                      ? "Đen"
                      : widget.cart.color == 1
                          ? "Trắng"
                          : widget.cart.color == 2
                              ? "Vàng"
                              : widget.cart.color == 3
                                  ? "Xanh dương"
                                  :widget.cart.color == 4
                                      ? "Xám"
                                      : widget.cart.color == 5
                                          ? "Nâu"
                                          : widget.cart.color == 6
                                              ? "Cam"
                                              : widget.cart.color == 7
                                                  ? "Tím"
                                                  : widget.cart.color == 8
                                                      ? "Xanh lá"
                                                      : "Hồng",),
                //Kích Cỡ
                Text(widget.cart.size.toString()),
                //Tăng giảm số lượng
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (widget.cart.quantity > 1) {
                          setState(() {
                            widget.cart.quantity--;
                            //Cập nhật lại số luong sản phẩm
                            setState(() {
                              DataCartUser.updateData(widget.cart, widget.acc);
                            });
                            widget.updatePrice();
                          });
                        }
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 241, 240, 240),
                            shape: BoxShape.circle),
                        child: const Icon(
                          Icons.remove,
                          size: 17,
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(right: 5)),
                    Text(widget.cart.quantity < 10 ? "0${widget.cart.quantity}" : "${widget.cart.quantity}",
                        style:const TextStyle(fontSize: 15)),
                    const Padding(padding: EdgeInsets.only(left: 5)),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          //cập nhật lại số lượng sản phẩm
                          widget.cart.quantity++;
                          setState(() {
                            DataCartUser.updateData(widget.cart, widget.acc);
                          });
                          widget.updatePrice();
                        });
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 241, 240, 240),
                            shape: BoxShape.circle),
                        child: const Icon(
                          Icons.add,
                          size: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                //Giá
                Text("${widget.cart.price * widget.cart.quantity} VND",
                    style:
                        const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Column(
                      children: [
                        if (isPressed)
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: const Icon(
                              Icons.task_alt_outlined,
                              color: Color.fromARGB(255, 237, 94, 84),
                            ),
                          ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                  'Bạn có chắc chắn muốn xóa sản phẩm này?'),
              content: Text(
                  'Điều này sẽ loại bỏ sản phẩm ra khỏi giỏ hàng của bạn!'),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      child: Text('Yes',
                          style: TextStyle(color: Colors.blue, fontSize: 18)),
                      onPressed: () {
                        setState(() {
                          widget.cart.status=0;
                          DataCartUser.updateData(widget.cart, widget.acc);
                          widget.setupData();
                        });
                        Navigator.of(context).pop();
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Row(
                                children: [
                                  Text('Xóa thành công!',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 140, 238, 143))),
                                  Icon(
                                    Icons.check_circle_outlined,
                                    color: const Color.fromARGB(
                                        255, 140, 238, 143),
                                  )
                                ],
                              ),
                              actions: [
                                TextButton(
                                  child: Text('Ok',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 18)),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    TextButton(
                      child: Text(
                        'No',
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                )
              ],
            );
          },
        );
                    },
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

