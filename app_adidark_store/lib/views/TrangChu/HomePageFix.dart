import 'package:app_adidark_store/views/TimKiem/TimKiemScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:app_adidark_store/Testdata/component/List_Product_Items.dart';
import 'package:app_adidark_store/Testdata/component/List_Menufactory_Iteams.dart';
import 'package:app_adidark_store/Testdata/model/product.dart';
import 'package:app_adidark_store/Testdata/model/category.dart';
import 'package:app_adidark_store/Testdata/model/list_data.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePageFix extends StatefulWidget {
  const HomePageFix({super.key});

  @override
  State<HomePageFix> createState() => _HomePageFixState();
}

List<Product> products = [];
List<Product> preoduc2 = [];

class _HomePageFixState extends State<HomePageFix> {
  @override
  void initState() {
    ListData.loadData().then((value) {
      setState(() {
        products = ListData.products;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hey DeLe",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          "Tìm kiếm đôi giày của bạn",
                          style: TextStyle(fontSize: 19),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xFFF6F6F6),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 5, right: 30),
                            height: 50,
                            width: 200,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TimKiemScreen()),
                                        );
                                      },
                                      child: Icon(Icons.search)),
                                  hintText: "Search"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.filter_list))
                ],
              ),
              Container(
                child: CarouselSlider(
                    items: [
                      Container(
                        child: Image.asset('assets/images/hqc.jpg'),
                      ),
                      Container(
                        child: Image.asset('assets/images/hqc1.jpg'),
                      ),
                      Container(
                        child: Image.asset('assets/images/hqc2.jpg'),
                      ),
                    ],
                    options: CarouselOptions(
                      height: 200,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      onPageChanged: null,
                      scrollDirection: Axis.horizontal,
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sản phẩm bán chạy",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xFFCBE9FF)),
                  ),
                ],
              ),
              ListProduct(products: products),
              const SizedBox(
                height: 30,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sản phẩm phổ biến",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xFFCBE9FF)),
                  ),
                ],
              ),
              ListProduct(products: products),
            ],
          ),
        ),
      ),
      //),
    );
  }
}
