
import 'package:hemis_demo/core/errors/failure.dart';

class ResponseResult<T> {
  final T? result;
  final Failure? error;

  ResponseResult({this.result, this.error});
}