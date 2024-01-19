import 'package:flutter/material.dart';

import '../../models/list_data.dart';
import '../../models/product.dart';

class ChiTietTimKiemScreen extends StatefulWidget {
  const ChiTietTimKiemScreen({super.key});

  @override
  State<ChiTietTimKiemScreen> createState() => _ChiTietTimKiemScreenState();
}
 List<Product> products = [];

class _ChiTietTimKiemScreenState extends State<ChiTietTimKiemScreen> {
  RangeValues _currentRangeValues = const RangeValues(0, 10000000);
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
      body:SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios), 
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
                                  prefixIcon: GestureDetector(
                                     
                                    child: Icon(Icons.search)
                                    ),
                                  hintText: "Search"                               
                                ),
                             ),
                            ),                    
                          ],
                          ),
                      ),
                    ),
                    IconButton(
                      onPressed: (){
                        showModalBottomSheet(
                          backgroundColor: Colors.white,
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                                return Container(
                                    height: MediaQuery.of(context).size.height * 0.9, // Chiếm 90% chiều cao màn hình
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                        Text("Filter",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                                        SizedBox(height: 20,),
                                        Text("Phân loại",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                                        SizedBox(height: 5,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(right: 20),
                                              width: 80,
                                              height: 40,
                                              alignment: Alignment.center,
                                              
                                              decoration: BoxDecoration(
                                                 color: Color(0xFFF6F6F6),
                                                borderRadius: BorderRadius.circular(10),
                                                        
                                              ),
                                              child: Text("Nam", style: TextStyle( ),),
                                            ),
                                            Container(
                                               margin: EdgeInsets.only(right: 20),
                                               width: 80,
                                               height: 40,
                                              alignment: Alignment.center,
                                              
                                              decoration: BoxDecoration(
                                                 color: Color(0xFFF6F6F6),
                                                borderRadius: BorderRadius.circular(10),
                                                        
                                              ),
                                              child: Text("Nữ", style: TextStyle( ),),
                                            ),
                                            Container(
                                               margin: EdgeInsets.only(right: 20),
                                               width: 80,
                                              height: 40,
                                              alignment: Alignment.center,
                                              
                                              decoration: BoxDecoration(
                                                 color: Color(0xFFF6F6F6),
                                                borderRadius: BorderRadius.circular(10),
                                                        
                                              ),
                                              child: Text("Trẻ em", style: TextStyle( ),),
                                            ),
                                           
                                            
                                          ],
                                                                      
                                        ),
                                         SizedBox(height: 5,),
                                        Divider(),
                                        SizedBox(height: 20,),
                                        Text("Kích cỡ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                                        SizedBox(height: 5,),
                                        Row(
                                          
                                          children: [
                                            for (int i = 40; i <= 45; i++)
                                              Container(
                                                width: 40,
                                                height: 40,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                color: Color(0xFFF5F5F5),
                                                borderRadius: BorderRadius.circular(10),
                                                        
                                                ),
                                                margin: EdgeInsets.only(right: 10),
                                                child: Text('$i'),
                                              ),
                                          ],
                                        ),
                                        SizedBox(height: 5,),
                                        Divider(),
                                        SizedBox(height: 20,),
                                        Text("Màu sắc",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                                        SizedBox(height: 5,),
                                        Row(
                                          children: [
                                            for (var color in [Colors.black, Colors.white, Colors.red, Colors.blue])
                                              Container(
                                                margin: EdgeInsets.only(right: 10),
                                                decoration: BoxDecoration(
                                                 color: color,
                                                borderRadius: BorderRadius.circular(10),                      
                                                ),
                                                width: 40,
                                                height: 40,                          
                                              ),
                                          ],
                                        ),
                                        SizedBox(height: 5,),
                                        Divider(),
                                        SizedBox(height: 20,),
                                        Text("Mệnh giá",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                                        
                                        RangeSlider(
                                          activeColor: Color(0xFFCBE9FF), // This sets the color of the selected range
                                          inactiveColor: Colors.white,
                                          values: _currentRangeValues,
                                          min: 0,
                                          max: 10000000,
                                          divisions: 10,
                                          labels: RangeLabels(
                                            _currentRangeValues.start.round().toString(),
                                            _currentRangeValues.end.round().toString(),
                                          ),
                                          onChanged: (RangeValues values) {
                                            setState(() {
                                              _currentRangeValues = values;
                                            });
                                          },
                                        ),
                                        SizedBox(height: 20,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                                  onTap: () {
                                                    
                                                  },
                                                  child: Container(
                                                    height: 40,
                                                    width:150,
                                                    alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFCBE9FF),
                                                  borderRadius: BorderRadius.circular(10),
                                                ),                 
                                                child: Text("Tìm kiếm", style: TextStyle(fontSize: 18),),
                                              ),
                                            ),
                                          ],
                                        )
                                                                      
                                      ],
                                      ),
                                    ),
                                );
                            },
                        );
                      }, 
                      icon: Icon(Icons.filter_list)
                    )
           
                  ],
              ),
              SizedBox(height: 20,),
              Text("Kết quả tìm kiếm cho sản phẩm ABC",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
              ///ListProduct(products: products),
              
              

            ],
          ),
          ),
      ),
    );
  }
  
}