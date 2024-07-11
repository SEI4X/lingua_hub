import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuzzy/fuzzy.dart';
import 'package:lingua_notes/blocs/note_list/add_new_note/add_new_note_bloc.dart';
import 'package:lingua_notes/blocs/note_list/categories/categories_bloc.dart';
import 'package:lingua_notes/blocs/note_list/edite_note/edite_note_bloc.dart';
import 'package:lingua_notes/blocs/note_list/notes_listing/notes_bloc.dart';
import 'package:lingua_notes/core/components/chips_scroll_view.dart';
import 'package:lingua_notes/core/components/text_field.dart';
import 'package:lingua_notes/screens/notes_list/add_new_note/new_note_screen.dart';
import 'package:lingua_notes/screens/notes_list/note_cell/note_list_cell.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:notes_repository/notes_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  List<NoteModel> notes = [];
  List<NoteCategoryModel> categories = [];
  String selectedCategory = "";
  bool isLoading = true;
  NoteModel? note;
  int? editedIndex;
  int learnedWordsCount = 0;
  bool isNeededUpdate = false;

  @override
  void initState() {
    _noteRepository.setupRepository();
    _categoryRepository.setupRepository();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<NoteModel> filteredNotes = filterNotes();
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryListingBloc>(
          create: (BuildContext context) =>
              CategoryListingBloc(categoryRepository: _categoryRepository)
                ..add(const LoadCategories()),
        ),
        BlocProvider<NotesBloc>(
          create: (BuildContext context) =>
              NotesBloc(noteRepository: _noteRepository)
                ..add(const LoadNotes()),
        ),
        BlocProvider<EditeNoteBloc>(
          create: (BuildContext context) =>
              EditeNoteBloc(noteRepository: _noteRepository),
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
                return MultiBlocProvider(
                  providers: [
                    BlocProvider<AddNewNoteBloc>(
                      create: (context) =>
                          AddNewNoteBloc(noteRepository: _noteRepository),
                    ),
                    BlocProvider(
                      create: (context) => CategoryListingBloc(
                          categoryRepository: _categoryRepository),
                    ),
                  ],
                  child: NewNoteScreen(
                    callback: () {
                      setState(() {
                        isNeededUpdate = true;
                      });
                    },
                    categories: categories,
                  ),
                );
              },
            ).then((result) {
              if (result != null) {
                if (result[0]) {
                  setState(() {
                    isNeededUpdate = true;
                  });
                }
              }
            });
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
              title: Text(
                'My list ($learnedWordsCount / ${notes.length})',
                textAlign: TextAlign.left,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Icon(
                        Symbols.sort_rounded,
                        color: Theme.of(context).colorScheme.onPrimary,
                        size: 24,
                        weight: 600,
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
                              if (state is CategoryListingSuccess) {
                                categories = state.categories;
                                return LNChipsList(
                                  categories: state.categories,
                                  completion: (value) {
                                    setState(() {
                                      selectedCategory = value;
                                    });
                                  },
                                );
                              } else if (state is CategoryListingProcess) {
                                return LNChipsList(
                                  categories: const [],
                                  isLoading: true,
                                  completion: (value) {},
                                );
                              } else {
                                return LNChipsList(
                                  categories: const [],
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
                              hintText: AppLocalizations.of(context)!.search,
                              obscureText: false,
                              keyboardType: TextInputType.visiblePassword,
                              onChanged: (name) {
                                setState(() {
                                  filteredNotes;
                                });
                                return null;
                              },
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
            child: MultiBlocListener(
              listeners: [
                BlocListener<NotesBloc, NotesListingState>(
                  listener: (context, state) {
                    setState(() {
                      if (state is NotesListingSuccess) {
                        notes = state.notes;
                        isLoading = false;
                        learnedWordsCount =
                            notes.where((x) => x.isLearned).length;
                      } else if (state is NotesListingProcess) {
                        isLoading = true;
                      }
                    });
                  },
                ),
                BlocListener<EditeNoteBloc, EditeNoteState>(
                  listener: (context, state) {
                    if (state is EditeNoteSuccess) {
                      setState(() {
                        if (note == null && editedIndex != null) {
                          if (filteredNotes[editedIndex!].isLearned == true) {
                            learnedWordsCount -= 1;
                          }
                          notes.removeWhere((note) {
                            return note.id == filteredNotes[editedIndex!].id;
                          });
                        } else if (note != null && editedIndex != null) {
                          int noteIndex = notes.indexWhere((note) {
                            return note.id == filteredNotes[editedIndex!].id;
                          });
                          notes[noteIndex] = note!;
                          if (note!.isLearned == true) {
                            learnedWordsCount += 1;
                          } else {
                            learnedWordsCount -= 1;
                          }
                        }
                      });
                    }

                    if (state is! EditeNoteProcess) {
                      setState(() {
                        note = null;
                        editedIndex = null;
                      });
                    }
                    ;
                  },
                ),
              ],
              child: ListView.builder(
                itemCount: filteredNotes.length,
                itemBuilder: (context, index) {
                  if (isNeededUpdate && !isLoading) {
                    isNeededUpdate = false;
                    context.read<NotesBloc>().add(const LoadNotes());
                    context
                        .read<CategoryListingBloc>()
                        .add(const LoadCategories());
                  }
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
                    confirmDismiss: (direction) async {
                      switch (direction) {
                        case DismissDirection.startToEnd:
                          editedIndex = index;
                          note = filteredNotes[index].copyWith(
                              isLearned: !filteredNotes[index].isLearned);
                          if (note != null) {
                            context.read<EditeNoteBloc>().add(
                                  EditingNote(note!),
                                );
                          }
                          return false;
                        case DismissDirection.endToStart:
                          context.read<EditeNoteBloc>().add(
                                DeletingNote(filteredNotes[index]),
                              );
                          editedIndex = index;
                          return true;
                        default:
                          return false;
                      }
                    },
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
                    key: UniqueKey(),
                    child: NoteListCell(
                      note: filteredNotes[index],
                      category: categories
                          .firstWhere(
                            (x) => (x.id == filteredNotes[index].categoryId),
                            orElse: () =>
                                const NoteCategoryModel(id: "", name: ""),
                          )
                          .name,
                      isLoading: isLoading,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<NoteModel> filterNotes() {
    if (selectedCategory == "" && passwordController.text == "") {
      return notes;
    } else if (passwordController.text == "") {
      return notes.where((note) {
        return note.categoryId == selectedCategory;
      }).toList();
    } else if (selectedCategory != "" && passwordController.text != "") {
      return fuzzySearchResults(
        passwordController.text,
        notes.where((note) {
          return note.categoryId == selectedCategory;
        }).toList(),
      );
    } else {
      return fuzzySearchResults(passwordController.text, notes);
    }
  }

  List<NoteModel> fuzzySearchResults(
      String searchText, List<NoteModel> searchedNotes) {
    List<String> notesWorsd =
        searchedNotes.map((note) => note.originalText).toList();
    List<String> notesTranslates =
        searchedNotes.map((note) => note.translatedText).toList();
    Fuzzy<String> fuzzyWords = Fuzzy(
      notesWorsd,
      options: FuzzyOptions(
        findAllMatches: true,
        tokenize: true,
        shouldSort: true,
        shouldNormalize: true,
        threshold: 0.4,
      ),
    );

    List<String> fuzzyWordResult = fuzzyWords.search(searchText).map((word) {
      return word.item;
    }).toList();

    if (fuzzyWordResult.isEmpty) {
      Fuzzy<String> fuzzyWords = Fuzzy(
        notesTranslates,
        options: FuzzyOptions(
          findAllMatches: true,
          tokenize: true,
          threshold: 0.6,
        ),
      );

      List<String> fuzzyTranslatesResult =
          fuzzyWords.search(searchText).map((word) {
        return word.item;
      }).toList();

      return searchedNotes.where((note) {
        return fuzzyTranslatesResult.contains(note.translatedText);
      }).toList();
    } else {
      return searchedNotes.where((note) {
        return fuzzyWordResult.contains(note.originalText);
      }).toList();
    }
  }
}
