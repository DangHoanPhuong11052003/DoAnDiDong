import 'package:flutter/material.dart';

class ItemImgPro extends StatelessWidget {
  const ItemImgPro({super.key,required this.linkImg});
  final String linkImg;

  @override
  Widget build(BuildContext context) {
    return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: NetworkImage(linkImg),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
  }
}