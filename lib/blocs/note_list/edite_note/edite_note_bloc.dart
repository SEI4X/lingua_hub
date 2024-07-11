import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:notes_repository/notes_repository.dart';

part 'edite_note_event.dart';
part 'edite_note_state.dart';

class EditeNoteBloc extends Bloc<EditeNoteEvent, EditeNoteState> {
  final NoteRepository _noteRepository;

  EditeNoteBloc({required NoteRepository noteRepository})
      : _noteRepository = noteRepository,
        super(EditeNoteInitial()) {
    on<DeletingNote>(_onDeleteNote);
    on<EditingNote>(_onEditeNote);
  }

  void _onDeleteNote(DeletingNote event, Emitter<EditeNoteState> emit) async {
    emit(EditeNoteProcess());
    try {
      if (event.note.id != null) {
        await _noteRepository.deleteNote(event.note.id ?? "");
      }
      emit((const EditeNoteSuccess()));
    } on FirebaseException catch (e) {
      emit(EditeNoteFailure(message: e.code));
    } catch (e) {
      emit(const EditeNoteFailure());
    }
  }

  void _onEditeNote(EditingNote event, Emitter<EditeNoteState> emit) async {
    emit(EditeNoteProcess());
    try {
      await _noteRepository.editeNote(event.note);
      emit((const EditeNoteSuccess()));
    } on FirebaseException catch (e) {
      emit(EditeNoteFailure(message: e.code));
    } catch (e) {
      emit(const EditeNoteFailure());
    }
  }
}
