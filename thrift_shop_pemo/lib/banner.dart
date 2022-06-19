import 'package:flutter/material.dart';

class banner extends StatelessWidget {
  const banner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WEEKLY FASHION'),
        backgroundColor: Color(0xffa85cf9),
      ),
    );
  }
}
