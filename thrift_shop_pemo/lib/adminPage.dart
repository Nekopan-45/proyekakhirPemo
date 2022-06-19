import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:thrift_shop_pemo/firebaseAdmin.dart';
import 'package:thrift_shop_pemo/storage_service.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final TextEditingController jenisController = TextEditingController();
  final TextEditingController barangController = TextEditingController();
  final TextEditingController ukuranController = TextEditingController();
  final TextEditingController warnaController = TextEditingController();
  final TextEditingController namaGambar = TextEditingController();
  final Storage storage = Storage();

  @override
  Widget build(BuildContext context) {
    final jenisForm = TextFormField(
      autofocus: false,
      controller: jenisController,
      onSaved: (value) {
        jenisController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: 'Jenis Barang',
        labelStyle: TextStyle(fontWeight: FontWeight.w400),
        hintText: 'Jenis',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );

    final barangForm = TextFormField(
      autofocus: false,
      controller: barangController,
      onSaved: (value) {
        barangController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'Nama Barang',
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelStyle: TextStyle(fontWeight: FontWeight.w400),
        hintText: 'Nama Barang',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );

    final ukuranForm = TextFormField(
      autofocus: false,
      controller: ukuranController,
      onSaved: (value) {
        ukuranController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'Ukuran',
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelStyle: TextStyle(fontWeight: FontWeight.w400),
        hintText: 'Ukuran',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );

    final warnaForm = TextFormField(
      autofocus: false,
      controller: warnaController,
      onSaved: (value) {
        warnaController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: 'Warma',
        labelStyle: TextStyle(fontWeight: FontWeight.w400),
        hintText: 'Warna',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );

    final formGambar = TextFormField(
      autofocus: false,
      controller: namaGambar,
      onSaved: (value) {
        namaGambar.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: 'Gambar Barang',
        labelStyle: TextStyle(fontWeight: FontWeight.w400),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );

    final tambahData = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.purpleAccent,
      child: MaterialButton(
        onPressed: () {
          adminSetup(
              namaGambar.text,
              jenisController.text,
              barangController.text,
              ukuranController.text,
              warnaController.text);
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
        appBar: AppBar(
          backgroundColor: Color(0xffa85cf9),
          title: Text(
            "Admin Page",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(25),
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Tambah Data Barang",
                          style: Theme.of(context).textTheme.headline4),
                      SizedBox(height: 20),
                      jenisForm,
                      SizedBox(height: 20),
                      barangForm,
                      SizedBox(height: 20),
                      ukuranForm,
                      SizedBox(height: 20),
                      warnaForm,
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          final gambarForm =
                              await FilePicker.platform.pickFiles(
                            allowMultiple: false,
                            type: FileType.custom,
                            allowedExtensions: ['png', 'jpg'],
                          );

                          if (gambarForm == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Tidak Ada File!'),
                              ),
                            );
                            return null;
                          }

                          final path = gambarForm.files.single.path!;
                          final fileName = gambarForm.files.single.name;

                          storage.uploadFile(path, fileName).then(
                                (value) => print("Done!"),
                              );
                          namaGambar.text =
                              gambarForm.files.single.name.toString();
                        },
                        child: Text('Upload Gambar'),
                      ),
                      SizedBox(height: 20),
                      tambahData,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
