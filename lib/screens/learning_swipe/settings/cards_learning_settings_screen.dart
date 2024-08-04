// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:notes_repository/notes_repository.dart';

import 'package:lingua_notes/blocs/learning/learning_settings/learning_settings_bloc.dart';
import 'package:lingua_notes/blocs/note_list/categories/categories_bloc.dart';
import 'package:lingua_notes/core/components/chips_multiline.dart';
import 'package:lingua_notes/core/components/counter.dart';
import 'package:lingua_notes/core/components/standard_button.dart';
import 'package:lingua_notes/core/components/text_widget.dart';
import 'package:lingua_notes/screens/learning_swipe/settings/note_settings_cell.dart';

class CardsLearningSettingsScreen extends StatefulWidget {
  const CardsLearningSettingsScreen({super.key, required this.config});

  final CardsLearningSettingsConfig config;

  @override
  State<CardsLearningSettingsScreen> createState() =>
      _CardsLearningSettingsScreenState();
}

enum CardsStyleType { foreign, native, mixed }

class CardsLearningSettingsConfig {
  CardsLearnType learnType;
  CardsStyleType cardsStyleType;
  List<NoteModel> notes;
  int allCardsCount;
  int timesForLearn;
  String selectedCategory;
  List<NoteCategoryModel> categories;

  CardsLearningSettingsConfig({
    this.learnType = CardsLearnType.newWords,
    this.cardsStyleType = CardsStyleType.foreign,
    this.notes = const [],
    this.allCardsCount = 5,
    this.timesForLearn = 3,
    this.selectedCategory = "",
    this.categories = const [],
  });
}

