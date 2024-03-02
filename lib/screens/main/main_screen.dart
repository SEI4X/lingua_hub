import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingua_notes/blocs/authentication/sign_in/sign_in_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      // appBar: AppBar(
      //   title: const Text('Welcome, you are In !'),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         context.read<SignInBloc>().add(const SignOutRequired());
      //       },
      //       icon: const Icon(Icons.login),
      //     ),
      //   ],
      // ),
      body: [
        /// Notes page
        const Placeholder(),

        /// User page
        Container(
          color: Colors.red,
          child: const Placeholder(
            color: Colors.red,
          ),
        ),
      ][currentPageIndex],

      /// Bottom navigation bar
      bottomNavigationBar: NavigationBar(
        height: 60,
        elevation: 3,
        shadowColor: Theme.of(context).colorScheme.background,
        backgroundColor: Theme.of(context).colorScheme.background,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: [
          NavigationDestination(
            selectedIcon: Icon(
              Icons.explore,
              color: Theme.of(context).colorScheme.primary,
            ),
            icon: const Icon(Icons.explore),
            label: 'Explore',
          ),
          const NavigationDestination(
            icon: Icon(Icons.commute),
            label: 'Commute',
          ),
        ],
      ),
    );
  }
}
