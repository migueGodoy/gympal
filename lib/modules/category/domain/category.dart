class Category {
  final String id;
  final String name;
  final String description;

  Category({required this.id, required this.name, required this.description}) {
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
    };
  }

  static Category fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      name: map['name'],
      description: map['description'],
    );
  }

  @override
  String toString() {
    return 'Category(id: $id, name: $name, description: $description)';
  }
}