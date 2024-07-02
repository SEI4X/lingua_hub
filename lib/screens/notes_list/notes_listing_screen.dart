import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingua_notes/blocs/note_list/add_new_note/add_new_note_bloc.dart';
import 'package:lingua_notes/blocs/note_list/categories/categories_bloc.dart';
import 'package:lingua_notes/blocs/note_list/notes/notes_bloc.dart';
import 'package:lingua_notes/core/components/chips_scroll_view.dart';
import 'package:lingua_notes/core/components/text_field.dart';
import 'package:lingua_notes/screens/notes_list/add_new_note/new_note_screen.dart';
import 'package:lingua_notes/screens/notes_list/note_cell/note_list_cell.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:notes_repository/notes_repository.dart';

class NotesListingScreen extends StatefulWidget {
  const NotesListingScreen({super.key});

  @override
  State<NotesListingScreen> createState() => _NotesListingScreenState();
}

class _NotesListingScreenState extends State<NotesListingScreen> {
  final passwordController = TextEditingController();
  final NoteRepository _noteRepository = FirebaseNoteRepository();
  final NoteCategoryRepository _categoryRepository =
      FirebaseNoteCategoryRepository();

  @override
  void initState() {
    _noteRepository.setupRepository();
    _categoryRepository.setupRepository();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryListingBloc>(
          create: (BuildContext context) =>
              CategoryListingBloc(noteCategoryRepository: _categoryRepository),
        ),
        BlocProvider<NotesBloc>(
          create: (BuildContext context) =>
              NotesBloc(noteRepository: _noteRepository)..add(LoadNotes()),
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
                      AddNewNoteBloc(noteRepository: _noteRepository),
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
              actions: [
                Padding(
                  padding:
                      const EdgeInsets.only(right: 16.0, bottom: 8, top: 8),
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        backgroundColor:
                            Theme.of(context).colorScheme.background,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Icon(
                        Symbols.tune_rounded,
                        color: Theme.of(context).colorScheme.onPrimary,
                        size: 24,
                      ),
                      onPressed: () {
                        print("TAP");
                      },
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 16.0, bottom: 8, top: 8),
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Icon(
                        Symbols.filter_alt_rounded,
                        color: Theme.of(context).colorScheme.onPrimary,
                        size: 24,
                      ),
                      onPressed: () {
                        print("TAP");
                      },
                    ),
                  ),
                ),
              ],
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(120),
                  child: SizedBox(
                    height: 120,
                    child: Column(
                      children: [
                        Expanded(
                          child: BlocBuilder<CategoryListingBloc,
                              CategoryListingState>(
                            builder: (context, state) {
                              switch (state.status) {
                                case CategoriesStatus.success:
                                  return LNChipsList(
                                    categories: [
                                      NoteCategoryModel(id: "1", name: "name")
                                    ],
                                    completion: (value) {
                                      print("$value");
                                    },
                                  );
                                case CategoriesStatus.loading:
                                  return LNChipsList(
                                    categories: [],
                                    isLoading: true,
                                    completion: (value) {},
                                  );
                                default:
                                  return LNChipsList(
                                    categories: [
                                      NoteCategoryModel(id: "All", name: "name")
                                    ],
                                    completion: (value) {
                                      print("$value");
                                    },
                                  );
                              }
                            },
                          ),
                        ),
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
            child: BlocBuilder<NotesBloc, NotesListingState>(
              builder: (context, state) {
                List<NoteModel> notes = [];
                bool isLoading = true;
                if (state is NotesListingSuccess) {
                  notes = state.notes;
                  isLoading = false;
                } else if (state is NotesListingProcess) {
                  isLoading = true;
                }
                return ListView.builder(
                  itemCount: notes.length,
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
                      child: NoteListCell(
                        note: notes[index],
                        isLoading: isLoading,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
