part of 'notes_bloc.dart';

sealed class NoteListingEvent extends Equatable {
  const NoteListingEvent();

  @override
  List<Object> get props => [];
}

class NoteSelected extends NoteListingEvent {
  final NoteCategoryModel category;

  const NoteSelected(this.category);

  @override
  List<Object> get props => [category];
}

class LoadNotes extends NoteListingEvent {
  const LoadNotes();

  @override
  List<Object> get props => [];
}
