import 'package:my_bank_project/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_bank_project/utils/constants/app_constants.dart';

import '../models/network_response.dart';

class UserProfileRepository {
  Future<NetworkResponse> addUser(UserModel userModel) async {
    try {
      //create
      DocumentReference documentReference = await FirebaseFirestore.instance
          .collection(AppConstants.users)
          .add(userModel.toJson());
      //update

      await FirebaseFirestore.instance
          .collection(AppConstants.users)
          .doc(documentReference.id)
          .update({"userId": documentReference.id});

      return NetworkResponse(data: "success");
    } on FirebaseException catch (error) {
      return NetworkResponse(errorCode: error.code);
    }
  }




  Future<NetworkResponse> updateUser(UserModel userModel) async {
    try {
      await FirebaseFirestore.instance
          .collection(AppConstants.users)
          .doc(userModel.userId)
          .update(userModel.toJsonForUpdate(),);
      return NetworkResponse(data: "success");
    } on FirebaseException catch (error) {
      return NetworkResponse(errorCode: error.code);
    }
  }

  Future<NetworkResponse> deleteUser(String  docId) async {
    try {
      await FirebaseFirestore.instance
          .collection(AppConstants.users)
          .doc(userModel.userId)
          .update(userModel.toJsonForUpdate(),);
      return NetworkResponse(data: "success");
    } on FirebaseException catch (error) {
      return NetworkResponse(errorCode: error.code);
    }
  }

}
