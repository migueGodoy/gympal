import 'package:flutter_test/flutter_test.dart';
import 'package:gympal/modules/users/domain/user.dart';
import 'package:gympal/modules/users/domain/user-email.dart';

import 'user-email.mother.dart';

void main() {
  group('User Creation', () {
    final UserEmail userEmail = UserEmailMother.valid();

    test('should create User with valid id, name, and email', () {
      expect(() => User(id: '123', name: 'John Doe', email: userEmail), returnsNormally);
    });

    test('should throw ArgumentError for empty id', () {
      expect(() => User(id: '', name: 'John Doe', email: userEmail), throwsArgumentError);
    });

    test('should throw ArgumentError for empty name', () {
      expect(() => User(id: '123', name: '', email: userEmail), throwsArgumentError);
    });

    test('should accept User with valid email containing subdomain', () {
      final userEmailWithSubdomain = UserEmailMother.withSubdomain();
      expect(() => User(id: '123', name: 'John Doe', email: userEmailWithSubdomain), returnsNormally);
    });

    test('should accept User with numeric id', () {
      expect(() => User(id: '123456', name: 'John Doe', email: userEmail), returnsNormally);
    });

    test('should accept User with special characters in name', () {
      expect(() => User(id: '123', name: 'John-Doe Jr.', email: userEmail), returnsNormally);
    });
  });
}