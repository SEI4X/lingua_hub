part of 'edite_note_bloc.dart';

sealed class EditeNoteState extends Equatable {
  const EditeNoteState();

  @override
  List<Object> get props => [];
}

final class EditeNoteInitial extends EditeNoteState {}

class EditeNoteSuccess extends EditeNoteState {
  const EditeNoteSuccess();
}

class EditeNoteFailure extends EditeNoteState {
  final String? message;
  const EditeNoteFailure({this.message});
}

class EditeNoteProcess extends EditeNoteState {}
