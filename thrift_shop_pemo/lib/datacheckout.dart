import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thrift_shop_pemo/Home.dart';

import 'Controller.dart';

class Output extends StatelessWidget {
  Output({Key? key}) : super(key: key);

  final TextController textCtrl = Get.put(TextController());
  final RadioController radioCtrl = Get.put(RadioController());
  String getPembayaran(Pembayaran? value) {
    if (value == Pembayaran.cod) {
      return "COD";
    } else if (value == Pembayaran.dana) {
      return "DANA";
    } else if (value == Pembayaran.shopeePay) {
      return "ShopeePay";
    }
    return "Transfer Bank";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffa85cf9),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 95),
              child: Image.asset(
                'assets/logoAtas.png',
                fit: BoxFit.contain,
                height: 25,
              ),
            ),
            Icon(Icons.notifications_outlined),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(30),
            alignment: Alignment.centerLeft,
            child: Text("Nama Lengkap : ${textCtrl.namaLengkap.value}"),
          ),
          Container(
            padding: EdgeInsets.all(30),
            alignment: Alignment.centerLeft,
            child: Text("No Hp / Whatsapp : ${textCtrl.noHp.value}"),
          ),
          Container(
            padding: EdgeInsets.all(30),
            alignment: Alignment.centerLeft,
            child: Text("Email : ${textCtrl.email.value}"),
          ),
          Container(
            padding: EdgeInsets.all(30),
            alignment: Alignment.centerLeft,
            child: Text("Alamat : ${textCtrl.alamat.value}"),
          ),
          Container(
            padding: EdgeInsets.all(30),
            alignment: Alignment.centerLeft,
            child: Text("Kode Pos : ${textCtrl.kodePos.value}"),
          ),
          Container(
            padding: EdgeInsets.all(30),
            alignment: Alignment.centerLeft,
            child: Text("Catatan Tambahan : ${textCtrl.catatan.value}"),
          ),
          Container(
            padding: EdgeInsets.all(30),
            alignment: Alignment.centerLeft,
            child: Text("Kode Kupon : ${textCtrl.kupon.value}"),
          ),
          Container(
            padding: EdgeInsets.all(30),
            alignment: Alignment.centerLeft,
            child: Text('Pembayaran : COD'),
          ),
          ElevatedButton(
              onPressed: () {
                Get.off(Home());
              },
              child: Text("Kembali ke menu awal!"))
        ],
      ),
    );
  }
}
