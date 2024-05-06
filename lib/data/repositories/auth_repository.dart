import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_bank_project/fire_base_exceptions.dart';

import '../models/network_response.dart';

class AuthRepository {
  Future<NetworkResponse> LoginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return NetworkResponse(data: userCredential);
    } on FirebaseAuthException catch (e) {
      return NetworkResponse(
          errorText: LogInWithEmailAndPasswordFailure.fromCode(e.code).message,
          errorCode: e.code);

      LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (error) {

      return NetworkResponse(errorText: "An unknown exception occurred.");
    }
  }

  Future<NetworkResponse> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {

     UserCredential userCredential = await
     FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return NetworkResponse(data: userCredential);
    } on FirebaseAuthException catch (e) {
      return NetworkResponse(
          errorText: LogInWithEmailAndPasswordFailure.fromCode(e.code).message,
          errorCode: e.code);


    } catch (_) {
      return NetworkResponse(errorText: "An unknown exception occurred.");
    }
  }



  Future<NetworkResponse> googleSignIn() async {
    try {
      late final AuthCredential credential;
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser!.authentication;
      credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return NetworkResponse(data: userCredential);
    } on FirebaseAuthException catch (e) {
      return NetworkResponse(
          errorCode: LogInWithEmailAndPasswordFailure.fromCode(e.code).message);

      LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      return NetworkResponse(errorText: "An unknown exception occurred.");
    }
  }
  Future<NetworkResponse> logOutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
      return NetworkResponse(data: "success");
    } on FirebaseAuthException catch (e) {
      return NetworkResponse(
          errorText: LogInWithEmailAndPasswordFailure.fromCode(e.code).message,
          errorCode: e.code);

      LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      return NetworkResponse(errorText: "An unknown exception occurred.");
    }
  }
}
