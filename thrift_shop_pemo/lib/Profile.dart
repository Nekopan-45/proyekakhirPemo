import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thrift_shop_pemo/Cart.dart';
import 'package:thrift_shop_pemo/Home.dart';
import 'package:thrift_shop_pemo/aboutpage.dart';
import 'package:thrift_shop_pemo/userData.dart';
import 'package:thrift_shop_pemo/user_preference.dart';
import 'LandingPage.dart';
import 'package:thrift_shop_pemo/user.dart';
import 'ambilData/get_user.dart';

class Profile extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;
  final user_data = UserPref.myUser;
  final users = FirebaseFirestore.instance;
  FirebaseFirestore Firestore = FirebaseFirestore.instance;
  CollectionReference usersCol = FirebaseFirestore.instance.collection('Users');

  List<String> docIDs = [];

  Future getDocID() async {
    await FirebaseFirestore.instance.collection("Users").get().then(
          (snapshot) => snapshot.docs.forEach(
            (element) {
              print(element.reference);
              docIDs.add(element.reference.id);
            },
          ),
        );
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
                Icons.shopping_cart,
                color: Color(0xffa85cf9),
              ),
              title: Text("Cart"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) {
                    return Cart();
                  },
                ));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.person_off_outlined,
                color: Color(0xffa85cf9),
              ),
              title: Text("Log Out"),
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Get.off(LandingPage());
                });
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
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: 24),
          buildName(user),
          SizedBox(height: 24),
          Center(child: buildEditbutton()),
          SizedBox(height: 24),
          SizedBox(height: 48),
          buildTentang(user),
        ],
      ),
    );
  }

  Widget buildName(user) => Column(
        children: [
          Text(
            user.email,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
              fontSize: 24,
            ),
          ),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildEditbutton() => ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xffa85cf9))),
        child: Text("Edit Profile"),
      );

  Widget buildTentang(user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nomor HP",
            ),
            const SizedBox(height: 18),
            Text(
              "081248096709",
              style: TextStyle(fontSize: 15, height: 1.4),
            )
          ],
        ),
      );
}

class dataBaseService {
  final String uid;

  dataBaseService({required this.uid});

  final userCollection = FirebaseFirestore.instance.collection("Users");

  Stream<QuerySnapshot> get users {
    return userCollection.snapshots();
  }

  getCurrentUserData() async {
    try {
      DocumentSnapshot ds = await userCollection.doc(uid).get();
      String nama = ds.get('nama');
      String nomorHP = ds.get('noHP');
      return [nama, nomorHP];
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
