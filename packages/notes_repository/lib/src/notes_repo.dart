import 'models/model.dart';

abstract class NoteRepository {
  Future<List<NoteModel>> getNotes();

  Future<void> addNote(NoteModel newNote);

  Future<void> editeNote(NoteModel editedNote);

  Future<void> deleteNote(String noteId);
}
