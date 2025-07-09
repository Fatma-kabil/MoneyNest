String mapFirebaseAuthError(String error) {
  if (error.contains('email-already-in-use')) {
    return 'This email is already in use. Try signing in.';
  } else if (error.contains('weak-password')) {
    return 'Your password is too weak. Use at least 6 characters.';
  } else if (error.contains('invalid-email')) {
    return 'The email address is not valid.';
  } else if (error.contains('user-not-found')) {
    return 'No user found with this email.';
  } else if (error.contains('wrong-password')) {
    return 'Incorrect password. Please try again.';
  } else if (error.contains('network-request-failed')) {
    return 'Network error. Please check your connection.';
  } else {
    return 'Something went wrong. Please try again later.';
  }
}