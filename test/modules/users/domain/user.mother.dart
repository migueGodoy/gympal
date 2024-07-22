import 'package:faker/faker.dart';
import 'package:gympal/modules/users/domain/user.dart';
import 'package:gympal/modules/users/domain/user-email.dart';

import 'user-email.mother.dart';

class UserMother {
  static User random() {
    final faker = Faker();
    return User(
      id: faker.guid.guid(),
      name: faker.person.name(),
      email: UserEmail(faker.internet.email()),
    );
  }

  static User withName(String name) {
    final faker = Faker();
    UserEmail email = UserEmailMother.valid();
    return User(
      id: faker.guid.guid(),
      email: email,
      name: name,
    );
  }

  static User emailWithoutAt() {
    final faker = Faker();
    UserEmail emailWithoutAt = UserEmailMother.withoutAt();
    return User(
      id: faker.guid.guid(),
      name: faker.person.name(),
      email: emailWithoutAt,
    );
  }
}