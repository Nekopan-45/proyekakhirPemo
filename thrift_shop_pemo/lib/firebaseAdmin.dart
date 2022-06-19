import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> adminSetup(
  String gambar,
  String jenis,
  String nama,
  String ukuran,
  String warna,
) async {
  CollectionReference users = FirebaseFirestore.instance.collection('barang');
  users.add({
    'gambar': gambar,
    'jenis': jenis,
    'nama': nama,
    'ukuran': ukuran,
    'warna': warna
  });
  return;
}
