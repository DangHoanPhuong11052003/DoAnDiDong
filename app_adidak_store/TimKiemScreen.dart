import 'package:app_adidark_store/views/TimKiem/ChiTietTimKiem.dart';
import 'package:flutter/material.dart';
import 'package:app_adidark_store/Testdata/component/List_Product_Items.dart';
import 'package:app_adidark_store/Testdata/model/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TimKiemScreen extends StatefulWidget {
  const TimKiemScreen({super.key});





  @override
  State<TimKiemScreen> createState() => _TimKiemScreenState();
}

class _TimKiemScreenState extends State<TimKiemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     
      body:SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios), // Thay thế bằng biểu tượng của bạn
                    ),
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
                              margin: EdgeInsets.only(left: 5 , right: 30),
                              height: 50,
                              width: 150,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Tìm sản phẩm",
                                                               
                                ),
                             ),
                            ),                    
                          ],
                          ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                         Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const ChiTietTimKiemScreen()),
                                        );
                      },
                      icon: Icon(Icons.search), // Thay thế bằng biểu tượng của bạn
                    ),
                    
           
                  ],
                ),

            ],
          ),
          ),
      ),
    );
  }
}
