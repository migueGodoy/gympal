import 'package:faker/faker.dart';
import 'package:gympal/modules/users/domain/user.dart';
import 'package:gympal/modules/users/domain/user-email.dart';

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
    return User(
      id: faker.guid.guid(),
      email: UserEmail(faker.internet.email()),
      name: name,
    );
  }

  static User emailWithoutAt() {
    final faker = Faker();
    String invalidEmail = faker.internet.email().replaceAll('@', '');
    return User(
      id: faker.guid.guid(),
      name: faker.person.name(),
      email: UserEmail(invalidEmail),
    );
  }
}