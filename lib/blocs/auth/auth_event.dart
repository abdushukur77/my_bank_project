part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class CheckAuthenticationEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class LoginUserEvent extends AuthEvent {
  final String username;
  final String password;

  LoginUserEvent({
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props {
    return [password, username];
  }
}

class RegisterUserEvent extends AuthEvent {
  final UserModel userModel;

  RegisterUserEvent({
    required this.userModel,
  });

  @override
  List<Object?> get props {
    return [
      userModel,
    ];
  }
}

class LogOutUserEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class SignInWithGoogleEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}


