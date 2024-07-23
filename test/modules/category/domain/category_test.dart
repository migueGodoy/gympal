import 'package:flutter_test/flutter_test.dart';
import 'package:gympal/modules/category/domain/category.dart';

import 'category.mother.dart';

void main() {
  group('Category Model Tests', () {
    test('should instantiate correctly with id, name, and description', () {
      const id = '1';
      const name = 'Fitness';
      const description = 'Fitness related activities';

      final category = Category(id: id, name: name, description: description);

      expect(category.id, id);
      expect(category.name, name);
      expect(category.description, description);
    });

    test('should throw ArgumentError if id is empty', () {
      expect(() => CategoryMother.withoutId(), throwsArgumentError);
    });

    test('should throw ArgumentError if name is empty', () {
      expect(() => CategoryMother.withoutName(), throwsArgumentError);
    });

    test('should instantiate correctly even if description is empty', () {
      expect(() => CategoryMother.withoutDescription(), returnsNormally);
    });

    test('toMap returns a map with id, name, and description', () {
      const id = '1';
      const name = 'Fitness';
      const description = 'Fitness related activities';

      final category = Category(id: id, name: name, description: description);

      final map = category.toMap();

      expect(map['id'], id);
      expect(map['name'], name);
      expect(map['description'], description);
    });

    test('fromMap returns a Category object from a map', () {
      const id = '1';
      const name = 'Fitness';
      const description = 'Fitness related activities';

      final map = {
        'id': id,
        'name': name,
        'description': description,
      };

      final category = Category.fromMap(map);

      expect(category.id, id);
      expect(category.name, name);
      expect(category.description, description);
    });

    test('toString returns a string representation of the Category object', () {
      const id = '1';
      const name = 'Fitness';
      const description = 'Fitness related activities';

      final category = Category(id: id, name: name, description: description);

      expect(category.toString(), 'Category(id: $id, name: $name, description: $description)');
    });
  });
}