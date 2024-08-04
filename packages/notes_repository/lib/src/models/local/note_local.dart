// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';
import 'package:notes_repository/notes_repository.dart';

part 'note_local.g.dart';

@collection
class NoteLocal {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  String? serverId;

  String? originalText;
  String? translatedText;
  String? transcription;
  String? notes;
  String? examples;
  String? categoryId;
  int? learnCount;
  DateTime? createDate;
  DateTime? learnDate;
  DateTime? lastLearnDate;
  bool? isAutoTranslated;
  bool? isLearned;

  NoteLocal({
    this.serverId,
    this.originalText,
    this.translatedText,
    this.transcription,
    this.notes,
    this.examples,
    this.categoryId,
    this.learnCount,
    this.createDate,
    this.learnDate,
    this.lastLearnDate,
    this.isAutoTranslated,
    this.isLearned,
  });

  static NoteLocal fromModel(NoteModel model) {
    return NoteLocal(
      serverId: model.id,
      originalText: model.originalText,
      translatedText: model.translatedText,
      transcription: model.transcription,
      notes: model.notes,
      examples: model.examples,
      categoryId: model.categoryId,
      learnCount: model.learnCount,
      createDate: model.createDate?.toDate(),
      learnDate: model.learnDate?.toDate(),
      lastLearnDate: model.lastLearnDate?.toDate(),
      isAutoTranslated: model.isAutoTranslated,
      isLearned: model.isLearned,
    );
  }
}
