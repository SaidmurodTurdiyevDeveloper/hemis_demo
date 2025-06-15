import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final FailureType type;
  final String message;
  final int? code;

  const Failure({required this.message, this.code, required this.type});

  @override
  String toString() => message;

  @override
  List<Object?> get props => [message, code];
}

enum FailureType { server, unknown, network,jsonParse }
