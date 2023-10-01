import 'dart:io';

import 'package:testocr/features/profile/data/models/ktp_model.dart';
import 'package:testocr/features/profile/domain/repository/scan_ktp_repository.dart';

class ScanKtpUsecase{
  final ScanKtpRepository scanKtpRepo;

  ScanKtpUsecase({required this.scanKtpRepo});

  Future<KtpDataModel> getUserData(File fileImage)async{

    final result = await scanKtpRepo.scanUserData(fileImage);

    print("result after normalization");
    print("nik : " + result.nik.toString());
    print("nama : " + result.namaLengkap.toString());
    print("tempatLahir : " +  result.tempatLahir.toString());
    print("tglLahir : " + result.tanggalLahir.toString());
    print("jenis kelamin : " + result.jenisKelamin.toString());
    print("alamat full : " + result.alamatFull.toString());
    print("alamat : " + result.alamat.toString());
    print("rt rw : " + result.rtrw.toString());
    print("kel desa : " + result.kelDesa.toString());
    print("kecamatan : " + result.kecamatan.toString());
    print("agama : " + result.agama.toString());
    print("status kawin : " + result.statusPerkawinan.toString());
    print("pekerjaan : " + result.pekerjaan.toString());
    print("kewarganegaraan : " + result.kewarganegaraan.toString());

    return result;
  }
}