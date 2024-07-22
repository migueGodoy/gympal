import 'package:flutter_test/flutter_test.dart';
import 'package:gympal/modules/users/domain/user.dart';
import 'package:gympal/modules/users/domain/user-email.dart';

import 'user-email.mother.dart';
import 'user.mother.dart';

void main() {
  group('User Creation', () {
    test('should create User with valid id, name, and email', () {
      expect(() => UserMother.valid(), returnsNormally);
    });

    test('should throw ArgumentError for empty id', () {
      expect(() => UserMother.withEmptyId(), throwsArgumentError);
    });

    test('should throw ArgumentError for empty name', () {
      expect(() => UserMother.withoutName(), throwsArgumentError);
    });

    test('should accept User with valid email containing subdomain', () {
      expect(() => UserMother.withEmailWithSubdomain(), returnsNormally);
    });

    test('should accept User with numeric id', () {
      expect(() => UserMother.withNumericId(), returnsNormally);
    });

    test('should accept User with special characters in name', () {
      expect(() => UserMother.withSpecialCharactersInName(), returnsNormally);
    });
  });
}