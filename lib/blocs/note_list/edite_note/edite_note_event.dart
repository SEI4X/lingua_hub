part of 'edite_note_bloc.dart';

sealed class EditeNoteEvent extends Equatable {
  const EditeNoteEvent();

  @override
  List<Object> get props => [];
}

class DeletingNote extends EditeNoteEvent {
  final NoteModel note;

  const DeletingNote(this.note);

  @override
  List<Object> get props => [note];
}

class EditingNote extends EditeNoteEvent {
  final NoteModel note;

  const EditingNote(this.note);

  @override
  List<Object> get props => [note];
}
