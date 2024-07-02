import 'models/model.dart';

abstract class NoteCategoryRepository {
  Future<void> setupRepository();

  Future<List<NoteCategoryModel>> getNoteCategories();

  Future<void> addNoteCategory(NoteCategoryModel newCategory);

  Future<void> editeNoteCategory(NoteCategoryModel editedCategory);

  Future<void> deleteNoteCategory(String categoryId);
}
