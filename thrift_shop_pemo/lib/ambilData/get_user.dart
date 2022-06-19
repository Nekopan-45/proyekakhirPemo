import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  final String documentID;

  GetUserName({required this.documentID});

  @override
  Widget build(BuildContext context) {
    CollectionReference user_data =
        FirebaseFirestore.instance.collection('Users');
    return FutureBuilder<DocumentSnapshot>(
        future: user_data.doc(documentID).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text("${data['nama']}");
          }
          return Text('Loading...');
        }));
  }
}
