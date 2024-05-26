import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notes_repository/notes_repository.dart';

part 'add_new_note_event.dart';
part 'add_new_note_state.dart';

class AddNewNoteBloc extends Bloc<AddNewNoteEvent, AddNewNoteState> {
  final NoteRepository _noteRepository;

  AddNewNoteBloc({required noteRepository})
      : _noteRepository = noteRepository,
        super(AddNewNoteInitial()) {
    on<AddNewNoteRequired>(_onAddNewNoteRequired);
  }

  void _onAddNewNoteRequired(
      AddNewNoteRequired event, Emitter<AddNewNoteState> emit) async {
    emit(AddNewNoteProcess());
    try {
      await _noteRepository.addNote(event.note);
      emit(NewNoteAddingSuccess());
    } catch (e) {
      emit(NewNoteAddingFailure(message: e.toString()));
    }
  }
}
