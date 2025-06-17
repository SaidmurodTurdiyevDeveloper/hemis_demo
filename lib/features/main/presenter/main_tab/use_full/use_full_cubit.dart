import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'use_full_state.dart';

class UseFullCubit extends Cubit<UseFullState> {
  UseFullCubit() : super(UseFullInitial());
  Future<void> init() async {

  }
}
