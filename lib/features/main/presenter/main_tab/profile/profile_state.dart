part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final UserResponseData? userResponseData;
  final bool isLoading;

  const ProfileState({
    this.userResponseData,
    this.isLoading = false,
  });

  factory ProfileState.init() => const ProfileState();

  ProfileState copyWith({
    UserResponseData? userResponseData,
    bool? isLoading,
  }) {
    return ProfileState(
      userResponseData: userResponseData ?? this.userResponseData,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [userResponseData, isLoading];
}
