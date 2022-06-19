import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thrift_shop_pemo/alertsign.dart';
import 'package:thrift_shop_pemo/alertsingin.dart';
import 'package:thrift_shop_pemo/firebase.dart';
import 'package:thrift_shop_pemo/login_screen.dart';

class RegisScreen extends StatefulWidget {
  const RegisScreen({Key? key}) : super(key: key);

  @override
  State<RegisScreen> createState() => _RegisScreenState();
}

class _RegisScreenState extends State<RegisScreen> {
  final _formKey = GlobalKey<FormState>();

  final namaEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passEditingController = new TextEditingController();
  final nomorHPEditingController = new TextEditingController();
  final alamatController = new TextEditingController();
  final kodeposController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final namaField = TextFormField(
      autofocus: false,
      controller: namaEditingController,
      keyboardType: TextInputType.emailAddress,
      //validator: () {},

      onSaved: (value) {
        namaEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person_outline),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Nama Lengkap",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );

    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      //validator: () {},

      onSaved: (value) {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email_outlined),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );

    final nomorHPField = TextFormField(
      autofocus: false,
      controller: nomorHPEditingController,
      keyboardType: TextInputType.emailAddress,
      //validator: () {},

      onSaved: (value) {
        nomorHPEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.phone_outlined),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Nomor HP",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );

    final alamatField = TextFormField(
      autofocus: false,
      controller: alamatController,
      keyboardType: TextInputType.emailAddress,
      //validator: () {},

      onSaved: (value) {
        alamatController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.location_city_outlined),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Alamat",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );

    final kodeposField = TextFormField(
      autofocus: false,
      controller: kodeposController,
      //validator: () {},

      onSaved: (value) {
        kodeposController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.numbers_outlined),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Kode Pos",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );

    final passField = TextFormField(
      autofocus: false,
      controller: passEditingController,
      obscureText: true,
      //validator: () {},

      onSaved: (value) {
        passEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key_outlined),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );

    final regisButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color(0xffa85cf9),
      child: MaterialButton(
        onPressed: () {
          userSetup(
              namaEditingController.text,
              nomorHPEditingController.text,
              emailEditingController.text,
              alamatController.text,
              kodeposController.text);
          FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: emailEditingController.text,
                  password: passEditingController.text)
              .then((value) {
            CustomAlert2(context, "AKUN BERHASIL DIBUAT!");
          });
        },
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        child: Text(
          "Sign Up",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    return Scaffold(
      body: Container(
        color: Color(0xffa85cf9).withOpacity(0.3),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 150,
                        child: Image.asset(
                          "assets/logo.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 45),
                      namaField,
                      SizedBox(height: 20),
                      emailField,
                      SizedBox(height: 20),
                      nomorHPField,
                      SizedBox(height: 20),
                      alamatField,
                      SizedBox(height: 20),
                      kodeposField,
                      SizedBox(height: 20),
                      passField,
                      SizedBox(height: 30),
                      regisButton,
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Do you have an account? "),
                          GestureDetector(
                            onTap: () {
                              Get.to(LoginScreen());
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Color(0xffa85cf9),
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void pickUploadImage() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 512,
      maxHeight: 512,
      imageQuality: 75,
    );
  }
}
