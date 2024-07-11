import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/src/models/user.dart';
import 'package:user_repository/src/user_repo.dart';

class FirebaseUserRepo implements UserRepository {
  final FirebaseAuth _firebaseAuth;
  final db = FirebaseFirestore.instance;
  late final userCollection = db.collection('users');

  FirebaseUserRepo({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<void> setupRepository() async {
    db.settings = const Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );

    userCollection
        .snapshots(includeMetadataChanges: true)
        .listen((querySnapshot) {
      for (var change in querySnapshot.docChanges) {
        final source =
            (querySnapshot.metadata.isFromCache) ? "local cache" : "server";
        switch (change.type) {
          case DocumentChangeType.added:
            print("users added from $source}");
          case DocumentChangeType.modified:
            print("users modified from $source}");
          case DocumentChangeType.removed:
            print("users removed from $source}");
        }
      }
    });
  }

  @override
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser;
    });
  }

  @override
  Future<void> signInByEmail(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<UserModel> signUpByEmail(UserModel myUser, String password) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: myUser.email,
        password: password,
      );

      myUser = myUser.copyWith(
        id: user.user!.uid,
      );

      return myUser;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> setUserData(UserModel myUser) async {
    try {
      await userCollection.doc(myUser.id).set(myUser.toEntity().toJSON());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(
        email: email,
      );
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
