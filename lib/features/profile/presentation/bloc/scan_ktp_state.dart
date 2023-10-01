part of 'scan_ktp_bloc.dart';
@immutable  
 abstract class ScanKtpState extends Equatable {
  const ScanKtpState();
  
  @override
  List<Object> get props => [];
}

 class ScanKtpInitial extends ScanKtpState {}
 class Loading extends ScanKtpState {}
  class Success extends ScanKtpState {
  final KtpDataModel userData;

  Success({required this.userData});
}
class Error extends ScanKtpState {
  final String message;

  Error({required this.message});
}
