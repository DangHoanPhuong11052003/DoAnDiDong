import 'package:flutter/material.dart';

class NoticeItem extends StatelessWidget {
  const NoticeItem({
    super.key,
    required this.img,
    required this.title,
    required this.time,
    // required this.onTap,
  });

  final String title, time, img;
  // final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 7),
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 18, 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                img,
                                width: MediaQuery.of(context).size.width / 6,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.45,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  title,
                                  style: TextStyle(fontSize: 15),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    time,
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: const Divider(
                  height: 1,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
