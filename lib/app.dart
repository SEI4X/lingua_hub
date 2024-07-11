import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingua_notes/app_view.dart';
import 'package:lingua_notes/blocs/authentication/authentication_bloc.dart';
import 'package:user_repository/user_repository.dart';

class LinguaNotes extends StatelessWidget {
  final UserRepository userRepository;
  const LinguaNotes(this.userRepository, {super.key});

  @override
  Widget build(BuildContext context) {
    userRepository.setupRepository;
    return RepositoryProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc(
        userRepository: userRepository,
      ),
      child: const LinguaNotesView(),
    );
  }
}
