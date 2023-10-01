import 'dart:io';

import 'package:testocr/features/profile/data/models/ktp_model.dart';

abstract class ScanKtpRepository{
  Future<KtpDataModel> scanUserData(File fileImage);
}