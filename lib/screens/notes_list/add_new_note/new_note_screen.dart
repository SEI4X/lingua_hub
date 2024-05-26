import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingua_notes/blocs/note_list/add_new_note/add_new_note_bloc.dart';
import 'package:lingua_notes/core/components/chips_multiline.dart';
import 'package:lingua_notes/core/components/text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:notes_repository/notes_repository.dart';

import '../../../core/components/checkbox.dart';

class NewNoteScreen extends StatefulWidget {
  const NewNoteScreen({super.key});

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

  late var snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    content: Text(AppLocalizations.of(context)!.sentByEmail),
  );

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddNewNoteBloc, AddNewNoteState>(
      listener: (context, state) {
        if (state is NewNoteAddingSuccess) {
          setState(() {
            _isLoading = false;
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Navigator.pop(context);
          });
        } else if (state is NewNoteAddingFailure) {
          setState(() {
            _isLoading = false;
            _errorMessage =
                AppLocalizations.of(context)!.invalidEmailOrPassword;
          });
        } else if (state is AddNewNoteProcess) {
          setState(() {
            _isLoading = true;
          });
        }
      },
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
                  child: !_isLoading
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: _standardWidth,
                              child: Text(
                                AppLocalizations.of(context)!.addingNote,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
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
                                        .incorrectEmail;
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
                                isActive: false,
                                label:
                                    AppLocalizations.of(context)!.autoTranslate,
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
                                        .incorrectEmail;
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
                                errorMsg: _errorMessage,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .incorrectEmail;
                                  } else {
                                    return null;
                                  }
                                },
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
                              child: const Align(
                                alignment: Alignment.topLeft,
                                child: LNChipsMultiline(),
                              ),
                            ),
                            const SizedBox(height: 16),
                            // Some notes
                            SizedBox(
                              width: _standardWidth,
                              child: LNTextField(
                                controller: notesController,
                                hintText:
                                    AppLocalizations.of(context)!.translate,
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
                              child: TextButton(
                                onPressed: () {
                                  var note = NoteModel(
                                    originalText: wordController.text,
                                    translatedText:
                                        transcriptionController.text,
                                    categoryId: '0',
                                    learnCount: 0,
                                    createDate:
                                        DateTime.now().toUtc().toString(),
                                    isAutoTranslated: _isAutoTranslateSelected,
                                    isLearned: false,
                                  );
                                  if (_formKey.currentState!.validate()) {
                                    context
                                        .read<AddNewNoteBloc>()
                                        .add(AddNewNoteRequired(note));
                                  }
                                },
                                style: TextButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor:
                                        Theme.of(context).colorScheme.primary,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(60))),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 3, top: 10, bottom: 10),
                                  child: Text(
                                    AppLocalizations.of(context)!.addNewNote,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : const CircularProgressIndicator(),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
