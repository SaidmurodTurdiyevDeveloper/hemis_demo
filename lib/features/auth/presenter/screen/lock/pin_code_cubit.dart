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
      if (state.isExist) {
        var isValid = await _useCase.checkPinCode(int.parse(pin));
        if (isValid) {
          await _useCase
              .updateToken(NoParam())
              .then((v) {
                if (v.result == true) {
                  emit(state.copyWith(isValid: v.result, isLoading: false));
                } else {
                  emit(state.copyWith(authError: true, isLoading: false));
                }
              })
              .catchError((error) {
                emit(state.copyWith(authError: true, isLoading: false));
              });
        } else {
          emit(state.copyWith(errorMessage: 'Pin ko\'d noto\'g\'ri', firstPin: '', pin: '', isLoading: false));
        }
      } else {
        await Future.delayed(Duration(milliseconds: 100));
        if (state.firstPin.isNotEmpty) {
          if (state.firstPin == pin) {
            _useCase.savePinCode(int.parse(pin));
            emit(state.copyWith(isValid: true, isLoading: false));
          } else {
            emit(state.copyWith(errorMessage: 'Pin ko\'dlar bir xil emas', firstPin: '', pin: '', isLoading: false));
          }
        } else {
          emit(state.copyWith(firstPin: pin, pin: '', isLoading: false));
        }
      }
    }
  }

  void resetPin() {
    if (state.isLoading) return;
    emit(state.copyWith(pin: '', firstPin: ''));
  }
}
