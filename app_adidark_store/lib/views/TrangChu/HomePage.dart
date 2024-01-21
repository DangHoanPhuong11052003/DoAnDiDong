import 'package:app_adidark_store/models/ClassProduct.dart';
import 'package:app_adidark_store/models/DataCartUser.dart';
import 'package:app_adidark_store/models/DataProduct.dart';
import 'package:app_adidark_store/views/SignUp_In/SignInScreen.dart';
import 'package:app_adidark_store/views/TimKiem/TimKiemScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:app_adidark_store/items/List_Product_Items.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/ClassUser.dart';
import '../SignUp_In/controller/ProfileController.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageFixState();
}

class _HomePageFixState extends State<HomePage> {
  Future<Users>? userData;
  _getNewid() async {
    User? user = FirebaseAuth.instance.currentUser;
    bool flag = await DataCartUser.checkUs(user!.uid);
    if (!flag) {
      DataCartUser.createNewCartUS(user.uid);
    }
  }

  List<Product> pros = [];
  _getData() async {
    List<Product> pros2 = await DataProduct.getAllData();
    setState(() {
      pros = pros2;
    });
  }

  @override
  void initState() {
    super.initState();
    _getNewid();
    userData = controller.getUserData();
  }

  final user = FirebaseAuth.instance.currentUser;

  final controller = Get.put(ProfileController());
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
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                            child: FutureBuilder(
                          future: userData,
                          builder: (BuildContext context,
                              AsyncSnapshot<void> snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.none:
                              case ConnectionState.waiting:
                                return Center(
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 10,
                                    child: null,
                                  ),
                                );
                              case ConnectionState.active:
                              case ConnectionState.done:
                                if (snapshot.hasError) {
                                  return Text(
                                    'Hello Welcome !',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  );
                                } else {
                                  Users user = snapshot.data as Users;
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 15),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Hello ${user.fullName}",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                Text(
                                                  "Tìm kiếm đôi giày của bạn",
                                                  style: TextStyle(
                                                    fontSize: 19,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                }
                            }
                          },
                        )),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login_Screen()),
                            );
                          },
                          child: user != null
                              ? const SizedBox()
                              : Icon(
                                  Icons.person,
                                  size: 30,
                                ),
                        ),

                        ///bỏ icon user
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
                              border: Border.all(width: 1),
                              color: Colors.white,
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
                                    onChanged: (val) {
                                      setState(() {});
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.filter_list))
                      ],
                    ),
                    Container(
                      child: CarouselSlider(
                          items: [
                            Container(
                              child: Image.asset('assets/icons/shoes5.png'),
                            ),
                            Container(
                              child: Image.asset('assets/icons/shoes6.png'),
                            ),
                            Container(
                              child: Image.asset('assets/icons/shoes7.png'),
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
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
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
                    if (pros.isNotEmpty)
                      ListProduct(
                        products: pros,
                      ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sản phẩm phổ biến",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
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
                  ],
                ))));
  }
}
