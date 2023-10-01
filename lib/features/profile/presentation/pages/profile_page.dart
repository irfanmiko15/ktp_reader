import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:namefully/namefully.dart';
import 'package:testocr/features/profile/presentation/bloc/scan_ktp_bloc.dart';

import '../../../../injection_container.dart';

class EditProfileScreen extends StatelessWidget {
  final TextEditingController tecNik = TextEditingController();
  final TextEditingController tecFirstName = TextEditingController();
  final TextEditingController tecLastName = TextEditingController();

  final TextEditingController tecDate = TextEditingController();
  final TextEditingController tecTempalLahir = TextEditingController();
  final TextEditingController tecKelamin = TextEditingController();
  final TextEditingController tecAlamat = TextEditingController();
  final TextEditingController tecAgama = TextEditingController();
  final TextEditingController tecPerkawinan = TextEditingController();
  final TextEditingController tecPekerjaan = TextEditingController();
  final TextEditingController tecKewarganegaraan = TextEditingController();
  final DateFormat dateFormat = DateFormat("dd-MM-yyyy");

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScanKtpBloc, ScanKtpState>(
        listener: (context, state) async {
      if (state is Success) {
        tecNik.text = state.userData.nik!;
        if(state.userData.namaLengkap != "R"){
          var name = Namefully(state.userData.namaLengkap!);

        tecFirstName.text = "${name.first} ${name.middle}";
        tecLastName.text = name.last;
        }
        

        tecDate.text = state.userData.tanggalLahir!;
        tecTempalLahir.text = state.userData.tempatLahir!;
        tecKelamin.text = state.userData.jenisKelamin!;
        tecAlamat.text = state.userData.alamatFull!;
        tecAgama.text = state.userData.agama!;
        tecPerkawinan.text = state.userData.statusPerkawinan!;
        tecPekerjaan.text = state.userData.pekerjaan!;
        tecKewarganegaraan.text = state.userData.kewarganegaraan!;
      }
      if (state is Error) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.message)));
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Edit Profile"),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Profile Image",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Icon(
                        Icons.person,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  controller: tecNik,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'NIK',
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
                TextFormField(
                  controller: tecFirstName,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Nama Depan',
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
                TextFormField(
                  controller: tecLastName,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Nama Belakang',
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: new DateTime.now(),
                        firstDate: new DateTime(1960),
                        lastDate: new DateTime(2025));
                    if (picked != null)
                      tecDate.text = dateFormat.format(picked);
                  },
                  child: TextFormField(
                    enabled: false,
                    controller: tecDate,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Tanggal Lahir',
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                TextFormField(
                  controller: tecKelamin,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Jenis Kelamin',
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
                TextFormField(
                  controller: tecAlamat,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Alamat',
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
                TextFormField(
                  controller: tecAgama,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Agama',
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
                TextFormField(
                  controller: tecPerkawinan,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Status Perkawinan',
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
                TextFormField(
                  controller: tecPekerjaan,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Pekerjaan',
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
                TextFormField(
                  controller: tecKewarganegaraan,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Kewarganegaraan',
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
