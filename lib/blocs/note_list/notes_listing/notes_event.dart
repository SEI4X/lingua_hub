part of 'notes_bloc.dart';

sealed class NoteListingEvent extends Equatable {
  const NoteListingEvent();

  @override
  List<Object> get props => [];
}

class NoteSelected extends NoteListingEvent {
  final NoteModel note;

  const NoteSelected(this.note);

  @override
  List<Object> get props => [note];
}

class LoadNotes extends NoteListingEvent {
  const LoadNotes();

  @override
  List<Object> get props => [];
}
