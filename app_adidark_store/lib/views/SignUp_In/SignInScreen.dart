import 'package:app_adidark_store/items/BottomMenu.dart';
import 'package:app_adidark_store/views/SignUp_In/SignUpScreen.dart';
import 'package:app_adidark_store/views/SignUp_In/VerifiedScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/ClassUser.dart';
import 'controller/SignIn_Controller.dart';
import 'controller/SignUp_Failure.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen>
    with SingleTickerProviderStateMixin {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final _frmkey = GlobalKey<FormState>();
  final _auth = Get.put(LoginController());
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  bool visible = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
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

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegex.hasMatch(email);
  }

  void _signIn() async {
    final SharedPreferences prefs = await _prefs;
    if (_frmkey.currentState!.validate()) {
      final user = Users(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      try {
        await _auth.loginAccount(user);
        await showDoneDialog();
        _auth.route(context, const BottomMenu());
        prefs.setString("Password", passwordController.text.trim());
        print('Success');
      } on SignUp_AccountFailure catch (e) {
        await showFailureDialog(message: e.message);
      } catch (_) {
        await showFailureDialog();
      }
    }
  }

  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
                  Form(
                    key: _frmkey,
                    child: Column(
                      children: [
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
                            if (!isValidEmail(email)) {
                              return 'Vui lòng nhập đúng định dang !';
                            }
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
                  const SizedBox(height: 5.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPassword()),
                      );
                    },
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Quên mật khẩu?',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    child: Center(
                        child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      elevation: 5.0,
                      height: 45,
                      minWidth: double.infinity,
                      onPressed: () {
                        setState(() {
                          visible = true;
                        });
                        _signIn();
                      },
                      child: Text(
                        "Đăng nhập",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      color: Color(0xFFADDDFF),
                    )),
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

  Future<void> showFailureDialog({String? message}) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              'assets/animations/login_failure.json',
              repeat: false,
              controller: controller,
              onLoaded: (composition) {
                controller.duration = composition.duration;
                controller.forward();
              },
            ),
            Text(
              message ?? "Đăng nhập thất bại",
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
