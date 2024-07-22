import 'package:faker/faker.dart';
import 'package:gympal/modules/users/domain/user-email.dart';

class UserEmailMother {
  static UserEmail valid() {
    final faker = Faker();
    return UserEmail(faker.internet.email());
  }

  static UserEmail withoutAt() {
    final faker = Faker();
    String invalidEmail = faker.internet.email().replaceAll('@', '');
    return UserEmail(invalidEmail);
  }

  static UserEmail withoutDomain() {
    final faker = Faker();
    String username = faker.internet.userName();
    return UserEmail('$username@.com');
  }

  static UserEmail withoutExtension() {
    final faker = Faker();
    String username = faker.internet.userName();
    String domain = faker.internet.domainWord();
    return UserEmail('$username@$domain');
  }

  static UserEmail withSubdomain() {
    final faker = Faker();
    String username = faker.internet.userName();
    String domain = faker.internet.domainName();
    String subdomain = faker.internet.domainWord();
    return UserEmail('$username@$subdomain.$domain');
  }

  static UserEmail withDomainWithHyphen() {
    final faker = Faker();
    String username = faker.internet.userName();
    String domain = faker.internet.domainName();
    String subdomain = faker.internet.domainWord();
    return UserEmail('$username@$subdomain-$domain');
  }

  static UserEmail withPlusUsername() {
    final faker = Faker();
    String username = faker.internet.userName();
    String domain = faker.internet.domainName();
    return UserEmail('$username+alias@$domain');
  }

  static UserEmail withNumericDomain() {
    final faker = Faker();
    String username = faker.internet.userName();
    String domain = faker.randomGenerator.integer(999).toString();
    return UserEmail('$username@$domain.com');
  }

  static UserEmail withNumericDomainAndSubdomain() {
    final faker = Faker();
    String username = faker.internet.userName();
    String domain = faker.randomGenerator.integer(999).toString();
    String subdomain = faker.randomGenerator.integer(999).toString();
    return UserEmail('$username@$domain.$subdomain.com');
  }

  static UserEmail withTooLongExtension() {
    final faker = Faker();
    String username = faker.internet.userName();
    String domain = faker.internet.domainWord();
    return UserEmail('$username@$domain.toolong');
  }

  static UserEmail withInvalidCharacters() {
    final faker = Faker();
    String username = '${faker.internet.userName()}*&%';
    String domain = faker.internet.domainName();
    return UserEmail('$username@$domain');
  }
}