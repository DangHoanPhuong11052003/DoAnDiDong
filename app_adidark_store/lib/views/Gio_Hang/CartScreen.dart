import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_adidark_store/models/ClassCartUser.dart';
import 'package:app_adidark_store/models/DataCartUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../items/ItemCart.dart';
import '../Thanh_Toan/OrderAddressScreen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key,});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartUser> lstCarts=[];
  List lst_vtSum = [];
  double totalPrice = 0;
  int slspchon = 0;
  bool isSelectedAll = false;
  User? user=FirebaseAuth.instance.currentUser;
  String acc="";
  Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
  

  _setupData() async{
    if(await checkInternetConnection()){
      List<CartUser> lstCartsData=await DataCartUser.getData(acc);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if(lstCartsData.isNotEmpty){
        await prefs.setInt('lstLenght', lstCartsData.length);
        for (var i=0 ;i< lstCartsData.length;i++) {
          await prefs.setInt('cartId$i', lstCartsData[i].id);
          await prefs.setInt('cartIdPro$i', lstCartsData[i].idPro);
          await prefs.setString('cartCate$i', lstCartsData[i].cate);
          await prefs.setString('cartColor$i', lstCartsData[i].color);
          await prefs.setString('cartImg$i', lstCartsData[i].img);
          await prefs.setString('cartManufucturer$i', lstCartsData[i].manufucturer);
          await prefs.setString('cartNamePro$i', lstCartsData[i].namePro);
          await prefs.setDouble('cartPrice$i', lstCartsData[i].price);
          await prefs.setInt('cartQuantity$i', lstCartsData[i].quantity);
          await prefs.setInt('cartSize$i', lstCartsData[i].size);
        }}
      if(mounted){
        setState(() {
        lstCarts=lstCartsData;
      });
      }
      }
    else{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? sl=prefs.getInt('lstLenght');
       if(mounted){
        setState(() {
        if(sl!>0){
        for(int i=0;i<sl;i++){
          CartUser cart=CartUser(color: prefs.getString('cartColor$i')??"", id: prefs.getInt('cartId$i')??-1, img: prefs.getString('cartImg$i')??"", manufucturer: prefs.getString('cartManufucturer$i')??"", quantity: prefs.getInt('cartQuantity$i')??-1, size:  prefs.getInt('cartSize$i')??-1, namePro: prefs.getString('cartNamePro$i')??"", idPro:  prefs.getInt('cartIdPro$i')??-1, price:  prefs.getDouble('cartPrice$i')??-1, cate: prefs.getString('cartCate$i')??"", status: 1);
          lstCarts.add(cart);
        }
      }
      });
      }
      
    }

    
  }

  _updatePrice(){
    totalPrice=0;
    for (var element in lstCarts) {
      if(lst_vtSum.contains(element.id)){
        totalPrice+=element.price*element.quantity;
      }
    }
  }

  @override
  void initState() {
    acc= user!.uid;
    super.initState();
     _setupData();
  }

  @override
  Widget build(BuildContext context) {
    
    _updatePrice();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Giỏ hàng", style: TextStyle(fontWeight: FontWeight.w800),),
        centerTitle: true,
      ),
      body: lstCarts.isEmpty?
            Container(
              alignment: Alignment.center,
              child: Text("Hiện chưa có sản phẩm nào!",style: TextStyle(fontSize: 25),)
            ):
            ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: lstCarts.length,
        itemBuilder: (context, index) {
          return ItemCart(
            setupData: () {
              _setupData();
            },
            updatePrice: () {
              setState(() {
                _updatePrice();
              });
            },
            acc: acc,
            cart: lstCarts[index],
            lst_vtSelected: lst_vtSum,
            sumPrice: () {
              setState(() {
                lst_vtSum.add(lstCarts[index].id);
                slspchon++;
                if (lst_vtSum.length == lstCarts.length) {
                  isSelectedAll = true;
                }
              });
            },
            minusPrice: () {
              setState(() {
                lst_vtSum.remove(lstCarts[index].id);
                slspchon--;
                isSelectedAll = false;
              });
            },
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        width: 200,
        height: 190,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isSelectedAll = !isSelectedAll;
                  if (isSelectedAll) {
                     lstCarts.forEach((element) {
                      lst_vtSum.add(element.id);
                    });
                    slspchon = lstCarts.length;
                  } else {
                    totalPrice = 0;
                    slspchon = 0;
                    lst_vtSum.clear();
                  }
                });
              },
              child: Row(
                children: [
                  !isSelectedAll
                      ? Icon(
                          Icons.circle_outlined,
                          color: Colors.black,
                        )
                      : Icon(
                          Icons.task_alt_outlined,
                          color: Colors.red,
                        ),
                  Text(" Chọn tất cả sản phẩm",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Số đơn hàng đã chọn: ",
                        style: TextStyle(fontSize: 18)),
                    Text(
                      "$slspchon sản phẩm",
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tổng tiền:", style: TextStyle(fontSize: 18)),
                    Text(
                      "$totalPrice VND",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )
                  ],
                )
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            GestureDetector(
              onTap: () {
                if (slspchon > 0) {
                  List<CartUser> lstSelectedCart=[];
                  setState(() {
                    for (int element in lst_vtSum) {
                      lstSelectedCart.add(lstCarts[element]);
                    }
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderAddressScreen(carts: lstSelectedCart,)));
                }
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: slspchon == 0
                        ? Colors.grey
                        : const  Color(0xFFADDDFF)),
                height: 50,
                width: 200,
                child: const Text(
                  "ĐẶT HÀNG",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
          ],
        ),
      ),
    );
  }
}
