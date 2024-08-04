import 'package:flutter/material.dart';
import 'package:lingua_notes/screens/learning_swipe/home/learning_cards_screen.dart';
import 'package:lingua_notes/screens/user/user_screen.dart';
import 'package:material_symbols_icons/symbols.dart';
import '../notes_list/notes_listing_screen.dart';

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
        children: const [
          /// User page
          UserScreen(),

          /// User page
          LearningCardsScreen(),

          /// Notes page
          NotesListingScreen(),

          /// User page
          UserScreen()
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
              Symbols.home_rounded,
              size: 27,
              weight: 600,
              color: Theme.of(context).colorScheme.primary,
            ),
            icon: Icon(
              Symbols.home_rounded,
              size: 27,
              weight: 600,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Symbols.school_rounded,
              size: 27,
              weight: 600,
              color: Theme.of(context).colorScheme.primary,
            ),
            icon: Icon(
              Symbols.school_rounded,
              size: 27,
              weight: 600,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Symbols.checklist_rounded,
              size: 27,
              weight: 600,
              color: Theme.of(context).colorScheme.primary,
            ),
            icon: Icon(
              Symbols.checklist_rounded,
              size: 27,
              weight: 600,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Symbols.person_rounded,
              size: 27,
              weight: 600,
              color: Theme.of(context).colorScheme.primary,
            ),
            icon: Icon(
              Symbols.person_rounded,
              size: 27,
              weight: 600,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