class _CardsLearningSettingsScreenState
    extends State<CardsLearningSettingsScreen> {
  final NoteRepository _noteRepository = FirebaseNoteRepository();
  final NoteCategoryRepository _categoryRepository =
      FirebaseNoteCategoryRepository();
  late CardsLearningSettingsConfig config;

  @override
  void initState() {
    config = widget.config;
    _noteRepository.setupRepository();
    _categoryRepository.setupRepository();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LearningSettingsBloc>(
          create: (context) =>
              LearningSettingsBloc(noteRepository: _noteRepository)
                ..add(
                  EditingLearningSettings(config),
                ),
        ),
        BlocProvider<CategoryListingBloc>(
          create: (context) =>
              CategoryListingBloc(categoryRepository: _categoryRepository)
                ..add(const LoadCategories()),
        ),
      ],
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 30, left: 24, right: 24),
          child: SizedBox(
            height: 50,
            child: LHButton(
                text: "Apply",
                onPressed: () {
                  Navigator.of(context).pop([config]);
                }),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              backgroundColor: Theme.of(context).colorScheme.background,
              pinned: true,
              floating: true,
              snap: true,
              stretch: true,
              elevation: 0,
              shadowColor: Colors.transparent,
              centerTitle: false,
              title: LHText(
                text: "Learning settings",
                textType: LHTextType.header,
                textAlign: TextAlign.left,
                textColor: Theme.of(context).colorScheme.onBackground,
              ),
              leading: IconButton(
                icon: const Icon(Symbols.arrow_back_ios_new_rounded),
                onPressed: () => Navigator.of(context).pop(false),
              ),
            ),
          ],
          body: Padding(
            padding: const EdgeInsets.only(top: 16, left: 24, right: 24),
            child: BlocBuilder<LearningSettingsBloc, LearningSettingsState>(
              builder: (context, state) {
                return MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                height:
                                    (MediaQuery.of(context).size.width - 80) /
                                        3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: config.learnType ==
                                          CardsLearnType.newWords
                                      ? Theme.of(context).colorScheme.surface
                                      : Theme.of(context).colorScheme.secondary,
                                ),
                                child: Text(
                                  "Only\nnew\nwords",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: config.learnType ==
                                            CardsLearnType.newWords
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(context)
                                            .colorScheme
                                            .onSecondary,
                                  ),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  config.learnType = CardsLearnType.newWords;
                                  context.read<LearningSettingsBloc>().add(
                                        EditingLearningSettings(config),
                                      );
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                height:
                                    (MediaQuery.of(context).size.width - 64) /
                                        3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: config.learnType ==
                                          CardsLearnType.newAndLearnedWords
                                      ? Theme.of(context).colorScheme.surface
                                      : Theme.of(context).colorScheme.secondary,
                                ),
                                child: Text(
                                  "New\nand\nlearned\nwords",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: config.learnType ==
                                            CardsLearnType.newAndLearnedWords
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(context)
                                            .colorScheme
                                            .onSecondary,
                                  ),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  config.learnType =
                                      CardsLearnType.newAndLearnedWords;
                                  context.read<LearningSettingsBloc>().add(
                                        EditingLearningSettings(config),
                                      );
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                height:
                                    (MediaQuery.of(context).size.width - 64) /
                                        3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: config.learnType ==
                                          CardsLearnType.learnedWords
                                      ? Theme.of(context).colorScheme.surface
                                      : Theme.of(context).colorScheme.secondary,
                                ),
                                child: Text(
                                  "Only\nlearned\nwords",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: config.learnType ==
                                            CardsLearnType.learnedWords
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(context)
                                            .colorScheme
                                            .onSecondary,
                                  ),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  config.learnType =
                                      CardsLearnType.learnedWords;
                                  context.read<LearningSettingsBloc>().add(
                                        EditingLearningSettings(config),
                                      );
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: LHText(
                          text: "Cards style",
                          textType: LHTextType.title,
                          textAlign: TextAlign.left,
                          textColor: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                height:
                                    (MediaQuery.of(context).size.width - 80) /
                                        3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: config.cardsStyleType ==
                                          CardsStyleType.foreign
                                      ? Theme.of(context).colorScheme.surface
                                      : Theme.of(context).colorScheme.secondary,
                                ),
                                child: Text(
                                  "English\nvisible",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: config.cardsStyleType ==
                                            CardsStyleType.foreign
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(context)
                                            .colorScheme
                                            .onSecondary,
                                  ),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  config.cardsStyleType =
                                      CardsStyleType.foreign;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                height:
                                    (MediaQuery.of(context).size.width - 64) /
                                        3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: config.cardsStyleType ==
                                          CardsStyleType.native
                                      ? Theme.of(context).colorScheme.surface
                                      : Theme.of(context).colorScheme.secondary,
                                ),
                                child: Text(
                                  "Русский\nvisible",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: config.cardsStyleType ==
                                            CardsStyleType.native
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(context)
                                            .colorScheme
                                            .onSecondary,
                                  ),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  config.cardsStyleType = CardsStyleType.native;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                height:
                                    (MediaQuery.of(context).size.width - 64) /
                                        3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: config.cardsStyleType ==
                                          CardsStyleType.mixed
                                      ? Theme.of(context).colorScheme.surface
                                      : Theme.of(context).colorScheme.secondary,
                                ),
                                child: Text(
                                  "Mixed\nvisible",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: config.cardsStyleType ==
                                            CardsStyleType.mixed
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(context)
                                            .colorScheme
                                            .onSecondary,
                                  ),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  config.cardsStyleType = CardsStyleType.mixed;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Expanded(
                            child: LHText(
                              text: "Cards count",
                              textType: LHTextType.title,
                              textAlign: TextAlign.left,
                              textColor:
                                  Theme.of(context).colorScheme.onBackground,
                            ),
                          ),
                          CounterView(
                            initNumber: config.allCardsCount,
                            counterCallback: (value) {
                              setState(() {
                                config.allCardsCount = value;
                                context.read<LearningSettingsBloc>().add(
                                      EditingLearningSettings(config),
                                    );
                              });
                            },
                            increaseCallback: () {},
                            decreaseCallback: () {},
                            minNumber: 3,
                            maxNumber: 15,
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Expanded(
                            child: LHText(
                              text: "Times approved words\nto make it learned",
                              textType: LHTextType.standard,
                              textAlign: TextAlign.left,
                              textColor:
                                  Theme.of(context).colorScheme.onBackground,
                            ),
                          ),
                          CounterView(
                            initNumber: config.timesForLearn,
                            counterCallback: (value) {
                              setState(() {
                                config.timesForLearn = value;
                              });
                            },
                            increaseCallback: () {},
                            decreaseCallback: () {},
                            minNumber: 1,
                            maxNumber: 10,
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      BlocBuilder<CategoryListingBloc, CategoryListingState>(
                          builder: (context, state) {
                        if (state is CategoryListingSuccess) {
                          config.categories = state.categories;
                          return Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: LHText(
                                  text: "Category",
                                  textType: LHTextType.title,
                                  textAlign: TextAlign.left,
                                  textColor: Theme.of(context)
                                      .colorScheme
                                      .onBackground
                                      .withOpacity(0.7),
                                ),
                              ),
                              const SizedBox(height: 24),
                              LNChipsMultiline(
                                categories: state.categories,
                                callback: (model) {},
                                tapCallBack: (string) {
                                  config.selectedCategory = string;

                                  context.read<LearningSettingsBloc>().add(
                                        EditingLearningSettings(config),
                                      );
                                },
                                isAddNewCategoryButton: false,
                              ),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      }),
                      const SizedBox(height: 30),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: LHText(
                          text: "Words to practice",
                          textType: LHTextType.title,
                          textAlign: TextAlign.left,
                          textColor: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Builder(builder: (constext) {
                        if (state is LearningSettingsSuccess) {
                          config.notes = state.notes;
                          return ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: state.notes.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return NoteSettingsCell(
                                  note: state.notes[index],
                                  category: config.categories
                                      .firstWhere(
                                        (x) => (x.id ==
                                            config.notes[index].categoryId),
                                        orElse: () => const NoteCategoryModel(
                                            id: "", name: ""),
                                      )
                                      .name,
                                );
                              });
                        } else if (state is LearningSettingsInitial) {
                          return ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: config.notes.length,
                              itemBuilder: (context, index) {
                                return NoteSettingsCell(
                                    note: config.notes[index]);
                              });
                        } else {
                          return const Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                      })
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
