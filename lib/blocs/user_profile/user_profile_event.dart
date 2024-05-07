part of 'user_profile_bloc.dart';

abstract class UserProfileEvent extends Equatable {}

class AddUserEvent extends UserProfileEvent {
  final UserModel userModel;

  AddUserEvent(this.userModel);

  @override
  List<Object?> get props => [userModel];
}

class UpdateUserEvent extends UserProfileEvent {
  final UserModel userModel;

  UpdateUserEvent({required this.userModel});

  @override
  List<Object?> get props => [userModel];
}

class DeleteUserEvent extends UserProfileEvent {
  final UserModel userModel;

  DeleteUserEvent(this.userModel);

  @override
  List<Object?> get props => [userModel];
}

class GetUserByDocIdEvent extends UserProfileEvent {
  GetUserByDocIdEvent({required this.docId});

  final String docId;

  @override
  List<Object?> get props => [docId];
}

class GetCurrentEvent extends UserProfileEvent {

  final String uid;
  GetCurrentEvent(this.uid);
  @override
  List<Object?> get props => [];
}
