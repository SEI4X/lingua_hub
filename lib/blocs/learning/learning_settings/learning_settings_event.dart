// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'learning_settings_bloc.dart';

sealed class LearningSettingsEvent extends Equatable {
  const LearningSettingsEvent();

  @override
  List<Object> get props => [];
}

class EditingLearningSettings extends LearningSettingsEvent {
  final CardsLearningSettingsConfig config;

  const EditingLearningSettings(this.config);

  @override
  List<Object> get props => [config];
}
