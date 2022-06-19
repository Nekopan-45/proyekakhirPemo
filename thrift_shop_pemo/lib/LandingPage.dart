import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:get/get.dart';
import 'package:thrift_shop_pemo/login_screen.dart';
import 'login_screen.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Color(0xffa85cf9).withOpacity(0.3),
        alignment: Alignment.center,
        child: Column(
          children: [
            // SizedBox(
            //   height: tinggi / 2.5,
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Image.asset('assets/logo.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Image.asset('assets/logop.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(LoginScreen());
                },
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(99))),
                child: Ink(
                  decoration: BoxDecoration(
                      color: Color(0xffa85cf9),
                      borderRadius: BorderRadius.circular(99)),
                  child: Container(
                    width: 230,
                    height: 60,
                    alignment: Alignment.center,
                    child: const Text(
                      'START',
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
