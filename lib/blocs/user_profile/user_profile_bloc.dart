import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_bank_project/data/models/forms_status.dart';
import 'package:my_bank_project/data/models/network_response.dart';
import 'package:my_bank_project/data/repositories/user_profile_repository.dart';

import '../../data/models/user_model.dart';

part 'user_profile_event.dart';

part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc(this.userProfileRepository)
      : super(
          UserProfileState(
            status: FormsStatus.pure,
            errorMessage: "",
            statusMessage: "",
            userModel: UserModel.intial(),
          ),
        ) {
    on<AddUserEvent>(_addUser);
    on<UpdateUserEvent>(_updateUser);
    on<DeleteUserEvent>(_deleteUser);
    on<GetUserByDocIdEvent>(_getUserByDocId);
    on<GetCurrentEvent>(_getUser);
  }

  final UserProfileRepository userProfileRepository;

  _addUser(AddUserEvent event, emit) async {
    emit(state.copyWith(status: FormsStatus.loading));

    NetworkResponse networkResponse =
        await userProfileRepository.addUser(event.userModel);
    if (networkResponse.errorCode.isEmpty) {
      emit(state.copyWith(
          status: FormsStatus.success, userModel: event.userModel));
    } else {
      emit(
        state.copyWith(
          statusMessage: networkResponse.errorCode,
          status: FormsStatus.error,
        ),
      );
    }
  }

  _updateUser(UpdateUserEvent event, emit) async {
    emit(state.copyWith(status: FormsStatus.loading));

    NetworkResponse networkResponse =
        await userProfileRepository.updateUser(event.userModel);
    if (networkResponse.errorCode.isEmpty) {
      emit(state.copyWith(
          status: FormsStatus.success, userModel: event.userModel));
    } else {
      emit(
        state.copyWith(
          statusMessage: networkResponse.errorCode,
          status: FormsStatus.error,
        ),
      );
    }
  }

  _deleteUser(DeleteUserEvent event, emit) async {
    emit(state.copyWith(status: FormsStatus.loading));

    NetworkResponse networkResponse =
        await userProfileRepository.deleteUser(event.userModel.userId);
    if (networkResponse.errorCode.isEmpty) {
      emit(
        state.copyWith(
          status: FormsStatus.success,
          userModel: UserModel.intial(),
        ),
      );
    } else {
      emit(
        state.copyWith(
          statusMessage: networkResponse.errorCode,
          status: FormsStatus.error,
        ),
      );
    }
  }

  _getUserByDocId(GetUserByDocIdEvent event, emit) async {
    emit(state.copyWith(status: FormsStatus.loading));

    NetworkResponse networkResponse =
        await userProfileRepository.getUserByDocID(event.docId);
    if (networkResponse.errorCode.isEmpty) {
      emit(
        state.copyWith(
          status: FormsStatus.success,
          userModel: networkResponse.data as UserModel,
        ),
      );
    } else {
      emit(
        state.copyWith(
            status: FormsStatus.error,
            statusMessage: networkResponse.errorCode),
      );
    }
  }

  _getUser(GetCurrentEvent event, emit) async {
    emit(state.copyWith(status: FormsStatus.loading));
    NetworkResponse networkResponse =
        await userProfileRepository.getUserByUid(event.uid);
    if (networkResponse.errorCode.isEmpty) {
      emit(
        state.copyWith(
          status: FormsStatus.success,
          userModel:networkResponse.data as UserModel,
        ),
      );
    } else {
      emit(
        state.copyWith(
            status: FormsStatus.error,
            statusMessage: networkResponse.errorCode),
      );
    }
  }
}
