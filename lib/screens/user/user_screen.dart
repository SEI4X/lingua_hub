import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingua_notes/blocs/authentication/sign_in/sign_in_bloc.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome, you are In !'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<SignInBloc>().add(const SignOutRequired());
            },
            icon: const Icon(Icons.login),
          ),
        ],
      ),
    );
  }
}
