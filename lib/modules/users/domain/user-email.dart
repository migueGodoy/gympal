class UserEmail {
  final String _email;

  UserEmail(String email) : _email = _validateEmail(email);

  static String _validateEmail(String email) {
    final regex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
    );

    if (!regex.hasMatch(email)) {
      throw const FormatException('Invalid email format');
    }
    return email;
  }

  String get email => _email;

  @override
  String toString() => _email;
}