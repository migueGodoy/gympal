import 'package:gympal/modules/category/domain/category.dart';
import 'package:gympal/modules/category/domain/category.repository.dart';

class MockCategoryRepository implements CategoryRepository {
  final List<Category> _categories = [];

  @override
  Future<void> addCategory(Category category) async {
    _categories.add(category);
  }

  @override
  Future<List<Category>> getAllCategories() async {
    return _categories;
  }

  @override
  Future<void> deleteCategory(String categoryId) async {
    _categories.removeWhere((element) => element.id == categoryId);
  }
}