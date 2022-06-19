import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> userSetup(String nama, String noHP, String email, String alamat,
    String kodepos) async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  users.add({'nama': nama, 'noHP': noHP, 'alamat': alamat, 'kodepos': kodepos});
  return;
}
