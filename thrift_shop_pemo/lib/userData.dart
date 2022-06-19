import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class dataBaseService {
  final String uid;

  dataBaseService({required this.uid});

  final userCollection = FirebaseFirestore.instance.collection("Users");

  Future updateUserInfo(String nama, String nomorHP) async {
    return await userCollection.doc(uid).set({
      'nama': nama,
      'noHP': nomorHP,
    });
  }

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
