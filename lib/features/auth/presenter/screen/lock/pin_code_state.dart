
part of 'pin_code_cubit.dart';

class PinCodeState {
  final String pin;
  final String firstPin;
  final bool isValid;
  final bool authError;
  final bool isLoading;
  final bool isExist;
  final String errorMessage;

  PinCodeState(
      {required this.pin,
      required this.authError,
      required this.isLoading,
      required this.firstPin,
      required this.isValid,
      required this.isExist,
      required this.errorMessage});

  PinCodeState copyWith({String? pin, String? firstPin, bool? isValid, bool? authError, bool? isLoading, bool? isExist, String? errorMessage}) {
    return PinCodeState(
      pin: pin ?? this.pin,
      firstPin: firstPin ?? this.firstPin,
      authError: authError ?? this.authError,
      isLoading: isLoading ?? this.isLoading,
      isValid: isValid ?? this.isValid,
      isExist: isExist ?? this.isExist,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory PinCodeState.initialState() =>
      PinCodeState(pin: '', firstPin: '', isLoading: false, authError: false, isValid: false, isExist: false, errorMessage: '');
}
