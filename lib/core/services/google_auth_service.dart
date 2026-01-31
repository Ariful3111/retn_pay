import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  static const String _serverClientId =
      '945407931386-iuk06ju9gntg8mlie98mi14pcdn77seo.apps.googleusercontent.com';

  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  bool _isInitialized = false;

  Future<void> _ensureInitialized() async {
    if (_isInitialized) return;
    await _googleSignIn.initialize(serverClientId: _serverClientId);
    _isInitialized = true;
  }

  Future<String?> signIn() async {
    try {
      await _ensureInitialized();

      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();
      final GoogleSignInClientAuthorization authorization = await googleUser
          .authorizationClient
          .authorizeScopes(['email', 'profile']);

      return authorization.accessToken;
    } on GoogleSignInException catch (e) {
      debugPrint(
        "Google Sign-In Error: ${e.code.name}, ${e.description}, ${e.details}",
      );
      return null;
    } catch (e) {
      debugPrint("Google Sign-In Error: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}
