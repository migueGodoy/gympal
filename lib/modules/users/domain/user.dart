import 'package:gympal/modules/users/domain/user-email.dart';

class User {
  final String id;

  final String name;

  final UserEmail email;

  User({required this.id, required this.name, required this.email}) {
    if (id.isEmpty) {
      throw ArgumentError('Id cannot be empty');
    }

    if (name.isEmpty) {
      throw ArgumentError('Name cannot be empty');
    }
  }

  fromPrimitives(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: UserEmail(json['email']),
    );
  }

  toPrimitives() {
    return {
      'id': id,
      'name': name,
      'email': email.value,
    };
  }
}