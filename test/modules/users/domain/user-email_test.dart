import 'package:flutter_test/flutter_test.dart';
import 'user-email.mother.dart';

void main() {
  group('UserEmail Validation', () {
    test('should create UserEmail with valid email', () {
      expect(() => UserEmailMother.valid(), returnsNormally);
    });

    test('should throw FormatException for email without @ symbol', () {
      expect(() => UserEmailMother.withoutAt(), throwsA(isA<FormatException>()));
    });

    test('should throw FormatException for email without domain', () {
      expect(() => UserEmailMother.withoutDomain(), throwsA(isA<FormatException>()));
    });

    test('should throw FormatException for email without extension', () {
      expect(() => UserEmailMother.withoutExtension(), throwsA(isA<FormatException>()));
    });

    test('should throw FormatException for email with invalid characters', () {
      expect(() => UserEmailMother.withInvalidCharacters(), throwsA(isA<FormatException>()));
    });

    test('should throw FormatException for email with too long extension', () {
      expect(() => UserEmailMother.withTooLongExtension(), throwsA(isA<FormatException>()));
    });

    test('should accept email with subdomain', () {
      expect(() => UserEmailMother.withSubdomain(), returnsNormally);
    });

    test('should accept email with numeric domain', () {
      expect(() => UserEmailMother.withNumericDomain(), returnsNormally);
    });

    test('should accept email with numeric domain and subdomain', () {
      expect(() => UserEmailMother.withNumericDomainAndSubdomain(), returnsNormally);
    });

    test('should accept email with hyphen in domain', () {
      expect(() => UserEmailMother.withDomainWithHyphen(), returnsNormally);
    });

    test('should accept email with plus sign', () {
      expect(() => UserEmailMother.withPlusUsername(), returnsNormally);
    });
  });
}