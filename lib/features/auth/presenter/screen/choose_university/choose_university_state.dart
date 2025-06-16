part of 'choose_university_cubit.dart';

class ChooseUniversityState extends Equatable {
  final String query;
  final String? error;
  final String? openedScreen;
  final UniversityEntity? selected;
  final List<UniversityEntity> all;
  final List<UniversityEntity> filtered;

  const ChooseUniversityState({this.query = '', this.error,this.openedScreen, this.selected, this.all = const [], this.filtered = const []});

  ChooseUniversityState copyWith({
    String? query,
    String? error,
    String? openedScreen,
    UniversityEntity? selected,
    List<UniversityEntity>? all,
    List<UniversityEntity>? filtered,
  }) => ChooseUniversityState(
    query: query ?? this.query,
    error: error ?? this.error,
    openedScreen: openedScreen ?? this.openedScreen,
    selected: selected ?? this.selected,
    all: all ?? this.all,
    filtered: filtered ?? this.filtered,
  );

  @override
  List<Object?> get props => [query, selected,openedScreen, all, filtered];
}
