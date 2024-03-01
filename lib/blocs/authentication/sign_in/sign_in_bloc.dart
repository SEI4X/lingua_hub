import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserRepository _userRepository;

  SignInBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(SignInInitial()) {
    on<SignInRequired>(_onSignInRequired);
    on<SignOutRequired>(_onSignOutRequired);
  }

  void _onSignInRequired(
      SignInRequired event, Emitter<SignInState> emit) async {
    emit(SignInProcess());
    try {
      await _userRepository.signInByEmail(event.email, event.password);
      emit(SignInSuccess());
    } on FirebaseAuthException catch (e) {
      emit(SignInFailure(message: e.code));
    } catch (e) {
      emit(const SignInFailure());
    }
  }

  void _onSignOutRequired(
      SignOutRequired event, Emitter<SignInState> emit) async {
    await _userRepository.logOut();
  }
}
