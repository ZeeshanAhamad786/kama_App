class Validations{
  static String handleFirebaseAuthError(String e, ) {
    if (e.contains("ERROR_WEAK_PASSWORD")) {
      return "Password is too weak";
    } else if (e.contains("invalid-email")) {
      return "Invalid Email";
    } else if (e.contains("ERROR_EMAIL_ALREADY_IN_USE") ||
        e.contains('email-already-in-use')) {
      return "The email address is already in use by another account.";
    } else if (e.contains("ERROR_NETWORK_REQUEST_FAILED")) {
      return "Network error occured!";
    } else if (e.contains("ERROR_USER_NOT_FOUND") ||
        e.contains('firebase_auth/user-not-found')) {
      return "Invalid credentials.";
    } else if (e.contains("ERROR_WRONG_PASSWORD") ||
        e.contains('wrong-password')) {
      return "Invalid credentials.";
    } else if (e.contains('firebase_auth/requires-recent-login')) {
      return 'This operation is sensitive and requires recent authentication.'
          ' Log in again before retrying this request.';
    } else if (e.contains('firebase_auth/channel-error')) {
      return 'Invalid credentials.';
    } else if (e.contains('firebase_auth/INVALID_LOGIN_CREDENTIALS')) {
      return 'Invalid login credentials.';
    } else {
      return e;
    }
  }

}