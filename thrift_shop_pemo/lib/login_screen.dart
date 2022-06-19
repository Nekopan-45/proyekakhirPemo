import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:thrift_shop_pemo/Home.dart';
import 'package:thrift_shop_pemo/alertsign.dart';
import 'package:thrift_shop_pemo/alertsingin.dart';
import 'package:thrift_shop_pemo/regis_screen.dart';

import 'adminPage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //formkey
  final _formKey = GlobalKey<FormState>();

  //editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passController = new TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailController.text = value!;
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

    final passField = TextFormField(
      autofocus: false,
      controller: passController,
      obscureText: true,
      onSaved: (value) {
        passController.text = value!;
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

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.purpleAccent,
      child: MaterialButton(
        onPressed: () async {
          // try {
          //   final credential =
          //       await FirebaseAuth.instance.signInWithEmailAndPassword(
          //     email: emailController.text,
          //     password: passController.text,
          //   );
          // } on FirebaseAuthException catch (e) {
          //   if (e.code == 'user-not-found' || e.code == 'wrong-password') {
          //     ScaffoldMessenger.of(context).showSnackBar(
          //         SnackBar(content: Text("User Tidak Ditemukan!")));
          //   } else {
          if (emailController.text == "" && passController.text == "") {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Kolom Tidak Boleh Kosong!")));
          } else if (emailController.text == "admin@gmail.com" &&
              passController.text == "admin123") {
            Get.off(AdminPage());
          } else {
            FirebaseAuth.instance
                .signInWithEmailAndPassword(
                    email: emailController.text, password: passController.text)
                .then(
              (value) {
                CustomAlert3(context, "ANDA BERHASIL LOGIN");
              },
            );
          }
        },
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        child: Text(
          "Login",
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
      backgroundColor: Color(0xffa85cf9).withOpacity(0.9),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
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
                    emailField,
                    SizedBox(height: 20),
                    passField,
                    SizedBox(height: 30),
                    loginButton,
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account? "),
                        GestureDetector(
                          onTap: () {
                            Get.to(RegisScreen());
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.purpleAccent,
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
    );
  }
}
