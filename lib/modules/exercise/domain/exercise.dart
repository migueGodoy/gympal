import '../../category/domain/category.dart';

class Exercise {
  final String id;
  final String name;
  final String description;
  final Category category;

  Exercise({required this.id, required this.name, required this.description, required this.category}) {
    if (id.isEmpty) {
      throw ArgumentError('Id cannot be empty');
    }

    if (name.isEmpty) {
      throw ArgumentError('Name cannot be empty');
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'category': category.toMap(),
    };
  }

  static Exercise fromMap(Map<String, dynamic> map) {
    return Exercise(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      category: Category.fromMap(map['category']),
    );
  }
}