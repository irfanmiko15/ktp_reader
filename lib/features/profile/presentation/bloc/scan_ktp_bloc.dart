import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:testocr/features/profile/data/models/ktp_model.dart';
import 'package:testocr/features/profile/domain/usecase/scan_ktp_usecase.dart';
import 'package:meta/meta.dart';
part 'scan_ktp_event.dart';
part 'scan_ktp_state.dart';

class ScanKtpBloc extends Bloc<ScanKtpEvent, ScanKtpState> {
  ScanKtpUsecase scanKtpUsecase;
  ScanKtpBloc({required this.scanKtpUsecase}) : super(ScanKtpInitial()) {
    on<ScanKtpInputEvent>(_scanKTP);
  }

  Future<FutureOr<void>> _scanKTP(
      ScanKtpInputEvent event, Emitter<ScanKtpState> emit) async {
    emit(Loading());
    try {
      final result = await scanKtpUsecase.getUserData(event.fileImage);
      emit(Success(userData: result));
    } catch (e) {
      emit(Error(message: "Gagal scan data ktp"));
    }
  }
}
