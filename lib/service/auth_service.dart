import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  SharedPreferences sharedPreferences;
  AuthServices({required this.sharedPreferences});

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => firebaseAuth.currentUser;
  Stream<User?> get authStateChange => firebaseAuth.authStateChanges();

  Future<UserCredential> signInWithEmailAndPassword ({required String email, required String password}) async{
    return firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> createAccountWithEmailAndPassword ({required String email, required String password}) async{
    return firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

}