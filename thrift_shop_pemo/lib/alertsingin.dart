import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thrift_shop_pemo/login_screen.dart';

Future<dynamic> CustomAlert2(BuildContext context, String pesan) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Color(0xffa85cf9).withOpacity(0.3),
        actions: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    "AKUN BERHASIL\nDIBUAT",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(bottom: 20, top: 20),
                  child: InkWell(
                    onTap: () {
                      Get.to(LoginScreen());
                    },
                    child: Container(
                      width: 250,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xffa85cf9).withOpacity(0.7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "Kembali Ke Login",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
