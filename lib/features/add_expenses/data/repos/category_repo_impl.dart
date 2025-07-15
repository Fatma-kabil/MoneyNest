import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:money_nest/features/add_expenses/domain/entites/category_entity.dart';
import 'package:money_nest/features/add_expenses/domain/repos/category_repo.dart';
import 'package:money_nest/features/add_expenses/data/models/category_model.dart'; // تأكد إنك مستورد الموديل

class CategoryRepoImpl extends CategoryRepo {
  final categoryCollection = FirebaseFirestore.instance.collection(
    'categories',
  );

  @override
  Future<void> createCategory(CategoryEntity category) async {
    try {
       final userId = FirebaseAuth.instance.currentUser!.uid;
      final model = CategoryModel(
        id: category.id,
        name: category.name,
      //  totalExpenses: category.totalExpenses,
        icon: category.icon,
        color: category.color,
        userId: userId,
      );

      await categoryCollection.doc(model.id).set(model.toMap());
    } catch (e) {
      log('Error in createCategory: $e');
      rethrow;
    }
  }

  Future<List<CategoryEntity>> getAllCategories() async {
    try {
    //  final snapshot = await categoryCollection.get();
 final userId = FirebaseAuth.instance.currentUser!.uid;

    final snapshot = await categoryCollection
        .where('userId', isEqualTo: userId) // ✅ فلترة حسب المستخدم
        .get();

      return snapshot.docs.map((doc) {
        final data = doc.data();
        return CategoryModel.fromMap(data);
      }).toList();
    } catch (e) {
      log('Error in getAllCategories: $e');
      rethrow;
    }
  }
}
