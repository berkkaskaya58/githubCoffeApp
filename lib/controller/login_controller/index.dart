import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        // Kullanıcı giriş yapmayı iptal etti
        print('Google giriş iptal edildi.');
        return null;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);

      // Giriş başarılı, kullanıcı döndürülüyor
      print('Google ile giriş başarılı: ${userCredential.user?.email}');
      return userCredential.user;
    } catch (e) {
      // Hata durumunu konsola yazdır
      print('Google Giriş Hatası: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await googleSignIn.signOut();
      await _auth.signOut();
      print('Kullanıcı başarıyla çıkış yaptı.');
    } catch (e) {
      print('Çıkış yaparken hata oluştu: $e');
    }
  }
}
