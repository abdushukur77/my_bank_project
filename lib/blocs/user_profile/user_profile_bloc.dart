import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:my_bank_project/data/models/forms_status.dart';

import '../../data/models/user_model.dart';

part 'user_profile_event.dart';

part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc()
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
    on<GetUserEvent>(_getUser);
  }

  _addUser(AddUserEvent, emit) {}

  _updateUser(UpdateUserEvent, emit) {}

  _deleteUser(DeleteUserEvent, emit) {}

  _getUser(GetUserEvent, emit) {}
}
