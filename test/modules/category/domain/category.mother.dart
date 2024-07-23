import 'package:gympal/modules/category/domain/category.dart';

class CategoryMother {
  static Category valid() {
    return Category(id: '1', name: 'Fitness', description: 'Fitness related activities');
  }

  static Category withoutId() {
    return Category(id: '', name: 'Fitness', description: 'Fitness related activities');
  }

  static Category withoutName() {
    return Category(id: '1', name: '', description: 'Fitness related activities');
  }

  static Category withoutDescription() {
    return Category(id: '1', name: 'Fitness', description: '');
  }
}