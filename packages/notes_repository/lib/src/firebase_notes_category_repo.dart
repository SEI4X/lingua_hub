import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../src/models/model.dart';
import 'note_category_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseNoteCategoryRepository implements NoteCategoryRepository {
  final String? _userUid;
  final db = FirebaseFirestore.instance;
  late Future<Isar> localDb;
  late final categoriesCollection =
      db.collection('users').doc(_userUid).collection('categories');

  FirebaseNoteCategoryRepository({
    FirebaseAuth? firebaseAuth,
  }) : _userUid = firebaseAuth?.currentUser?.uid ??
            FirebaseAuth.instance.currentUser?.uid;

  Future<Isar> openLocalDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [NoteLocalSchema, NotesCategoryLocalSchema],
        inspector: true,
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance());
  }

  @override
  Future<void> setupRepository() async {
    localDb = openLocalDB();
    db.settings = const Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );

    categoriesCollection
        .snapshots(includeMetadataChanges: true)
        .listen((querySnapshot) {
      for (var change in querySnapshot.docChanges) {
        final source =
            (querySnapshot.metadata.isFromCache) ? "local cache" : "server";
        switch (change.type) {
          case DocumentChangeType.added:
            print("categoriesCollection added from $source}");
          case DocumentChangeType.modified:
            print("categoriesCollection modified from $source}");
          case DocumentChangeType.removed:
            print("categoriesCollection removed from $source}");
        }
      }
    });
  }

  @override
  Future<void> addNoteCategory(NoteCategoryModel newCategory) async {
    var newCategoryId = const Uuid().v4();
    var newLocalModel = NotesCategoryLocal.fromModel(newCategory);
    newLocalModel.serverId = newCategoryId;
    final isar = await localDb;
    isar.writeTxnSync(() {
      isar.notesCategoryLocals.putSync(newLocalModel);
    });

    // try {
    //   newCategory = newCategory.copyWith(id: newCategoryId);
    //   await categoriesCollection
    //       .doc(newCategory.id)
    //       .set(newCategory.toEntity().toJSON());
    // } catch (e) {
    //   log(e.toString());
    //   rethrow;
    // }
  }

  @override
  Future<void> deleteNoteCategory(String categoryId) async {
    final isar = await localDb;
    isar.writeTxnSync(() {
      var category = isar.notesCategoryLocals
          .filter()
          .serverIdContains(categoryId)
          .findFirstSync();
      isar.notesCategoryLocals.deleteSync(category?.id ?? 0);
    });

    // try {
    //   await categoriesCollection.doc(categoryId).delete();
    // } catch (e) {
    //   log(e.toString());
    //   rethrow;
    // }
  }

  @override
  Future<void> editeNoteCategory(NoteCategoryModel editedCategory) async {
    final isar = await localDb;
    isar.writeTxnSync(() {
      var category = isar.notesCategoryLocals
          .filter()
          .serverIdContains(editedCategory.id)
          .findFirstSync();
      var updatedCategoty = NotesCategoryLocal.fromModel(editedCategory);
      updatedCategoty.id = category?.id ?? Isar.autoIncrement;
      isar.notesCategoryLocals.putSync(updatedCategoty);
    });

    // try {
    //   await categoriesCollection
    //       .doc(editedCategory.id)
    //       .update(editedCategory.toEntity().toJSON());
    // } catch (e) {
    //   log(e.toString());
    //   rethrow;
    // }
  }

  @override
  Future<List<NoteCategoryModel>> getNoteCategories() async {
    final isar = await localDb;
    final categories = isar.notesCategoryLocals.where().findAllSync();
    final List<NoteCategoryModel> result = categories.map((category) {
      return NoteCategoryModel.fromLocal(category);
    }).toList();
    return result;
    // try {
    //   List<NoteCategoryModel> categories = await categoriesCollection
    //       .get()
    //       .then((value) => value.docs
    //           .map((category) => NoteCategoryModel.fromEntity(
    //               NoteCategoryEntity.fromJSON(category.data())))
    //           .toList());

    //   return categories;
    // } catch (e) {
    //   log(e.toString());
    //   rethrow;
    // }
  }
}
