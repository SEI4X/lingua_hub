import 'package:flutter/material.dart';
import 'package:lingua_notes/screens/user/user_screen.dart';
import '../notes_list/notes_listing_screen.dart';
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
      body: IndexedStack(
        index: currentPageIndex,
        children: [
          /// Notes page
          const NotesListingScreen(),

          /// User page
          const UserScreen()
        ],
      ),

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
            icon: Icon(
              Icons.explore,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.commute,
              color: Theme.of(context).colorScheme.primary,
            ),
            icon: Icon(
              Icons.commute,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
