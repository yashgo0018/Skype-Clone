import 'package:firebase_auth/firebase_auth.dart';
import 'package:skype_clone/resources/firebase_methods.dart';

class FirebaseRepositories {
  FirebaseMethods _firebaseMethods = FirebaseMethods();

  Future<FirebaseUser> getCurrentUser() => _firebaseMethods.getCurrentUser();
  Future<FirebaseUser> signIn() => _firebaseMethods.signIn();
  Future<bool> authenticateUser(FirebaseUser user) =>
      _firebaseMethods.authenticateUser(user);
  Future<void> addUserToDB(user) => _firebaseMethods.addUserToDB(user);
  Future<void> signOut() => _firebaseMethods.signOut();
}
