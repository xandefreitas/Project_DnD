class AuthException implements Exception {
  static const Map<String, String> errors = {
    'EMAIL_EXISTS': 'This email already exists.',
    'OPERATION_NOT_ALLOWED': 'Operation not allowed.',
    'TOO_MANY_ATTEMPTS_TRY_LATER': 'too many attempts, try later.',
    'EMAIL_NOT_FOUND': 'Email not found.',
    'INVALID_PASSWORD': 'Invalid Password.',
    'USER_DISABLED': 'This account has been disabled.',
  };
  final String key;
  AuthException(this.key);
  @override
  String toString() {
    return errors[key] ?? 'Authentication error.';
  }
}
