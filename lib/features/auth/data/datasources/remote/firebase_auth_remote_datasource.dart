import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:royal_task/core/errors/failure.dart';
import '../../models/user_model.dart';
import 'auth_remote_datasource.dart';

class FirebaseAuthRemoteDatasource implements AuthRemoteDatasource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  FirebaseAuthRemoteDatasource({
    required FirebaseAuth firebaseAuth,
    required FirebaseFirestore firebaseFirestore,
  })  : _firebaseAuth = firebaseAuth,
        _firebaseFirestore = firebaseFirestore;

  @override
  Future<UserModel> getUserInfo() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw ServerFailure(message: 'User not found');
      }

      final refDoc = _firebaseFirestore.collection('users').doc(user.uid);
      final docSnapshot = await refDoc.get();

      if (docSnapshot.exists) {
        return UserModel.fromJson(docSnapshot.data()!);
      } else {
        throw ServerFailure(message: 'User not found');
      }
    } catch (e) {
      throw ServerFailure(message: 'Failed to get user: ${e.toString()}');
    }
  }

  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;
      if (user == null) {
        throw ServerFailure(message: 'No user found for these credentials.');
      }

      return await getUserInfo();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'network-request-failed':
          throw ServerFailure(message: 'Check your internet connection.');
        case 'invalid-credential':
          throw ServerFailure(message: 'Username or password is invalid.');
        case 'wrong-password':
          throw ServerFailure(message: 'Wrong password provided.');
        default:
          throw ServerFailure(message: 'Authentication failed: ${e.message}');
      }
    } catch (e) {
      throw ServerFailure(message: 'Something went wrong: ${e.toString()}');
    }
  }

  @override
  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;
      if (user != null) {
        final userModel = UserModel(
          uid: user.uid,
          name: name,
          email: email,
        );

        await getAndCreateUser(user: userModel);
        return userModel;
      } else {
        throw ServerFailure(message: 'Failed to create user.');
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'network-request-failed':
          throw ServerFailure(message: 'Check your internet connection.');
        case 'weak-password':
          throw ServerFailure(message: 'The password provided is too weak.');
        case 'email-already-in-use':
          throw ServerFailure(
              message: 'The account already exists for that email.');
        default:
          throw ServerFailure(message: 'Authentication failed: ${e.message}');
      }
    } catch (e) {
      throw ServerFailure(message: 'Something went wrong: ${e.toString()}');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw ServerFailure(message: 'Failed to sign out: ${e.toString()}');
    }
  }

  @override
  Future<void> getAndCreateUser({
    required UserModel user,
  }) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(user.uid)
          .set(user.toJson());
    } catch (e) {
      throw ServerFailure(
          message: 'Failed to create user in Firestore: ${e.toString()}');
    }
  }

  @override
  Stream<User?> get checkAuthStatus => _firebaseAuth.authStateChanges();
}
