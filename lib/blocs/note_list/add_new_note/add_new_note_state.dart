part of 'add_new_note_bloc.dart';

sealed class AddNewNoteState extends Equatable {
  const AddNewNoteState();

  @override
  List<Object> get props => [];
}

final class AddNewNoteInitial extends AddNewNoteState {}

class NewNoteAddingSuccess extends AddNewNoteState {}

class NewNoteAddingFailure extends AddNewNoteState {
  final String? message;
  const NewNoteAddingFailure({this.message});
}

class AddNewNoteProcess extends AddNewNoteState {}
