import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bank_project/data/models/network_response.dart';
import 'package:my_bank_project/data/models/user_model.dart';
import 'package:my_bank_project/data/repositories/auth_repository.dart';

import '../../data/models/forms_status.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.authRepository})
      : super(
          AuthState(
            status: FormsStatus.pure,
            errorMessage: "",
            statusMessage: "",
            userModel: UserModel.intial(),
          ),
        ) {
    on<CheckAuthenticationEvent>(_checkAuthentication);
    on<LoginUserEvent>(_loginUser);
    on<RegisterUserEvent>(_registerUser);
    on<LogOutUserEvent>(_logOutUser);
    on<SignInWithGoogleEvent>(_googleSignInUser);
  }

  final AuthRepository authRepository;

  _checkAuthentication(CheckAuthenticationEvent event, emit) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      emit(state.copyWith(
        status: FormsStatus.unauthenticated,
      ));
    } else {
      emit(state.copyWith(status: FormsStatus.authenticated));
    }
  }

  _loginUser(LoginUserEvent event, emit) async {
    NetworkResponse networkResponse =
        await authRepository.LoginWithEmailAndPassword(
      email: "${event.username.toLowerCase()}@gmail.com",
      password: event.password,
    );

    if (networkResponse.errorText.isEmpty) {

      UserCredential userCredential = networkResponse.data as UserCredential;

      UserModel userModel= state.userModel.copyWith(
        authUid: userCredential.user!.uid);





      emit(state.copyWith(
        userModel: userModel,
          status: FormsStatus.authenticated, statusMessage: "registered"));
    } else {
      emit(state.copyWith(
        status: FormsStatus.error,
        errorMessage: networkResponse.errorText,
      ));
    }
  }

  _registerUser(RegisterUserEvent event, emit) async {
    NetworkResponse networkResponse =
        await authRepository.registerWithEmailAndPassword(
      email: event.userModel.email,
      password: event.userModel.password,
    );

    if (networkResponse.errorText.isEmpty) {
      UserCredential userCredential = networkResponse.data as UserCredential;
      UserModel userModel =
          event.userModel.copyWith(authUid: userCredential.user!.uid);

      emit(
        state.copyWith(
          status: FormsStatus.authenticated,
          statusMessage: "registered",
          userModel: userModel,
        ),
      );
    } else {
      emit(state.copyWith(
          status: FormsStatus.error,
          errorMessage: networkResponse.errorText,
          userModel: event.userModel));
    }
  }

  _logOutUser(LogOutUserEvent event, emit) async {
    emit(state.copyWith(status: FormsStatus.loading));
    NetworkResponse networkResponse = await authRepository.logOutUser();

    if (networkResponse.errorText.isEmpty) {
      emit(state.copyWith(
        status: FormsStatus.unauthenticated,
      ));
    } else {
      emit(state.copyWith(
        status: FormsStatus.error,
        errorMessage: networkResponse.errorText,
      ));
    }
  }

  _googleSignInUser(SignInWithGoogleEvent event, emit) async {
    NetworkResponse networkResponse = await authRepository.googleSignIn();
    UserCredential userCredential = networkResponse.data;
    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          statusMessage: "registered",
          status: FormsStatus.authenticated,
          userModel: UserModel(
            fcm: "",
            authUid: userCredential.user!.uid,
            password: "password",
            lastname: userCredential.user!.email!,
            username: userCredential.user!.displayName ?? "",
            email: userCredential.user!.email!,
            imageUrl: userCredential.user!.photoURL ?? "",
            phoneNumber: userCredential.user!.phoneNumber ?? "",
            userId: "",
          ),
        ),
      );
    } else {
      emit(state.copyWith(
        status: FormsStatus.error,
        errorMessage: networkResponse.errorText,
      ));
    }
  }
}
