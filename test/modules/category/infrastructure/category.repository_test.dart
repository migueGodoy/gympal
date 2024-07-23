import 'package:flutter_test/flutter_test.dart';
import 'package:gympal/modules/category/domain/category.dart';

import 'mock.category.repository.dart';

void main() {
  group('CategoryRepository Tests', () {
    late MockCategoryRepository mockCategoryRepository;

    setUp(() {
      mockCategoryRepository = MockCategoryRepository();
    });

    test('addCategory successfully adds a category', () async {
      final category = Category(id: '1', name: 'Test', description: 'Test Description');
      await mockCategoryRepository.addCategory(category);

      expect(await mockCategoryRepository.getAllCategories(), contains(category));
    });

    test('getAllCategories returns a list of categories', () async {
      mockCategoryRepository.addCategory(Category(id: '1', name: 'Test', description: 'Test Description'));
      mockCategoryRepository.addCategory(Category(id: '2', name: 'Test 2', description: 'Test Description 2'));

      final categories = await mockCategoryRepository.getAllCategories();

      expect(categories, isA<List<Category>>());
      expect(categories.length, 2);
    });

    test('deleteCategory successfully deletes a category', () async {
      const categoryId = '1';
      mockCategoryRepository.addCategory(Category(id: '1', name: 'Test', description: 'Test Description'));

      await mockCategoryRepository.deleteCategory(categoryId);

      expect(await mockCategoryRepository.getAllCategories(), isEmpty);
    });

    test('getAllCategories handles empty list', () async {
      final categories = await mockCategoryRepository.getAllCategories();

      expect(categories, isEmpty);
    });

    test('deleteCategory with non-existing id does not throw', () async {
      const categoryId = 'non-existing';

      expect(() async => await mockCategoryRepository.deleteCategory(categoryId), returnsNormally);
    });
  });
}