import 'package:app_adidark_store/views/SignUp_In/SignUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../items/BottomMenu.dart';


class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen>
    with SingleTickerProviderStateMixin {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  bool _check = false;
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

  Future<void> _SignIn() async {
    String email = phoneController.text;
    String password = passwordController.text;
    if (email == '123' && password == 'abc') {
      _check = true;
    } else {
      _check = false;
    }
    if (_check) {
      await showDoneDialog();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomMenu()),
      );
    }
  }

  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
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
                "Chào bạn, đăng nhập để tiếp tục",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      style: const TextStyle(
                        color: Color(0xFF0597F2),
                        fontSize: 18,
                      ),
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Số điện thoại',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextFormField(
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
                        border: InputBorder.none,
                        hintText: 'Mật khẩu',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                      obscureText: _obscureText,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1.0),
                child: Center(
                  child: InkWell(
                    onTap: _SignIn,
                    borderRadius: BorderRadius.circular(50),
                    child: Ink(
                      decoration: BoxDecoration(
                        color: Color(0xFFADDDFF),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.white, width: 2.0),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        alignment: Alignment.center,
                        child: const Text(
                          'Đăng nhập',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Bạn đã chưa có tài khoản ?',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()));
                    },
                    child: Text(
                      'Đăng ký',
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ));
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
              "Đăng nhập thành công",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
