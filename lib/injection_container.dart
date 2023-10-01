
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:testocr/features/profile/data/repository/scan_ktp_repository_impl.dart';
import 'package:testocr/features/profile/domain/repository/scan_ktp_repository.dart';

import 'features/profile/data/data_source/local/ml_kit/scan_ktp_ml_kit_impl.dart';
import 'features/profile/domain/usecase/scan_ktp_usecase.dart';
import 'features/profile/presentation/bloc/scan_ktp_bloc.dart';

final sl = GetIt.instance;

void init() {
// Feature
  //bloc
  sl.registerFactory(() => ScanKtpBloc(scanKtpUsecase: sl()));

  //UseCase
  sl.registerLazySingleton(() => ScanKtpUsecase(scanKtpRepo: sl()));

  //repo
  sl.registerLazySingleton<ScanKtpRepository>(() => ScanKtpRepoImpl(scanKtpMlKit: sl()));

  //data
  sl.registerLazySingleton<ScanKtpMlKitLocalDatasource>(
      () => ScanKtpMlKitImpl(textRecognizer: sl()));

// // External Dependency
  sl.registerLazySingleton(() => TextRecognizer());
}