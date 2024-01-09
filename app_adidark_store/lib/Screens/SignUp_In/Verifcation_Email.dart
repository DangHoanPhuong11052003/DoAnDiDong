import 'package:flutter/material.dart';

class Verification_Email extends StatefulWidget {
  const Verification_Email({super.key});

  @override
  State<Verification_Email> createState() => VerificationState();
}

class VerificationState extends State<Verification_Email> {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Nhập Email'),
        centerTitle: true,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 20.0), // Thêm khoảng cách lề bên trái
                  child: Text(
                    'Vui lòng nhập email để thay đổi mật khẩu',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                    controller: emailController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Center(
                child: InkWell(
                  onTap: null,
                  borderRadius: BorderRadius.circular(50),
                  child: Ink(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.white, width: 2.0),
                    ),
                    child: Container(
                      width: 250,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text(
                        'Tiếp tục',
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
          ]),
    );
  }
}
