import 'category.dart';

abstract class CategoryRepository {
  Future<void> addCategory(Category category);
  Future<List<Category>> getAllCategories();
  Future<void> deleteCategory(String categoryId);
}