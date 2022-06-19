import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controller.dart';
import 'alert.dart';

class checkout extends StatefulWidget {
  const checkout({Key? key}) : super(key: key);

  @override
  State<checkout> createState() => _checkoutState();
}

class _checkoutState extends State<checkout> {
  final TextController textCtrl = Get.put(TextController());
  final RadioController radioCtrl = Get.put(RadioController());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
          Column(
            children: [
              Padding(
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8)),
              Text(
                "DATA PENGIRIMAN",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffa85cf9)),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: textCtrl.namaLengkapCtrl,
                decoration: InputDecoration(
                  fillColor: Color(0xffa85cf9).withOpacity(0.13),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  labelText: "Nama Lengkap",
                  labelStyle: TextStyle(color: Color(0xffa85cf9)),
                  hintText: 'Masukkan Nama Lengkap',
                  hintStyle: TextStyle(color: Color(0xffa85cf9)),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: textCtrl.noHpCtrl,
                decoration: InputDecoration(
                  fillColor: Color(0xffa85cf9).withOpacity(0.13),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  labelText: "No HP / Whatsapp",
                  labelStyle: TextStyle(color: Color(0xffa85cf9)),
                  hintText: 'Masukkan No Hp / Whatsapp',
                  hintStyle: TextStyle(color: Color(0xffa85cf9)),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: textCtrl.emailCtrl,
                decoration: InputDecoration(
                  fillColor: Color(0xffa85cf9).withOpacity(0.13),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  labelText: "Email",
                  labelStyle: TextStyle(color: Color(0xffa85cf9)),
                  hintText: 'Masukkan Email',
                  hintStyle: TextStyle(color: Color(0xffa85cf9)),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                maxLines: 4,
                controller: textCtrl.alamatCtrl,
                decoration: InputDecoration(
                  fillColor: Color(0xffa85cf9).withOpacity(0.13),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  labelText: "Alamat",
                  labelStyle: TextStyle(color: Color(0xffa85cf9)),
                  hintText: 'Masukkan Alamat',
                  hintStyle: TextStyle(color: Color(0xffa85cf9)),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: textCtrl.kodePosCtrl,
                decoration: InputDecoration(
                  fillColor: Color(0xffa85cf9).withOpacity(0.13),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  labelText: "Kode Pos",
                  labelStyle: TextStyle(color: Color(0xffa85cf9)),
                  hintText: 'Masukkan Kode Pos',
                  hintStyle: TextStyle(color: Color(0xffa85cf9)),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                maxLines: 5,
                controller: textCtrl.catatanCtrl,
                decoration: InputDecoration(
                  fillColor: Color(0xffa85cf9).withOpacity(0.13),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  labelText: "Catatan Tambahan",
                  labelStyle: TextStyle(color: Color(0xffa85cf9)),
                  hintText: 'Masukkan Catatan Tambahan',
                  hintStyle: TextStyle(color: Color(0xffa85cf9)),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: textCtrl.kuponCtrl,
                decoration: InputDecoration(
                  fillColor: Color(0xffa85cf9).withOpacity(0.13),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  labelText: "Kode Kupon",
                  labelStyle: TextStyle(color: Color(0xffa85cf9)),
                  hintText: 'Masukkan Kode Kupon',
                  hintStyle: TextStyle(color: Color(0xffa85cf9)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 200,
                height: 50,
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Color(0xffa85cf9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onPressed: () {
                    textCtrl.onSubmit();
                    CustomAlert(context, "DATA BERHASIL DITAMBAHKAN!");
                  },
                  child: Text("Konfirmasi",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          letterSpacing: 2,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          )
        ],
      ),
    );
  }
}
