import "package:firebase_auth/firebase_auth.dart";

class FirebaseAuthService {
  void anonymousLogin() {
    FirebaseAuth.instance.onAuthStateChanged.listen((user) async {
      if (user != null) {
        var isAnonymous = user.isAnonymous;
        var uid = user.uid;
        print(
            'In FirestoreServices, isAnonymous = $isAnonymous and uid = $uid');
      } else {
        FirebaseAuth.instance.signInAnonymously().then((user) {});
      }
    });
  }
}
