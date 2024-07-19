class UserEmail {
  final String _value;

  UserEmail(this._value) {
    _validateEmail(_value);
  }

  static void _validateEmail(String email) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');

    if (!regex.hasMatch(email)) {
      throw const FormatException('Invalid email format');
    }
  }

  String get value => _value;
}