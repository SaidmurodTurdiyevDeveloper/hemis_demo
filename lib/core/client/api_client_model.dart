import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../errors/failure.dart';

class ApiClientModel extends Equatable {
  final dynamic result;
  final bool success;
  final int? code;
  final FailureType? error;

  const ApiClientModel({required this.result, required this.success, required this.code, required this.error});

  @override
  List<Object?> get props => throw UnimplementedError();

  String toJson() {
    return jsonEncode(result);
  }
}
