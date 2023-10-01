import 'dart:io';

import 'package:flutter/material.dart';
import 'package:testocr/features/profile/data/data_source/local/ml_kit/scan_ktp_ml_kit_impl.dart';
import 'package:testocr/features/profile/data/models/ktp_model.dart';
import 'package:testocr/features/profile/domain/repository/scan_ktp_repository.dart';

class ScanKtpRepoImpl implements ScanKtpRepository{
  final ScanKtpMlKitLocalDatasource scanKtpMlKit;

  ScanKtpRepoImpl({required this.scanKtpMlKit});
  @override
  Future<KtpDataModel> scanUserData(File fileImage) {
    return scanKtpMlKit.scanKtp(fileImage: fileImage);
  }
}