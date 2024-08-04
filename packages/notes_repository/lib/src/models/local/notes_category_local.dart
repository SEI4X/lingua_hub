// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';
import 'package:notes_repository/notes_repository.dart';

part 'notes_category_local.g.dart';

@collection
class NotesCategoryLocal {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.hash)
  String? serverId;
  String? name;

  NotesCategoryLocal({
    this.serverId,
    this.name,
  });

  static NotesCategoryLocal fromModel(NoteCategoryModel model) {
    return NotesCategoryLocal(
      serverId: model.id,
      name: model.name,
    );
  }
}
