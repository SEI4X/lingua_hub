import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/user_repository.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final UserRepository _userRepository;

  ResetPasswordBloc({required userRepository})
      : _userRepository = userRepository,
        super(ResetPasswordInitial()) {
    on<ResetPasswordRequired>(_onResetPasswordRequired);
  }

  void _onResetPasswordRequired(
      ResetPasswordRequired event, Emitter<ResetPasswordState> emit) async {
    emit(ResetPasswordProcess());
    try {
      await _userRepository.resetPassword(event.email);
      emit(ResetPasswordSuccess());
    } on FirebaseAuthException catch (e) {
      emit(ResetPasswordFailure(message: e.code));
    } catch (e) {
      emit(const ResetPasswordFailure());
    }
  }
}
