import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thrift_shop_pemo/Controller.dart';
import 'package:thrift_shop_pemo/Favorite.dart';
import 'package:thrift_shop_pemo/Home.dart';
import 'package:thrift_shop_pemo/Profile.dart';
import 'package:thrift_shop_pemo/aboutpage.dart';
import 'package:thrift_shop_pemo/alert.dart';
import 'package:thrift_shop_pemo/checkout.dart';
import 'package:thrift_shop_pemo/datacheckout.dart';
import 'LandingPage.dart';
import 'Favorite.dart';
import 'Profile.dart';
import 'package:thrift_shop_pemo/Controller.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final TextController kontrol = Get.put(TextController());

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
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xffEEA4CE).withOpacity(0.2),
                    Color(0xffC58BF2).withOpacity(0.2),
                  ]),
                ),
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Image.asset(
                          "assets/logo.png",
                          fit: BoxFit.contain,
                          height: 80,
                        )),
                    Image.asset("assets/logop.png"),
                  ],
                )),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Color(0xffa85cf9),
              ),
              title: Text("Home"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) {
                    return Home();
                  },
                ));
              },
              //
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Color(0xffa85cf9),
              ),
              title: Text("Profile"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) {
                    return Profile();
                  },
                ));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.info,
                color: Color(0xffa85cf9),
              ),
              title: Text("About Us"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) {
                    return AboutPage();
                  },
                ));
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              // if (kontrol.namaLengkapCtrl.value == '')
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (kontrol.namaLengkapCtrl.value == null) {
                      Text(
                        "Tidak Ada Riwayat Berbelanja",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      );
                    } else {
                      Get.off(Output());
                    }
                  },
                  child: Text("Lihat Riwayat Belanja"),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
