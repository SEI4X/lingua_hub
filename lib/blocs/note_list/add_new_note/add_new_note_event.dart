part of 'add_new_note_bloc.dart';

sealed class AddNewNoteEvent extends Equatable {
  const AddNewNoteEvent();

  @override
  List<Object> get props => [];
}

class AddNewNoteRequired extends AddNewNoteEvent {
  final NoteModel note;

  const AddNewNoteRequired(this.note);
}
