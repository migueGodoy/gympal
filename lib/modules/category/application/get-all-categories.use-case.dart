import '../domain/category.repository.dart';
import '../domain/category.dart';

class GetAllCategoriesUseCase {
  final CategoryRepository _categoryRepository;

  GetAllCategoriesUseCase(this._categoryRepository);

  Future<List<Category>> run() async {
    return await _categoryRepository.getAllCategories();
  }
}