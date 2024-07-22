import 'package:faker/faker.dart';
import 'package:gympal/modules/users/domain/user.dart';
import 'package:gympal/modules/users/domain/user-email.dart';

import 'user-email.mother.dart';

class UserMother {
  static User valid() {
    final faker = Faker();
    return User(
      id: faker.guid.guid(),
      name: faker.person.name(),
      email: UserEmailMother.valid(),
    );
  }

  static User withNumericId() {
    final faker = Faker();
    return User(
      id: faker.randomGenerator.integer(999999).toString(),
      name: faker.person.name(),
      email: UserEmailMother.valid(),
    );
  }

  static User withoutAtEmail() {
    final faker = Faker();
    UserEmail emailWithoutAt = UserEmailMother.withoutAt();
    return User(
      id: faker.guid.guid(),
      name: faker.person.name(),
      email: emailWithoutAt,
    );
  }

  static User withEmailWithSubdomain() {
    final faker = Faker();
    return User(
      id: faker.guid.guid(),
      name: faker.person.name(),
      email: UserEmailMother.withSubdomain(),
    );
  }

  static User withEmptyId() {
    final faker = Faker();
    return User(
      id: '',
      name: faker.person.name(),
      email: UserEmailMother.valid(),
    );
  }

  static User withoutName() {
    final faker = Faker();
    return User(
      id: faker.guid.guid(),
      name: '',
      email: UserEmailMother.valid(),
    );
  }

  static User withSpecialCharactersInName() {
    final faker = Faker();
    String nameWithSpecialCharacters = '${faker.person.name()} *&%#@!';
    return User(
      id: faker.guid.guid(),
      name: nameWithSpecialCharacters,
      email: UserEmailMother.valid(),
    );
  }
}