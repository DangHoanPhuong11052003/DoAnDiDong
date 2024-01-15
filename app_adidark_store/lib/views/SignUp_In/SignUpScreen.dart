import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:lottie/lottie.dart';

import '../../models/ClassUser.dart';
import 'SignInScreen.dart';
import 'SignUp_Controller.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  final _frmkey = GlobalKey<FormState>();
  final _user = Get.put(UserController());
  final _auth = FirebaseAuth.instance;
  bool showProgress = false;
  bool _obscureText = true;
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController name = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
        controller.reset();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void signUp(String fullname, String email, String password) async {
  if (_frmkey.currentState!.validate()) {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => postDetailsToFirestore(fullname, email, password))
        .catchError((e) {
          // Xử lý lỗi ở đây
          print('Error: $e');
          return null; // hoặc có thể trả về một giá trị khác có kiểu dữ liệu là void
        });
    showDoneDialog();
  }
}

  postDetailsToFirestore(
    String fullname,
    String email,
    String passwword,
  ) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref = firebaseFirestore.collection('Users');
    ref.doc(user!.uid).set({
      'fullName': name.text.trim(),
      'email': emailController.text.trim(),
      'password': passwordController.text.trim(),
    });
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Login_Screen()));
  }
  // Future<void> _SignUp() async {
  //   if (_frmkey.currentState!.validate()) {
  //     showDoneDialog();

  //     final email = _user.email.text.trim();
  //     final password = _user.password.text.trim();
  //     final fullName = _user.fullname.text.trim();

  //     try {
  //       await UserController.instance.createAccount(email, password);
  //     } catch (e) {
  //       // Xử lý lỗi nếu có
  //       print('Auth_User Error: $e');
  //       // Hiển thị thông báo lỗi cho người dùng
  //       return;
  //     }

  //     // Tạo người dùng trong Firestore
  //     final user = User(
  //       fullName: fullName,
  //       email: email,
  //       password: password,
  //     );
  //     UserController.instance.createUser(user);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Image(
                    height: 100,
                    image: AssetImage('assets/logo/logo.jpg'),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Text(
                      "AdidarkVipro",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Chào mừng trở lại",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const Row(
                    children: [
                      Text(
                        "với",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 28.0,
                            fontWeight: FontWeight.w900,
                            fontFamily: "Mulish"),
                      ),
                      Text(
                        " AdidarkVipro",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 28.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Text(
                "Chào bạn, ký để tiếp tục",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 30.0),
              Form(
                key: _frmkey,
                child: Column(
                  children: [
                    TextFormField(
                      style: const TextStyle(
                        color: Color(0xFF0597F2),
                        fontSize: 18,
                      ),
                      controller: name,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Họ và Tên",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Color(0xFFADDDFF),
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                      ),
                      validator: (email) {
                        if (email!.isEmpty) {
                          return 'Vui lòng nhập Họ Tên';
                        }

                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      style: const TextStyle(
                        color: Color(0xFF0597F2),
                        fontSize: 18,
                      ),
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Color(0xFFADDDFF),
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                      ),
                      validator: (email) {
                        if (email!.isEmpty) {
                          return 'Vui lòng nhập email';
                        }
                        // if (!isValidEmail(email)) {
                        //   return 'Vui lòng nhập đúng định dang !';
                        // }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      style: TextStyle(
                        color: Color(0xFF0597F2),
                        fontSize: 18,
                      ),
                      controller: passwordController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Color.fromARGB(255, 42, 43, 44),
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        labelText: "Password",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Color(0xFFADDDFF),
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                      ),
                      obscureText: _obscureText,
                      validator: (pass) {
                        if (pass!.isEmpty) {
                          return 'Vui lòng nhập mật khẩu';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (newValue) {},
                  ),
                  Text(
                    'Đồng ý với ',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    'Chính sách dịch vụ & Quyền riêng tư',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1.0),
                child: Center(
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    elevation: 5.0,
                    height: 40,
                    onPressed: () {
                      setState(() {
                        showProgress = true;
                      });
                      signUp(name.text, emailController.text,
                          passwordController.text);
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Bạn đã có tài khoản ?',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login_Screen()));
                    },
                    child: Text(
                      'Đăng nhập',
                      style: TextStyle(color: Color(0xFFADDDFF)),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showDoneDialog() async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              'assets/animations/login_successly.json',
              repeat: false,
              controller: controller,
              onLoaded: (composition) {
                controller.duration = composition.duration;
                controller.forward();
              },
            ),
            Text(
              "Đăng ký thành công",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
