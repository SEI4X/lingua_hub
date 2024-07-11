import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingua_notes/blocs/note_list/add_new_note/add_new_note_bloc.dart';
import 'package:lingua_notes/blocs/note_list/categories/categories_bloc.dart';
import 'package:lingua_notes/core/components/chips_multiline.dart';
import 'package:lingua_notes/core/components/standard_button.dart';
import 'package:lingua_notes/core/components/text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:notes_repository/notes_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/components/checkbox.dart';

class NewNoteScreen extends StatefulWidget {
  const NewNoteScreen(
      {super.key, required this.callback, required this.categories});

  final Function callback;
  final List<NoteCategoryModel> categories;

  @override
  State<NewNoteScreen> createState() => _NewNoteScreenState();
}

class _NewNoteScreenState extends State<NewNoteScreen> {
  final wordController = TextEditingController();
  final translateController = TextEditingController();
  final transcriptionController = TextEditingController();
  final notesController = TextEditingController();
  late final _standardWidth = MediaQuery.of(context).size.width * 0.9;
  String? _errorMessage;
  bool _isAutoTranslateSelected = false;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  late List<NoteCategoryModel> categories = [];
  String selectedCategoryId = "";

  @override
  void initState() {
    super.initState();
    categories = widget.categories;
  }

  late var snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    content: Text(AppLocalizations.of(context)!.newNoteAdded),
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AddNewNoteBloc, AddNewNoteState>(
          listener: (context, state) {
            if (state is NewNoteAddingSuccess) {
              widget.callback;
              setState(() {
                _isLoading = false;
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Navigator.pop(context, [true]);
              });
            } else if (state is NewNoteAddingFailure) {
              setState(() {
                _isLoading = false;
                _errorMessage = AppLocalizations.of(context)!.emptyTextfield;
              });
            } else if (state is AddNewNoteProcess) {
              setState(() {
                _isLoading = true;
              });
            }
          },
        ),
        BlocListener<CategoryListingBloc, CategoryListingState>(
          listener: (context, state) {
            if (state is CategoryListingSuccess) {
              setState(() {
                _isLoading = false;
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                if (state.categories.isEmpty) {
                  context
                      .read<CategoryListingBloc>()
                      .add(const LoadCategories());
                } else {
                  setState(() {
                    categories = state.categories;
                  });
                }
              });
            }
          },
        ),
      ],
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.8,
          ),
          child: SingleChildScrollView(
            child: Wrap(children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewPadding.bottom, top: 24),
                child: Container(
                  alignment: Alignment.topCenter,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: _standardWidth,
                          child: Text(
                            AppLocalizations.of(context)!.addingNote,
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Word or phrase
                        SizedBox(
                          width: _standardWidth,
                          child: LNTextField(
                            controller: wordController,
                            hintText:
                                "${AppLocalizations.of(context)!.enterWordOrPhrase} *",
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            errorMsg: _errorMessage,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .emptyTextfield;
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Auto-translate
                        SizedBox(
                          width: _standardWidth,
                          child: LabeledCheckbox(
                            isActive: _isAutoTranslateSelected,
                            label: AppLocalizations.of(context)!.autoTranslate,
                            padding: const EdgeInsets.all(0),
                            value: _isAutoTranslateSelected,
                            onChanged: (bool newValue) {
                              null;
                              // setState(() {
                              //   _isAutoTranslateSelected = newValue;
                              // });
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Translate
                        SizedBox(
                          width: _standardWidth,
                          child: LNTextField(
                            controller: translateController,
                            hintText:
                                "${AppLocalizations.of(context)!.translate} *",
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            errorMsg: _errorMessage,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .emptyTextfield;
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Transcription
                        SizedBox(
                          width: _standardWidth,
                          child: LNTextField(
                            controller: transcriptionController,
                            hintText:
                                AppLocalizations.of(context)!.transcription,
                            obscureText: false,
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Cathegories
                        SizedBox(
                          width: _standardWidth,
                          child: Text(
                            AppLocalizations.of(context)!.selectCategory,
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(0.6),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: _standardWidth,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: LNChipsMultiline(
                              categories: categories,
                              callback: (category) {
                                context
                                    .read<CategoryListingBloc>()
                                    .add(AddNewCategory(category));
                              },
                              tapCallBack: (categoryId) {
                                setState(() {
                                  selectedCategoryId = categoryId;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Some notes
                        SizedBox(
                          width: _standardWidth,
                          child: LNTextField(
                            controller: notesController,
                            hintText: AppLocalizations.of(context)!.someNotes,
                            obscureText: false,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            minLines: 5,
                            maxLines: 5,
                          ),
                        ),
                        const SizedBox(height: 16),
                        // New note button
                        SizedBox(
                          width: _standardWidth,
                          height: 50,
                          child: LHButton(
                            text: AppLocalizations.of(context)!.addNewNote,
                            onPressed: () {
                              var note = NoteModel(
                                originalText: wordController.text,
                                translatedText: translateController.text,
                                transcription: transcriptionController.text,
                                categoryId: selectedCategoryId,
                                learnCount: 0,
                                createDate: Timestamp.now(),
                                isAutoTranslated: _isAutoTranslateSelected,
                                notes: notesController.text,
                                isLearned: false,
                              );
                              if (_formKey.currentState!.validate()) {
                                context
                                    .read<AddNewNoteBloc>()
                                    .add(AddNewNoteRequired(note));
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
