import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notes_repository/notes_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NoteListingEvent, NotesListingState> {
  final NoteRepository _noteRepository;

  NotesBloc({required NoteRepository noteRepository})
      : _noteRepository = noteRepository,
        super(NoteListingInitial()) {
    on<LoadNotes>(_onNoteListingLoad);
    on<NoteSelected>(_onNoteSelected);
  }

  void _onNoteListingLoad(
      LoadNotes event, Emitter<NotesListingState> emit) async {
    emit(NotesListingProcess());
    try {
      List<NoteModel> notes = await _noteRepository.getNotes();
      emit((NotesListingSuccess(notes: notes)));
    } on FirebaseException catch (e) {
      emit(NotesListingFailure(message: e.code));
    } catch (e) {
      emit(const NotesListingFailure());
    }
  }

  void _onNoteSelected(
      NoteSelected event, Emitter<NotesListingState> emit) async {}
}
