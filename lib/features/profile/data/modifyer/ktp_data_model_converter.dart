import 'package:flutter/material.dart';
import 'package:testocr/features/profile/data/models/ktp_model.dart';
import 'package:testocr/features/profile/data/modifyer/field_detector.dart';
import 'package:testocr/features/profile/data/modifyer/mlkit_text_normalization.dart';
class KtpDataModelConverter extends KtpDataModel {
  KtpDataModelConverter({
    @required nik,
    @required namaLengkap,
    @required tanggalLahir,
    @required alamatFull,
    @required alamat,
    @required rtrw,
    @required kecamatan,
    @required kelDesa,
    @required agama,
    @required statusPerkawinan,
    @required tempatLahir,
    @required jenisKelamin,
    @required golDarah,
    @required pekerjaan,
    @required kewarganegaraan,
    @required berlakuHingga,
  }) : super(
          nik: nik,
          namaLengkap: namaLengkap,
          tanggalLahir: tanggalLahir,
          alamatFull: alamatFull,
          alamat: alamat,
          rtrw: rtrw,
          kecamatan: kecamatan,
          kelDesa: kelDesa,
          agama: agama,
          statusPerkawinan: statusPerkawinan,
          tempatLahir: tanggalLahir,
          jenisKelamin: jenisKelamin,
          golDarah: golDarah,
          pekerjaan: pekerjaan,
          kewarganegaraan: kewarganegaraan,
          berlakuHingga: berlakuHingga,
        );

  factory KtpDataModelConverter.from({
    @required nik,
    @required namaLengkap,
    @required tanggalLahir,
    @required alamatFull,
    @required alamat,
    @required rtrw,
    @required kelDesa,
    @required kecamatan,
    @required agama,
    @required statusPerkawinan,
    @required tempatLahir,
    @required jenisKelamin,
    @required golDarah,
    @required pekerjaan,
    @required kewarganegaraan,
    @required berlakuHingga,
  }) {
    return KtpDataModelConverter(
        nik: normalizeNikText(nik),
        namaLengkap: normalizeNamaText(namaLengkap).trim(),
        tanggalLahir: tanggalLahir,
        alamatFull: normalizeAlamatText(alamatFull),
        agama: normalizeAgamaText(agama),
        statusPerkawinan: normalizeKawinText(statusPerkawinan),
        tempatLahir: normalizeAlamatText(tanggalLahir),
        jenisKelamin: normalizeJenisKelaminText(jenisKelamin),
        golDarah: golDarah,
        pekerjaan: normalizePekerjaanText(pekerjaan),
        kewarganegaraan: normalizeKewarganegaraanText(kewarganegaraan),
        berlakuHingga: berlakuHingga,
        rtrw: normalizeAlamatText(rtrw),
        kelDesa: normalizeAlamatText(kelDesa),
        alamat: normalizeAlamatText(alamat),
        kecamatan: normalizeAlamatText(kecamatan));
  }
}