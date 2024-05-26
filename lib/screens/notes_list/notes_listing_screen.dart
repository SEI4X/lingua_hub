import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingua_notes/blocs/note_list/add_new_note/add_new_note_bloc.dart';
import 'package:lingua_notes/blocs/note_list/categories/categories_bloc.dart';
import 'package:lingua_notes/core/components/chips_scroll_view.dart';
import 'package:lingua_notes/core/components/text_field.dart';
import 'package:lingua_notes/screens/notes_list/add_new_note/new_note_screen.dart';
import 'package:lingua_notes/screens/notes_list/note_cell/note_list_cell.dart';
import 'package:notes_repository/notes_repository.dart';

class NotesListingScreen extends StatefulWidget {
  const NotesListingScreen({super.key});

  @override
  State<NotesListingScreen> createState() => _NotesListingScreenState();
}

class _NotesListingScreenState extends State<NotesListingScreen> {
  final passwordController = TextEditingController();
  final NoteRepository noteRepository = FirebaseNoteRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryListingBloc>(
          create: (context) => CategoryListingBloc(
            noteCategoryRepository: FirebaseNoteCategoryRepository(),
          ),
        ),
      ],
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Theme.of(context).colorScheme.background,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20.0),
                ),
              ),
              context: context,
              builder: (context) {
                return BlocProvider<AddNewNoteBloc>(
                  create: (context) =>
                      AddNewNoteBloc(noteRepository: noteRepository),
                  child: const NewNoteScreen(),
                );
              },
            );
          },
          splashColor: Colors.transparent,
          elevation: 0,
          highlightElevation: 1,
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.onPrimary,
            size: 30,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              backgroundColor: Theme.of(context).colorScheme.background,
              pinned: false,
              floating: true,
              snap: true,
              stretch: true,
              elevation: 0,
              shadowColor: Colors.transparent,
              centerTitle: false,
              title: const Text(
                'My list (14 / 137)',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(120),
                  child: SizedBox(
                    height: 120,
                    child: Column(
                      children: [
                        const Expanded(child: LNChipsList()),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 16),
                          child: SizedBox(
                            height: 50,
                            child: LNTextField(
                              controller: passwordController,
                              hintText: "Search",
                              obscureText: false,
                              keyboardType: TextInputType.visiblePassword,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
          body: MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Dismissible(
                      secondaryBackground: Container(
                        color: Theme.of(context).colorScheme.tertiaryContainer,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Icon(
                              size: 30,
                              Icons.delete_outlined,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onTertiaryContainer,
                            ),
                          ),
                        ),
                      ),
                      background: Container(
                        color: Theme.of(context).colorScheme.primary,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Icon(
                              size: 30,
                              Icons.done_sharp,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ),
                      key: ValueKey<int>(index),
                      child: NoteListCell());
                }),
          ),
        ),
      ),
    );
  }
}
