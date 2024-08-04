import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lingua_notes/screens/learning_swipe/settings/cards_learning_settings_screen.dart';
import 'package:notes_repository/notes_repository.dart';

part 'learning_settings_event.dart';
part 'learning_settings_state.dart';

class LearningSettingsBloc
    extends Bloc<LearningSettingsEvent, LearningSettingsState> {
  final NoteRepository noteRepository;

  LearningSettingsBloc({
    required this.noteRepository,
  }) : super(LearningSettingsInitial()) {
    on<EditingLearningSettings>(_onEditingNoteRequired);
  }

  void _onEditingNoteRequired(EditingLearningSettings event,
      Emitter<LearningSettingsState> emit) async {
    emit(LearningSettingsProcess());
    try {
      var result = await noteRepository.getNotesForLearning(
          event.config.learnType,
          event.config.selectedCategory,
          event.config.allCardsCount);
      emit(LearningSettingsSuccess(result));
    } catch (e) {
      emit(LearningSettingsFailure(message: e.toString()));
    }
  }
}
