part of 'learning_settings_bloc.dart';

sealed class LearningSettingsState extends Equatable {
  const LearningSettingsState();

  @override
  List<Object> get props => [];
}

final class LearningSettingsInitial extends LearningSettingsState {}

class LearningSettingsSuccess extends LearningSettingsState {
  final List<NoteModel> notes;
  const LearningSettingsSuccess(this.notes);
}

class LearningSettingsFailure extends LearningSettingsState {
  final String? message;
  const LearningSettingsFailure({this.message});
}

class LearningSettingsProcess extends LearningSettingsState {}
