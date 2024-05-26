import 'dart:developer';
import '../src/models/model.dart';
import '../src/entities/entities.dart';
import 'note_category_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseNoteCategoryRepository implements NoteCategoryRepository {
  final String? _userUid;
  late final categoriesCollection = FirebaseFirestore.instance
      .collection('users')
      .doc(_userUid)
      .collection('categories');

  FirebaseNoteCategoryRepository({
    FirebaseAuth? firebaseAuth,
  }) : _userUid = firebaseAuth?.currentUser?.uid ??
            FirebaseAuth.instance.currentUser?.uid;

  @override
  Future<void> addNoteCategory(NoteCategoryModel newCategory) async {
    try {
      await categoriesCollection
          .doc(newCategory.id)
          .set(newCategory.toEntity().toJSON());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> deleteNoteCategory(String categoryId) async {
    try {
      await categoriesCollection.doc(categoryId).delete();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> editeNoteCategory(NoteCategoryModel editedCategory) async {
    try {
      await categoriesCollection
          .doc(editedCategory.id)
          .set(editedCategory.toEntity().toJSON());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<NoteCategoryModel>> getNoteCategories() async {
    try {
      List<NoteCategoryModel> categories = await categoriesCollection
          .get()
          .then((value) => value.docs
              .map((category) => NoteCategoryModel.fromEntity(
                  NoteCategoryEntity.fromJSON(category.data())))
              .toList());

      return categories;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
