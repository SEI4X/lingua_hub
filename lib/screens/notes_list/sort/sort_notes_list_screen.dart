import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lingua_notes/core/components/standard_button.dart';

enum SortByType { none, newFirst, oldFirst, nameAZ, nameZA }

class SortNotesListScreen extends StatefulWidget {
  const SortNotesListScreen(
      {super.key, this.currentSortType = SortByType.none});

  final SortByType? currentSortType;

  @override
  State<SortNotesListScreen> createState() => _SortNotesListScreenState();
}

class _SortNotesListScreenState extends State<SortNotesListScreen> {
  final notesController = TextEditingController();
  late SortByType? _sortType = widget.currentSortType;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.sortBy,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    RadioListTile<SortByType>(
                      title: Text(
                        AppLocalizations.of(context)!.none,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      value: SortByType.none,
                      groupValue: _sortType,
                      onChanged: (SortByType? value) {
                        setState(() {
                          _sortType = value;
                        });
                      },
                      activeColor: Theme.of(context).colorScheme.primary,
                    ),
                    RadioListTile<SortByType>(
                      title: Text(
                        AppLocalizations.of(context)!.newFirst,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      value: SortByType.newFirst,
                      groupValue: _sortType,
                      onChanged: (SortByType? value) {
                        setState(() {
                          _sortType = value;
                        });
                      },
                      activeColor: Theme.of(context).colorScheme.primary,
                    ),
                    RadioListTile<SortByType>(
                      title: Text(
                        AppLocalizations.of(context)!.oldFirst,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      value: SortByType.oldFirst,
                      groupValue: _sortType,
                      onChanged: (SortByType? value) {
                        setState(() {
                          _sortType = value;
                        });
                      },
                      activeColor: Theme.of(context).colorScheme.primary,
                    ),
                    RadioListTile<SortByType>(
                      title: Text(
                        AppLocalizations.of(context)!.nameAZ,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      value: SortByType.nameAZ,
                      groupValue: _sortType,
                      onChanged: (SortByType? value) {
                        setState(() {
                          _sortType = value;
                        });
                      },
                      activeColor: Theme.of(context).colorScheme.primary,
                    ),
                    RadioListTile<SortByType>(
                      title: Text(
                        AppLocalizations.of(context)!.nameZA,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      value: SortByType.nameZA,
                      groupValue: _sortType,
                      onChanged: (SortByType? value) {
                        setState(() {
                          _sortType = value;
                        });
                      },
                      activeColor: Theme.of(context).colorScheme.primary,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 10),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: LHButton(
                          text: AppLocalizations.of(context)!.apply,
                          onPressed: () {
                            Navigator.pop(context, [_sortType]);
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
