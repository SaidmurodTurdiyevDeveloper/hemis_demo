import 'package:bloc/bloc.dart';

import '../../../../../core/injection/injection.dart';
import '../../../../../core/usecase/no_param.dart';
import '../../../domen/usecase/pin_code/pin_code_use_case.dart';

part 'pin_code_state.dart';

class PinCodeCubit extends Cubit<PinCodeState> {
  PinCodeCubit() : super(PinCodeState.initialState());
  final PinCodeUseCase _useCase = getIt<PinCodeUseCase>();

  void init() async{
    var isExist = await _useCase.checkExistPinCode(NoParam());
    emit(state.copyWith(isExist: isExist));
  }

  void addDigit(String digit) {
    if (state.isLoading) return;
    if (state.pin.length == 3) {
      validatePin(state.pin + digit);
    }
    if (state.pin.length < 4) {
      emit(state.copyWith(pin: state.pin + digit, errorMessage: '', isLoading: state.pin.length == 3));
    }
  }

  void removeLastDigit() {
    if (state.isLoading) return;
    if (state.pin.isNotEmpty) {
      emit(state.copyWith(pin: state.pin.substring(0, state.pin.length - 1), errorMessage: ''));
    }
  }

  void validatePin(String pin) async {
    if (pin.length == 4) {

    }
  }

  void resetPin() {
    if (state.isLoading) return;
    emit(state.copyWith(pin: '', firstPin: ''));
  }
}
