import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hemis_demo/core/navigator/Screens.dart';
import 'package:hemis_demo/features/auth/domen/entities/university_entity.dart';
import 'package:hemis_demo/features/auth/domen/usecase/save_university.dart';

import '../../../../../core/injection/injection.dart';
import '../../../../../core/usecase/no_param.dart';
import '../../../domen/usecase/get_universities.dart';

part 'choose_university_state.dart';

class ChooseUniversityCubit extends Cubit<ChooseUniversityState> {
  ChooseUniversityCubit() : super(const ChooseUniversityState()) {
    _loadUniversities();
  }

  final getUniversityUseCase = getIt<GetUniversities>();
  final saveUniversityUseCase = getIt<SaveUniversity>();

  Timer? _debounce;

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }

  Future<void> _loadUniversities() async {
    final universities = await getUniversityUseCase.call(NoParam());
    if (universities.result != null) {
      final trimmed = state.query.trim();
      final filtered = universities.result?.where((u) => u.name.toLowerCase().contains(trimmed.toLowerCase())).toList();
      emit(state.copyWith(all: universities.result, filtered: filtered));
    }
  }

  void onQueryChanged(String text, {Duration delay = const Duration(milliseconds: 700)}) {
    _debounce?.cancel();
    _debounce = Timer(delay, () {
      final trimmed = text.trim();
      final filtered = state.all.where((u) => u.name.toLowerCase().contains(trimmed.toLowerCase())).toList();
      emit(state.copyWith(query: trimmed, filtered: filtered));
    });
  }

  void selectUniversity(UniversityEntity university) {
    emit(state.copyWith(selected: university));
  }

  void next() async {
    if (state.selected != null) {
      await saveUniversityUseCase.call(state.selected!);
      emit(state.copyWith(openedScreen: Screens.login));
    }
  }
}
