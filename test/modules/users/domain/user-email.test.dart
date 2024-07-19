import 'package:flutter_test/flutter_test.dart';
import 'package:gympal/modules/users/domain/user-email.dart';

void main() {
  group('UserEmail Validation', () {
    test('should create UserEmail with valid email', () {
      expect(() => UserEmail('test@example.com'), returnsNormally);
    });

    test('should throw FormatException for email without @ symbol', () {
      expect(() => UserEmail('testexample.com'), throwsA(isA<FormatException>()));
    });

    test('should throw FormatException for email without domain', () {
      expect(() => UserEmail('test@.com'), throwsA(isA<FormatException>()));
    });

    test('should throw FormatException for email without extension', () {
      expect(() => UserEmail('test@example'), throwsA(isA<FormatException>()));
    });

    test('should throw FormatException for email with invalid characters', () {
      expect(() => UserEmail('test@exa*mple.com'), throwsA(isA<FormatException>()));
    });

    test('should throw FormatException for email with too long extension', () {
      expect(() => UserEmail('test@example.comee'), throwsA(isA<FormatException>()));
    });

    test('should accept email with subdomain', () {
      expect(() => UserEmail('test@sub.example.com'), returnsNormally);
    });

    test('should accept email with numeric domain and subdomain', () {
      expect(() => UserEmail('test@123.456.com'), returnsNormally);
    });

    test('should accept email with hyphen in domain', () {
      expect(() => UserEmail('test@example-domain.com'), returnsNormally);
    });

    test('should accept email with plus sign', () {
      expect(() => UserEmail('test+alias@example.com'), returnsNormally);
    });
  });
}