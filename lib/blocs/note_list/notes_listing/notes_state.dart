part of 'notes_bloc.dart';

sealed class NotesListingState extends Equatable {
  const NotesListingState();

  @override
  List<Object> get props => [];
}

final class NoteListingInitial extends NotesListingState {}

class NotesListingSuccess extends NotesListingState {
  final List<NoteModel> notes;
  const NotesListingSuccess({this.notes = const []});
}

class NotesListingFailure extends NotesListingState {
  final String? message;
  const NotesListingFailure({this.message});
}

class NotesListingProcess extends NotesListingState {}
