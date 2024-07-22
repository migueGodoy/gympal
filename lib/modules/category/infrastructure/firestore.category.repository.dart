import 'package:cloud_firestore/cloud_firestore.dart';
import '../domain/category.dart';
import '../domain/category.repository.dart';

class FirestoreCategoryRepository implements CategoryRepository {
  final CollectionReference _categoriesCollection = FirebaseFirestore.instance.collection('categories');

  @override
  Future<void> addCategory(Category category) async {
    await _categoriesCollection.doc(category.id).set(category.toMap());
  }

  @override
  Future<List<Category>> getAllCategories() async {
    final QuerySnapshot snapshot = await _categoriesCollection.get();
    return snapshot.docs.map((doc) => Category.fromMap(doc.data() as Map<String, dynamic>)).toList();
  }

  @override
  Future<void> deleteCategory(String categoryId) async {
    await _categoriesCollection.doc(categoryId).delete();
  }
}