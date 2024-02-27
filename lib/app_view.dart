import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingua_notes/blocs/authentication/authentication_bloc.dart';
import 'package:lingua_notes/blocs/sign_in/sign_in_bloc.dart';
import 'package:lingua_notes/screens/auth/login_screen.dart';
import 'package:lingua_notes/screens/main/main_screen.dart';

import 'core/utils/constants.dart' as constnants;

class LinguaNotesView extends StatelessWidget {
  const LinguaNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: constnants.lightTheme,
        splashFactory: NoSplash.splashFactory,
        hoverColor: Colors.transparent,
        hintColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      title: 'Lingua Notes',
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
        switch (state.status) {
          case AuthenticationStatus.authenticated:
            return BlocProvider(
              create: (context) => SignInBloc(
                  userRepository:
                      context.read<AuthenticationBloc>().userRepository),
              child: const MainScreen(),
            );
          // return const MainScreen();
          default:
            return const LoginScreen();
        }
      }),
    );
  }
}
