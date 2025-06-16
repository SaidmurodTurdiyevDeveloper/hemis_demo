import 'package:hemis_demo/features/auth/domen/usecase/pin_code/save_pin_code.dart';
import 'package:hemis_demo/features/auth/domen/usecase/update_token.dart';

import 'check_exist_pin_code.dart';
import 'check_pin_code.dart';

class PinCodeUseCase {
  final UpdateToken updateToken;
  final CheckPinCode checkPinCode;
  final SavePinCode savePinCode;
  final CheckExistPinCode checkExistPinCode;

  PinCodeUseCase(
      {required this.updateToken,
      required this.checkPinCode,
      required this.savePinCode,
      required this.checkExistPinCode});
}
