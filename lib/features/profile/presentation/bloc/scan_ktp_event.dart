part of 'scan_ktp_bloc.dart';
  @immutable
 abstract class ScanKtpEvent {
  
}
class ScanKtpInputEvent extends ScanKtpEvent{
  final File fileImage;

  ScanKtpInputEvent({required this.fileImage});
}
