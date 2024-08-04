import 'package:notes_repository/notes_repository.dart';

import 'models/model.dart';

abstract class NoteRepository {
  Future<void> setupRepository();

  Future<List<NoteModel>> getNotes();

  Future<void> addNote(NoteModel newNote);

  Future<void> editeNote(NoteModel editedNote);

  Future<void> deleteNote(String noteId);

  Future<NoteModel?> getNoteById(String noteId);

  Future<List<NoteModel>> getNotesForLearning(
      CardsLearnType type, String categoryId, int count);
}
