part of 'user_profile_bloc.dart';

class UserProfileState extends Equatable {
  final UserModel userModel;
  final FormsStatus status;
  final String errorMessage;
  final String statusMessage;

  UserProfileState({
    required this.status,
    required this.errorMessage,
    required this.statusMessage,
    required this.userModel,
  });

  UserProfileState copyWith({
    UserModel? userModel,
    FormsStatus? status,
    String? errorMessage,
    String? statusMessage,
  }) {
    return UserProfileState(
      userModel: userModel ?? this.userModel,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      statusMessage: statusMessage ?? this.statusMessage,
    );
  }

  @override
  List<Object?> get props => [status, statusMessage, errorMessage, userModel];
}
