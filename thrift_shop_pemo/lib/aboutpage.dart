import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "About",
            style: Theme.of(context).textTheme.headline2,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Aplikasi M-Thrifty merupakan hasil kerja sama pada mata kuliah pemrograman mobile karya dari Kelompok 2 kelas C 2020 dengan berbagai fitur menarik yang masih dalam tahap pengembangan",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black45,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
